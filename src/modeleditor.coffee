SAMPLE_DATA = 
  "Project ID": "AGNA64"
  "Title Project": "WE CAN end violence against women in Afghanistan"
  "Short Descr Project": """The project is part of PIP P00115 which is the South Asia regional “We Can end violence against women campaign”. The objective is to challenge and change the patriarchal idea, beliefs, attitude, behaviour and practice that perpetuate violence against women. Project will take numbers of initiatives, which ultimately contribute to breaking the silence of domestic violence, which has huge prevalence all over the Afghan society. Under this project numbers of campaign initiatives will be taken to mobilise 2000 change makers and to make them aware about the issue and bring positive change in their personal attitudes, behaviours and practices."""
  "Project Starts": "1-May-07"
  "Project Ends": "31-Mar-11"
  "Level of Impact": "Country"
  "ISO CODE": "AF"
  "Loc of Impact":"Afghanistan"
  "Loc Info": " Kabul "
  "% Aim 1: Right to Sustainable Livelihoods": "-0"
  "% Aim 2: Right to Essential services": "-0"
  "% Aim 3: Right to Life and Security": "-0"
  "% Aim 4: Right to be heard": "10"
  "% Aim 5: Right to Equity": "90"
  " Expenditure prior to 2010/11": " 95,018 "
  "Expenditure in 2010/11": " 40,415 "
  " Revised Budget  in current and future years (£) ": "-0"
  "Total Value all years (£)": " 135,433 "

DEFAULT_MODEL =
  organisation: {}
  mapping:
    'iati-identifier':
      datatype: 'compound'
      'iati-field': 'iati-identifier'
      label: 'IATI Identifier'
      fields: 
        'text': {}
    'title':
      datatype: 'compound'
      'iati-field': 'title'
      label: 'Title'
      fields:
        'text': {}
    'description':
      datatype: 'compound'
      'iati-field': 'description'
      label: 'Description'
      fields:
        'text': {}
    'recipient-country':
      datatype: 'compound'
      'iati-field': 'recipient-country'
      label: 'Recipient Country'
      fields:
        'text': {}
        'code': {}
    'implementing-organisation':
      datatype: 'compound'
      'iati-field': 'participating-organisation'
      label: 'Implementing Organisation'
      fields:
        'role':
            'constant': 'implementing'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'datatype': {}
    'funding-organisation':
      datatype: 'compound'
      'iati-field': 'participating-organisation'
      label: 'Funding Organisation'
      fields:
        'role':
            'constant': 'funding'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'datatype': {}
    'extending-organisation':
      datatype: 'compound'
      'iati-field': 'participating-organisation'
      label: 'Extending Organisation'
      fields:
        'role':
            'constant': 'extending'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'datatype': {}
    sectors:
      datatype: 'compound'
      label: 'Sectors'
      'iati-field': 'sector'
      fields: 
        'text':
            'label': 'Name (text) of the sector'
        'code':
            'label': 'Code for the sector'
        'vocab':
            'label': 'Sector code vocabulary'
    transaction:
      datatype: 'transaction'
      label: 'Transactions'
      'iati-field':'transaction'
      'tdatafields':
          transaction_type: {
              "label":"Transaction type",
              "iati_field":"transaction-type",
              "datatype":"compound",
	          "fields": {
	              "text": {"constant":"Expenditure", "datatype":"constant"}
	              "code": {"constant":"E", "datatype":"constant"}
              }
          },
          transaction_value: {
              "label":"Transaction value",
              "iati_field":"value",
              "datatype":"compound",
	          "fields": {
	              "text": {}
	              "value-date": {}
              }
          }


DEFAULT_FIELD_SETUP =
  'iati-identifier':
    datatype: 'value'
    label: 'IATI Identifier'
    fields: 
        'text':
            required: true
  'title':
    datatype: 'value'
    label: 'Title'
    fields: 
        'text':
            required: true
  'description':
    datatype: 'value'
    label: 'Description'
    fields: 
        'text':
            required: true
  'sector':
    datatype: 'compound'
    label: 'Sectors'
    fields: 
        'code':
            required: true
        'vocab':
            required: false
        'text':
            required: false
  'transaction':
    datatype: 'transaction'
    label: 'Transaction'
    'tdatafields':
      'transaction-type': {
          "fields": {
              "text": {required: true}
              "code": {required: true}
          }
      },
      'transaction-value': {
          "fields": {
              "text": {required: true}
              "value-date": {required: true}
          }
      }


DIMENSION_META =
  'iati-identifier':
    fixedDataType: true
    helpText: '''
              The unique IATI Identifier for your project. This must appear only once in the file: there can not be two activities with the same IATI Identifier. The Identifier is normally composed of the reporting organisation's unique reference, followed by the organisation's internal project code.<br />E.g. an Oxfam project would be <code>GB-CHC-202918-<b>P00001</b></code>, where <code>P0001</code> is the project code.
              '''
  title:
    fixedDataType: true
    helpText: '''
              A short, human-readable title. May be repeated for different languages. 
              '''
    label: 'Title'
  description:
    fixedDataType: true
    helpText: '''
              A longer, human-readable description. May be repeated for different languages. 
              '''
  sector:
    fixedDataType:true
    field_type: 'compound'
    fields: 'code,text,vocab'
    helpText: '''
              The sectors in your dataset
              '''
  'recipient-country':
    fixedDataType:true
    
  transaction:
    fixedDataType:true
    field_type:'transaction'
    helpText: '''
              Transactions in your dataset
              '''
  'implementing-organisation':
    fixedDatType:true
    helpText: '''
              The organisation implementing the project
	      '''

FIELDS_META =
  label:
    required: true

String::dasherize = ->
  this.replace /_/g, "-"

util =
  # Turns a nested object into a flat mapping with PHP-like query string
  # parameters as keys.
  #
  # Examples
  #
  #   # Flatten a nested object structure
  #   flattenObject({'one': {'two': 'foo'}})
  #   # => Returns {'one[two]': 'foo'}
  #
  #   # Flatten an object containing arrays
  #   flattenObject({'list': [1,2,3]})
  #   # => Returns {'list[]': [1,2,3]}
  #
  # Returns the flattened object
  flattenObject: (obj) ->
    flat = {}

    pathStr = (path) ->
      ary = [path[0]]
      ary = ary.concat("[#{p}]" for p in path[1..-1])
      ary.join ''

    walk = (path, o) ->
      for key, value of o
        newpath = $.extend([], path)
        newpath.push(key)

        if $.type(value) is 'object'
          walk newpath, value
        else
          if $.type(value) is 'array'
            newpath.push ''

          flat[pathStr(newpath)] = value

    walk([], obj)
    flat

class Widget extends Delegator
  deserialize: (data) ->

class UniqueKeyWidget extends Widget
  events:
    'span click': 'onKeyClick'

  deserialize: (data) ->
    uniq = (data['dataset']?['unique_keys'] or [])

    availableKeys = []
    for k, v of data['mapping']
      if v['datatype'] isnt 'value'
        for fk, fv of v['fields']
          availableKeys.push("#{k}.#{fk}")
      else
        availableKeys.push(k)

    @keys = ({'name': k, 'used': k in uniq} for k in availableKeys)
    this.render()

  promptAddDimensionNamed: (props, thename) ->
    return false

  render: ->
    @element.html($.tmpl('tpl_unique_keys', {'keys': @keys}))

  onKeyClick: (e) ->
    idx = @element.find('span').index(e.currentTarget)
    @keys[idx]['used'] = not @keys[idx]['used']
    this.render()

    # Futzing with the DOM and adding form fields does not trigger form change
    # events, so we have to trigger them manually.
    @element.parents('form').first().change()

class DimensionWidget extends Widget
  events:
    '.add_field click': 'onAddFieldClick'
    '.field_switch_constant click': 'onFieldSwitchConstantClick'
    '.field_switch_column click': 'onFieldSwitchColumnClick'
    '.field_switch_constant_transaction click': 'onFieldSwitchConstantClickTransaction'
    '.field_switch_column_transaction click': 'onFieldSwitchColumnClickTransaction'
    '.field_rm click': 'onFieldRemoveClick'
    '.delete_dimension click': 'onDeleteDimensionClick'
    '.iatifield change' : 'onIATIFieldChange'
    '.column change' : 'onColumnChange'

  constructor: (name, container, options) ->
    @name = name
    el = $("<fieldset class='dimension' data-dimension-name='#{@name}'>
            </fieldset>").appendTo(container)

    super el, options

    @id = "#{@element.parents('.modeleditor').attr('id')}_dim_#{@name}"
    @element.attr('id', @id)
 
  deserialize: (data) ->
    @data = data['mapping']?[@name] or {}
    
    # Meta needs to be for the relevant iati-field 
    @iati_field = data['mapping']?[@name]['iati-field'] or ''
    @meta = DIMENSION_META[@iati_field] or {}
    
    # Prepopulate field-less non-value dimensions with a label field
    if @data.datatype isnt 'value' and 'fields' not of @data
      @data.fields = {'label': {'datatype': 'string'}}

    @element.html($.tmpl('tpl_dimension', this))
    @element.trigger('fillColumnsRequest', [@element.find('select.column')])
    @element.trigger('fillIATIfieldsRequest', [@element.find('select.iatifield')])

    formObj = {'mapping': {}}
    formObj['mapping'][@name] = @data

    for k, v of util.flattenObject(formObj)
      @element.find("[name=\"#{k}\"]").val(v)

  formFieldPrefix: (fieldName) =>
    "mapping[#{@name}][fields][#{fieldName}]"
    
  formFieldTransactionPrefix: (fieldName, transaction_field='', transaction_part='') =>
    # transaction_part is dimension (e.g. 'transactions')
    # transaction_field is the transactions sub-part (e.g. 'transaction-type')
    # fieldName is the attribute (e.g. 'text')
    "mapping[#{@name}][tdatafields][#{transaction_field}][fields][#{fieldName}]"

  formFieldRequired: (fieldName,fieldParent) =>
    if (fieldParent)
        FIELDS_META[fieldName]?['required'] or false
    else
        false

  formFieldRequired2: (fieldName, fieldParent, transactionField) =>
    #NB that fieldParent is the IATI field here
    #If it's a transaction field, look at the constituent bits of the transaction
    if (transactionField)
      if (fieldParent)
        if (DEFAULT_FIELD_SETUP[fieldParent])
          if ((DEFAULT_FIELD_SETUP[fieldParent]['tdatafields'][transactionField]) and (DEFAULT_FIELD_SETUP[fieldParent]['tdatafields'][transactionField]['fields'][fieldName]))
            DEFAULT_FIELD_SETUP[fieldParent]['tdatafields'][transactionField]['fields'][fieldName]?['required'] or false
          else
            false
        else
          false
      else
        FIELDS_META[fieldName]?['required'] or false
    else
      if (fieldParent)
        if (DEFAULT_FIELD_SETUP[fieldParent])
          if ((DEFAULT_FIELD_SETUP[fieldParent]['fields']) and (DEFAULT_FIELD_SETUP[fieldParent]['fields'][fieldName]))
            DEFAULT_FIELD_SETUP[fieldParent]['fields'][fieldName]?['required'] or false
          else
            false
        else
          false
      else
        FIELDS_META[fieldName]?['required'] or false

  onAddFieldClick: (e) ->
    name = prompt("Field name:").trim()
    row = this._makeFieldRow(name)
    row.appendTo(@element.find('tbody'))
    @element.trigger('fillColumnsRequest', [row.find('select.column')])
    return false
    
  onDeleteDimensionClick: (e) ->
    $(e.currentTarget).parents('fieldset').first().remove()
    @element.parents('form').first().change()
    return false
    
  onColumnChange: (e) ->
    curDimension = $(e.currentTarget).parents('fieldset').first()
    dimension_name = curDimension.data('dimension-name')
    dimension_data = curDimension.serializeObject()['mapping']
    thiscolumn = $(e.currentTarget).val()   
    construct_iatifield = this.doIATIFieldSample(dimension_name, dimension_data,thiscolumn)
    curDimension.find('span').first().html('Sample data: <code></code>')
    curDimension.find('span code').first().text(construct_iatifield)
    return false
  
  doIATIFieldSample: (dimension_name,dimension_data,thiscolumn) ->
    construct_iatifield = '<' + dimension_data[dimension_name]['iati-field']
    for k, v of dimension_data[dimension_name]['fields']
        if (k == 'text')
            if (v['datatype'] == 'constant')
                textdata = dimension_data[dimension_name]['fields'][k]['constant']
            else
                textdata = this.dataSample(dimension_data[dimension_name]['fields'][k]['column'])            
        else
            if (v['datatype'] == 'constant')
                samplevalue = dimension_data[dimension_name]['fields'][k]['constant']
            else
                samplevalue = this.dataSample(dimension_data[dimension_name]['fields'][k]['column'])
            construct_iatifield = construct_iatifield + ' ' + k + '="' + samplevalue + '"'
    if (textdata)
        construct_iatifield=construct_iatifield + ">" + textdata + "</" + dimension_data[dimension_name]['iati-field'] + ">"
    else
        construct_iatifield=construct_iatifield + "/>"
    return construct_iatifield
  
  # This needs to be removed - do not permit IATI Field changes (must delete and add a new dimension)
  onIATIFieldChange: (e) ->
    @element.parents('form').first().change()
    thisfield = $(e.currentTarget).val()
    @element.find('tbody tr').remove()
    thisfieldsfields = (DEFAULT_FIELD_SETUP[thisfield]['fields'])
    for k, v of thisfieldsfields
      row = this._makeFieldRowUpdate(k, thisfield, v['required'])
      row.appendTo(@element.find('tbody'))
      @element.trigger('fillColumnsRequest', [row.find('select.column')])
    return false

  onFieldRemoveClick: (e) ->
    $(e.currentTarget).parents('tr').first().remove()
    @element.parents('form').first().change()
    return false

  onFieldSwitchConstantClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    row = this._makeFieldRow(curRow.data('field-name'),curDimension.data('dimension-name'), iatiField, true)
    curRow.replaceWith(row)
    @element.parents('form').first().change()
    return false

  onFieldSwitchColumnClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    row = this._makeFieldRow(curRow.data('field-name'),curDimension.data('dimension-name'), iatiField, false)
    curRow.replaceWith(row)
    @element.trigger('fillColumnsRequest', [row.find('select.column')])
    @element.parents('form').first().change()
    return false

  onFieldSwitchConstantClickTransaction: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimensionPart = $(e.currentTarget).parents('fieldset')
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    newrow = this._makeFieldRowTransaction(curRow.data('field-name'),curDimensionPart.data('transaction-field-type'),curDimension.data('dimension-name'),iatiField,true)
    curRow.replaceWith(newrow)
    @element.trigger('fillColumnsRequest', [newrow.find('select.column')])
    @element.parents('form').first().change()
    return false

  onFieldSwitchColumnClickTransaction: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimensionPart = $(e.currentTarget).parents('fieldset')
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    newrow = this._makeFieldRowTransaction(curRow.data('field-name'),curDimensionPart.data('transaction-field-type'),curDimension.data('dimension-name'),iatiField,false)
    curRow.replaceWith(newrow)
    @element.trigger('fillColumnsRequest', [newrow.find('select.column')])
    @element.parents('form').first().change()
    return false
    
  promptAddDimensionNamed: (props, thename) ->
    return false
  
  dataSample: (columnName) ->
    (SAMPLE_DATA[columnName])

  _makeFieldRow: (name, dimensionName, iatiField, constant=false) ->
    tplName = if constant then 'tpl_dimension_field_const' else 'tpl_dimension_field'
    $.tmpl tplName,
      'fieldName': name
      'dimensionName': dimensionName
      'iatiField': iatiField
      'prefix': this.formFieldPrefix
      'required': this.formFieldRequired

  _makeFieldRowTransaction: (fieldname, transaction_field, dimension_name, iatiField, constant=false) ->
    tplName = if constant then 'tpl_dimension_field_const' else 'tpl_dimension_field'
    $.tmpl tplName,
      'fieldName': fieldname
      'transaction_field':transaction_field
      'transaction_part':dimension_name
      'prefix': this.formFieldTransactionPrefix
      'required': this.formFieldRequired
      'transaction':'yes'
      'iatiField':iatiField
      
  _makeFieldRowUpdate: (name, thisfield, requiredvar, constant=false) ->
    tplName = if constant then 'tpl_dimension_field_const' else 'tpl_dimension_field'
    $.tmpl tplName,
      'fieldName': name
      'prefix': this.formFieldPrefix
      'required': this.formFieldRequired2

class DimensionsWidget extends Delegator
  events:
    '.iati_field_add change': 'onAddIATIFieldClick'
    '.add_value_dimension click': 'onAddValueDimensionClick'
    '.add_compound_dimension click': 'onAddCompoundDimensionClick'

  constructor: (element, options) ->
    super

    @widgets = []
    @dimsEl = @element.find('.dimensions').get(0)

    @element.trigger('doFieldSelectors', 'iatifield')
    @element.trigger('doFieldSelectors', 'column')
  addDimension: (name) ->
    w = new DimensionWidget(name, @dimsEl)
    @widgets.push(w)
    return w

  removeDimension: (name) ->
    idx = null

    for w in @widgets
      if w.name is name
        idx = @widgets.indexOf(w)
        break

    if idx isnt null
      @widgets.splice(idx, 1)[0].element.remove()

  deserialize: (data) ->
    return if @ignoreParent

    dims = data['mapping'] or {}
    toRemove = []

    for widget in @widgets
      if widget.name of dims
        widget.deserialize(data)
        delete dims[widget.name]
      else
        toRemove.push(widget.name)

    # Remove any widgets not in dims
    for name in toRemove
      this.removeDimension(name)

    # Any keys left in dims need to be added
    for name, obj of dims
      this.addDimension(name).deserialize(data)

  promptAddDimension: (props) ->
    name = prompt("Give a unique name for your new dimension (letters and numbers, no spaces):")
    return false unless name
    data = {'mapping': {}}
    data['mapping'][name] = props
    iati_field = data['mapping'][name]['iati-field']
    data['mapping'][name] = DEFAULT_FIELD_SETUP[iati_field]
    data['mapping'][name]['label'] = 'User field: ' + name
    data['mapping'][name]['iati-field'] = iati_field
    this.addDimension(name.trim()).deserialize(data)

  promptAddDimensionNamed: (thename, props) ->
    alert("Column \"" + thename + "\" has been added.")
    name = thename
    return false unless name
    data = {'mapping': {}}
    data['mapping'][name] = props
    this.addDimension(name.trim()).deserialize(data)

  onAddValueDimensionClick: (e) ->
    this.promptAddDimension({'datatype': 'value'})
    return false

  onAddCompoundDimensionClick: (e) ->
    this.promptAddDimension({'datatype': 'compound'})
    return false

  onAddIATIFieldClick: (e) ->
    thefield = $(e.currentTarget).val()
    this.promptAddDimension({'datatype': 'compound','iati-field':thefield})
    $(e.currentTarget).val('')
    return false

class ModelEditor extends Delegator
  widgetTypes:
    '.unique_keys_widget': UniqueKeyWidget
    '.dimensions_widget': DimensionsWidget

  events:
    'modelChange': 'onModelChange'
    'fillColumnsRequest': 'onFillColumnsRequest'
    'fillIATIfieldsRequest': 'onFillIATIfieldsRequest'
    '.steps > ul > li click': 'onStepClick'
    '.steps > ul > li > ul > li click': 'onStepDimensionClick'
    '.forms form submit': 'onFormSubmit'
    '.forms form change': 'onFormChange'
    '#showdebug click': 'onShowDebugClick'
    '.add_data_field click': 'onAddDataFieldClick'
    'doFieldSelectors' : 'onDoFieldSelectors'
    '#columns .availablebtn click': 'onColumnsAvailableClick'
    '#columns .allbtn click': 'onColumnsAllClick'
    '#iatifields .availablebtn click': 'onIATIFieldsAvailableClick'
    '#iatifields .allbtn click': 'onIATIFieldsAllClick'

  constructor: (element, options) ->
    super
    if (@options.model_data)
        model_data = JSON.parse(@options.model_data)
    else
        model_data = DEFAULT_MODEL
    @data = $.extend(true, {}, model_data)
    @widgets = []

    @form = $(element).find('.forms form').eq(0)

    @id = @element.attr('id')
    if not @id?
      @id = Math.floor((Math.random()*0xffffffff)).toString(16)
      @element.attr('id', @id)

    # Precompile templates
    @element.find('script[type="text/x-jquery-tmpl"]').each  ->
      $(this).template($(this).attr('id'))

    # Initialize column select boxes
    @options.columns.unshift('')
    @element.find('select.iatifield').each ->
      $(this).trigger('fillColumnsRequest', [this])

    # Initialize iati select boxes
    @options.iatifields.unshift('')
    @element.find('select.iatifield').each ->
      $(this).trigger('fillIATIfieldsRequest', [this])

    # Initialize widgets
    for selector, ctor of @widgetTypes
      @widgets.push(new ctor(e)) for e in @element.find(selector).get()

    @element.trigger 'modelChange'
    this.setStep 0

  setStep: (s) ->
    $(@element).find('.steps > ul > li')
      .removeClass('active')
      .eq(s).addClass('active')
    $(@element).find('.forms div.formpart').hide().eq(s).show()

  onStepClick: (e) ->
    idx = @element.find('.steps > ul > li').index(e.currentTarget)
    this.setStep idx
    return false

  onAddDataFieldClick: (e) ->
    thevar = $(e.currentTarget).text() 
    for w in @widgets
        w.promptAddDimensionNamed(thevar,{'datatype': 'value','column':thevar,'label':thevar})
    @data = @form.serializeObject()
    @element.trigger 'modelChange'
    $(e.currentTarget).removeClass('add_data_field available').addClass('unavailable')

  onShowDebugClick: (e) ->
    if $('#debug').hasClass('debug-shown')
      $('#debug').slideUp().removeClass('debug-shown')
    else
      $('#debug').slideDown().addClass('debug-shown')
    return false

  onFormChange: (e) ->
    return if @ignoreFormChange

    @data = @form.serializeObject()
    @form.find('.column').each -> 
        columnname = ($(this).val())
        $('#user_columns ul li a').each ->
            if ($(this).text()) == columnname
                $(this).removeClass('available').addClass('unavailable')
    
    @element.trigger('doFieldSelectors', 'iatifield')
    @element.trigger('doFieldSelectors', 'column')
        
    @ignoreFormChange = true
    @element.trigger 'modelChange'
    @ignoreFormChange = false

  onColumnsAvailableClick: (e) ->
    $('#columns ul').addClass('hideunavailable')
    $('#columns .allbtn').removeClass('fieldsbuttons-selected')
    $('#columns .availablebtn').addClass('fieldsbuttons-selected')

  onColumnsAllClick: (e) ->
    $('#columns ul').removeClass('hideunavailable')
    $('#columns .availablebtn').removeClass('fieldsbuttons-selected')
    $('#columns .allbtn').addClass('fieldsbuttons-selected')

  onIATIFieldsAvailableClick: (e) ->
    $('#iatifields ul').addClass('hideunavailable')
    $('#iatifields .allbtn').removeClass('fieldsbuttons-selected')
    $('#iatifields .availablebtn').addClass('fieldsbuttons-selected')

  onIATIFieldsAllClick: (e) ->
    $('#iatifields ul').removeClass('hideunavailable')
    $('#iatifields .availablebtn').removeClass('fieldsbuttons-selected')
    $('#iatifields .allbtn').addClass('fieldsbuttons-selected')
    
  onDoFieldSelectors: (e) ->
    $('#' + e + 's ul li code').each ->
        if ($(this).hasClass('unavailable'))
            $(this).removeClass('unavailable')
            $(this).addClass('available')
    @form.find('.' + e).each -> 
        iatiname = ($(this).val())
        $('#' + e + 's ul li code').each ->
            if ($(this).text() == iatiname)
                $(this).removeClass('available')
                $(this).addClass('unavailable')

  onFormSubmit: (e) ->
    return false

  onModelChange: () ->
    # Populate straightforward bits
    for k, v of util.flattenObject(@data)
      # FIXME? this may not deal with complex form elements such as radio
      # buttons or <select multiple>.
      @form.find("[name=\"#{k}\"]").val(v)

    # Send updated model copy to each subcomponent, as more complex
    # components may not have been correctly filled out by the above.
    for w in @widgets
      w.deserialize($.extend(true, {}, @data))

    # Update dimension list in sidebar
    dimNames = (k for k, v of @data['mapping'])
    @element.find('.steps ul.steps_dimensions').html(
      ('<li><a href="#' + "m1_dim_#{n}" + '">' + "#{n.dasherize()}</a>" for n in dimNames).join('\n')
    )

    $('#debug').text(JSON.stringify(@data, null, 2).dasherize())


  onFillColumnsRequest: (elem) ->
    $(elem).html(
      ("<option name='#{x}'>#{x}</option>" for x in @options.columns).join('\n')
    )
  onFillIATIfieldsRequest: (elem) ->
    $(elem).html(
      ("<option name='#{x}'>#{x}</option>" for x in @options.iatifields).join('\n')
    )

$.plugin 'modelEditor', ModelEditor

this.ModelEditor = ModelEditor
