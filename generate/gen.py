from lxml import etree as ET
import string

tree = ET.parse("./iati-activities-schema.xsd")
tree2 = ET.parse("./iati-common.xsd")

namespaces = {
    'xsd': 'http://www.w3.org/2001/XMLSchema'
}

# Ignore reporting org, because that information will come from the oranisation
# tab in the modeleditor
blacklisted_elements = ['reporting-org']

import re

def htmlize(s):
    return '<p>'+re.sub('\n\n', '\n</p><p>\n', re.sub(r'(https?://[^ \t\r\n]*)',
                  r'<a href="\1" target="_blank">\1</a>',
                  s))+'</p>'


def get_element(element_name, indent='', top=False, doc=False):
    element = tree.find("//xsd:element[@name='{0}']".format(element_name), namespaces=namespaces)
    if element is None:
        element = tree2.find("//xsd:element[@name='{0}']".format(element_name), namespaces=namespaces)
    if element is None: return

    if doc:
        print "  '{0}':".format(element_name)
        print "    fixedDataType:true"
        print "    helpText: '''"
        print htmlize(element.find(".//xsd:documentation", namespaces=namespaces).text)
        print "              '''"

    if not doc or top:
        element_loop(element, indent, doc, top=top)


def print_column_info(name, indent='', required=False):
    print indent+"'{0}':".format(name)
    print indent+"  datatype: 'column'"
    if required: print indent+"  required: true"
    else: print indent+"  required: false"

def element_loop(element, indent='', doc=False, top=False):
    if not doc:
        if not top:
            attribute_loop(element, indent)

        ext = element.find("./xsd:complexType/xsd:simpleContent/xsd:extension", namespaces=namespaces)
        if ext is not None:
            if ext.attrib['base'] in ['xsd:anyURI', 'xsd:string', 'xsd:decimal']:
                print_column_info('text', indent)
            else: raise Exception, ext.attrib['base']

    def print_info(name):
        print indent+"'{0}':".format(name)
        print indent+"  datatype: 'compound'"
        print indent+"  label: '{0}'".format(string.capwords(name.replace('-', ' ')))
        print indent+"  fields:"
    for child in ( element.findall('xsd:complexType/xsd:choice/xsd:element', namespaces=namespaces)
        + element.findall("xsd:complexType/xsd:all/xsd:element", namespaces=namespaces) ):
        a = child.attrib
        if 'name' in a:
            if not doc:
                print_info(a['name'])
            element_loop(child, indent+'    ',doc=doc)
        else:
            if not a['ref'] in blacklisted_elements:
                if not doc:
                    print_info(a['ref'])
                get_element(a['ref'], indent+'    ',doc=doc)

def attribute_loop(element, indent=''):
    if element.find("xsd:complexType[@mixed='true']", namespaces=namespaces) is not None:
        print_column_info('text', indent)
        
    a = element.attrib
    if 'type' in a:
        if a['type'] in ['plainType','textType','codeType','codeReqType','currencyType','dateType','xsd:anyURI','xsd:decimal']:
            print_column_info('text', indent+'  ')
            if a['type'] == 'codeReqType':
                print_column_info('code', indent+'  ', True)
            if a['type'] == 'codeType':
                print_column_info('code', indent+'  ', False)
            if a['type'] == 'currencyType':
                print_column_info('currency', indent+'  ', False)
                print_column_info('value-date', indent+'  ', False)
            if a['type'] == 'dateType':
                print_column_info('iso-date', indent+'  ', False)
        else: raise Exception, a['type']

    for attribute in (
        element.findall('xsd:complexType/xsd:attribute', namespaces=namespaces) +
        element.findall('xsd:complexType/xsd:simpleContent/xsd:extension/xsd:attribute', namespaces=namespaces)
        ):
        print_column_info( attribute.get('ref') or attribute.get('name'), indent, attribute.get('use') == 'required' )

print "DEFAULT_FIELD_SETUP ="
get_element('iati-activity', '  ', True)
print

print "DIMENSION_META ="
get_element('iati-activity', '  ', True, True)
print

