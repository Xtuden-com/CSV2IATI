from lxml import etree as ET
import string

tree = ET.parse("./iati-activities-schema.xsd")
tree2 = ET.parse("./iati-common.xsd")

namespaces = {
    'xsd': 'http://www.w3.org/2001/XMLSchema'
}

def get_element(element_name, indent='', top=False):
    element = tree.find("//xsd:element[@name='{0}']".format(element_name), namespaces=namespaces)
    if element is None:
        element = tree2.find("//xsd:element[@name='{0}']".format(element_name), namespaces=namespaces)
    if element is None: return

    if not top:
        attribute_loop(element, indent)

    ext = element.find("xsd:complexType/xsd:simpleContent/xsd:extension", namespaces=namespaces)
    if ext is not None:
        if ext.attrib['base'] in ['xsd:anyURI', 'xsd:string']:
            print_column_info('text', indent)
        else: raise Exception, ext.attrib['base']


    element_loop(element, indent)

def print_column_info(name, indent='', required=False):
    print indent+"'{0}':".format(name)
    print indent+"  datatype: 'column'"
    if required: print indent+"  required: true"
    else: print indent+"  required: false"

def element_loop(top, indent=''):
    def print_info(name):
        print indent+"'{0}':".format(name)
        print indent+"  datatype: 'compound'"
        print indent+"  label: '{0}'".format(string.capwords(name.replace('-', ' ')))
        print indent+"  fields:"
    #print top.find(".//xsd:documentation", namespaces=namespaces).text
    for element in ( top.findall('xsd:complexType/xsd:choice/xsd:element', namespaces=namespaces)
        + top.findall("xsd:complexType/xsd:all/xsd:element", namespaces=namespaces) ):
        a = element.attrib
        if 'name' in a:
            print_info(a['name'])
            attribute_loop(element, indent+'    ')
            element_loop(element, indent+'    ')
        else:
            print_info(a['ref'])
            get_element(a['ref'], indent=indent+'    ')



def attribute_loop(element, indent=''):
    if element.find("xsd:complexType[@mixed='true']", namespaces=namespaces) is not None:
        print_column_info('text', indent)
        
    a = element.attrib
    if 'type' in a:
        if a['type'] in ['plainType','textType','codeType','codeReqType','currencyType','dateType']:
            print_column_info('text', indent+'  ')
            if a['type'] == 'codeReqType':
                print_column_info('code', indent+'  ', True)
            if a['type'] == 'codeType':
                print_column_info('code', indent+'  ', False)
        else: raise Exception, a['type']

    for attribute in element.findall('xsd:complexType/xsd:attribute', namespaces=namespaces):
        print_column_info( attribute.get('ref') or attribute.get('name'), indent, attribute.get('use') == 'required' )

print "DEFAULT_FIELD_SETUP ="
get_element('iati-activity', '  ', True)
print

print "DIMENSION_META ="

