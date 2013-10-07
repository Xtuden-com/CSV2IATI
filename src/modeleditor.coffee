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
    'iati-identifier': {}
    'title': {}
    'description': {}
    'activity-status': {}
    'activity-date-start':
      datatype: 'compound'
      label: 'Activity Start Date'
      'iati-field':'activity-date'
      fields: 
        'type':
            'constant': 'start-planned'
            'datatype': 'constant'
        'iso-date': {}
        'text': {}
    'activity-date-end':
      datatype: 'compound'
      label: 'Activity End Date'
      'iati-field':'activity-date'
      fields: 
        'type':
            'constant': 'end-planned'
            'datatype': 'constant'
        'iso-date': {}
        'text': {}
    'recipient-country': {}
    'recipient-region': {}
    'funding-organisation':
      datatype: 'compound'
      'iati-field': 'participating-org'
      label: 'Funding Organisation'
      fields:
        'role':
            'constant': 'Funding'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'type': {}
    'extending-organisation':
      datatype: 'compound'
      'iati-field': 'participating-org'
      label: 'Extending Organisation'
      fields:
        'role':
            'constant': 'Extending'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'type': {}
    'implementing-organisation':
      datatype: 'compound'
      'iati-field': 'participating-org'
      label: 'Implementing Organisation'
      fields:
        'role':
            'constant': 'Implementing'
            'datatype': 'constant'
        'text': {}
        'ref': {}
        'type': {}
    sector: {}
    transaction: {}

for key,value of DEFAULT_MODEL.mapping
  if $.isEmptyObject(value)
    $.extend(value, DEFAULT_FIELD_SETUP[key])
    value['iati-field'] = key
    

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
    '.add_field change': 'onAddFieldClick'
    '.field_add_alternative click': 'onAddAlternativeClick'
    '.field_add_transform click': 'onAddTransformClick'
    '.field_remove_transform click': 'onRemoveTransformClick'
    '.field_switch_constant change': 'onFieldSwitchConstantClick'
    '.field_switch_column change': 'onFieldSwitchColumnClick'
    '.field_rm click': 'onFieldRemoveClick'
    '.delete_dimension click': 'onDeleteDimensionClick'
    '.delete_tdatafield click': 'onDeleteTDataFieldClick'
    '.column change' : 'onColumnChange'
    '.show_advanced click': 'onShowAdvanced'

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
   
    # Default fields
    @default_fields = DEFAULT_FIELD_SETUP?[@iati_field] or {}

    # Prepopulate field-less non-value dimensions with a label field
    if @data.datatype isnt 'value' and 'fields' not of @data
      @data.fields = {'label': {'datatype': 'string'}}

    @element.html($.tmpl('tpl_dimension', this))
    @element.trigger('fillColumnsRequest', [@element.find('select.column')])
    @element.trigger('fillIATIfieldsRequest', [$(document).find('select.iati_field_add')])

    formObj = {'mapping': {}}
    formObj['mapping'][@name] = @data

    for k, v of util.flattenObject(formObj)
      @element.find("[name=\"#{k}\"]").val(v)

  formFieldPrefix: () =>
    "mapping[#{@name}][fields]"
    
  formFieldRequired: (fieldName,fieldParent) =>
    if (fieldParent)
        FIELDS_META[fieldName]?['required'] or false
    else
        false

  formFieldRequired2: (fieldName, fieldParent, transactionField) =>
    #NB that fieldParent is the IATI field here
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
    name = e.currentTarget.value
    curRow = $(e.currentTarget).parents('tr').first()
    try
      # FIXME
      default_fields_fields = eval('this.default_fields'+curRow.attr('data-prefix').replace('mapping['+@name+']','').replace(/\[/g,'["').replace(/\]/g,'"]'))
    catch error
      default_fields_fields = {}
    if name == ''
      return false
    else if name == 'customnested'
      return @onAddNestedElClick(e)
    else if name == 'custom'
      name = prompt("Field name:").trim()
    else if name of default_fields_fields and default_fields_fields[name].datatype == 'compound'
      return @onAddNestedElClick(e)
    row = this._makeFieldRow(name, curRow.data('prefix'), curRow.data('level'))
    row.insertBefore(curRow)
    @element.trigger('fillColumnsRequest', [row.find('select.column')])
    return false
  
  onAddNestedElClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    name = e.currentTarget.value
    if name =='customnested'
      name = prompt("Element name:").trim()
    prefix = curRow.data('prefix')
    level = curRow.data('level')
    data = {'fields':{}}
    try
      # FIXME
      default_fields_fields = eval('this.default_fields'+curRow.attr('data-prefix').replace('mapping['+@name+']','').replace(/\[/g,'["').replace(/\]/g,'"]'))
    catch error
      default_fields_fields = {}
    if name of default_fields_fields
      data['fields'][name] = default_fields_fields[name]
    else
      data['fields'][name] = {
        'datatype':'compound'
        'label':name
        'iati_field':name
        'fields': {}
      }
    #data.fields[name].fields = {}
    row = $.tmpl 'tpl_table_recursive',
      'data': data
      'dimensionName': ''
      'prefix2': ''
      'iati_field': ''
      'prefix': prefix
      'level': level
      'formFieldRequired2': @formFieldRequired2
      'default_fields': @default_fields
    row.insertBefore(curRow)
    #@element.trigger('fillColumnsRequest', [row.find('select.column')])
    # This involves refreshing the whole dimension, but works
    @element.parents('form').first().change()
    return false

  onDeleteDimensionClick: (e) ->
    theform = @element.parents('form').first()
    $(e.currentTarget).parents('fieldset').first().remove()
    theform.change()
    return false

  onDeleteTDataFieldClick: (e) ->
    theform = @element.parents('form').first()
    $(e.currentTarget).parents('fieldset').first().remove()
    theform.change()
    return false
    
  onColumnChange: (e) ->
    curDimension = $(e.currentTarget).parents('fieldset').first()
    dimension_name = curDimension.data('dimension-name')
    dimension_data = curDimension.serializeObject()['mapping']
    thiscolumn = $(e.currentTarget).val()   
    construct_iatifield = this.doIATIFieldSample(dimension_name, dimension_data,thiscolumn)
    curDimension.find('span').first().html('Sample data: <code></code>')
    curDimension.find('span code').first().text(construct_iatifield)
    @element.parents('form').first().change()
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
  
  onFieldRemoveClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    prefix = curRow.attr('data-prefix')+'['+curRow.attr('data-field-name')+']'
    $(e.currentTarget).parents('tbody').first().children('[data-prefix^="'+prefix+'"]').remove()
    $(e.currentTarget).parents('tbody').first().children('[name^="'+prefix+'"]').remove()
    curRow.next('.alternativesCounter').remove()
    curRow.remove()
    @element.parents('form').first().change()
    return false

  onAddAlternativeClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    prefix = @formFieldPrefix()
    fieldName = curRow.data('field-name')
    alternativesCounter = curRow.data('alternatives-counter')
    alternativesCounter += 1
    curRow.next('.alternativesCounter').first().val(alternativesCounter)
    curRow.after("<tr><td><input name=\"#{prefix}[#{fieldName}][alternatives][#{alternativesCounter}]\" value=\"test\" /></td></tr>") 
    @element.parents('form').first().change()
    return false

  onAddTransformClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    prefix = curRow.data('prefix')
    fieldName = curRow.data('field-name')
    curRow.after("<tr><td><input name=\"#{prefix}[#{fieldName}][text-transform-type]\" value=\"\" /></td></tr>") 
    @element.parents('form').first().change()
    return false

  onRemoveTransformClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curRow.find('.transform').remove()
    @element.parents('form').first().change()
    return false

  onFieldSwitchConstantClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    row = this._makeFieldRow(curRow.data('field-name'), curRow.data('prefix'), curRow.data('level'), curDimension.data('dimension-name'), iatiField, true)
    curRow.replaceWith(row)
    @element.parents('form').first().change()
    return false

  onFieldSwitchColumnClick: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curDimension = $(e.currentTarget).parents('fieldset').first()
    iatiField = $(e.currentTarget).parents('fieldset').first().find('.iatifield').val()
    row = this._makeFieldRow(curRow.data('field-name'), curRow.data('prefix'), curRow.data('level'), curDimension.data('dimension-name'), iatiField, false)
    curRow.replaceWith(row)
    @element.trigger('fillColumnsRequest', [row.find('select.column')])
    @element.parents('form').first().change()
    return false

  onShowAdvanced: (e) ->
    curRow = $(e.currentTarget).parents('tr').first()
    curRow.find('.advanced').toggle()
    return false

  promptAddDimensionNamed: (props, thename) ->
    return false
  
  dataSample: (columnName) ->
    (SAMPLE_DATA[columnName])

  _makeFieldRow: (name, prefix, level, dimensionName, iatiField, constant=false) ->
    tplName = if constant then 'tpl_dimension_field_const' else 'tpl_dimension_field'
    $.tmpl tplName,
      'fieldName': name
      'dimensionName': dimensionName
      'iatiField': iatiField
      'prefix': prefix
      'level': level
      'required': this.formFieldRequired
      field: {}

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
    '.copy_dimension click': 'onCopyDimensionClick'

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


  createName: (name) ->
    names = @widgets.map((x) -> x.name)
    while true
      if name in names
        name += '~'
      else
        return name

  onCopyDimensionClick: (e) ->
    fieldset = $(e.currentTarget).parents('fieldset').first()
    name = prompt("Give a unique name for your copy of this dimension (letters and numbers, no spaces):")
    data = {'mapping': {}}
    data['mapping'][name] = {}
    for widget in @widgets
        if widget.name == fieldset.data('dimension-name')
            data['mapping'][name] = widget.data
            break
    data['mapping'][name]['label'] = name
    this.addDimension(name.trim()).deserialize(data)
    return false

  promptAddDimension: (props) ->
    name = prompt("Give a unique name for your new dimension (letters and numbers, no spaces):", @createName(props['iati-field']))
    return false unless name
    data = {'mapping': {}}
    data['mapping'][name] = props
    iati_field = data['mapping'][name]['iati-field']
    data['mapping'][name] = DEFAULT_FIELD_SETUP[iati_field]
    data['mapping'][name]['label'] = name
    data['mapping'][name]['iati-field'] = iati_field
    w = this.addDimension(name.trim())
    w.deserialize(data)
    w.element.get(0).scrollIntoView()

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
    'multipleSectorsRequest': 'onMultipleSectorsSetup'
    'modelChange': 'onModelChange'
    'fillColumnsRequest': 'onFillColumnsRequest'
    'fillIATIfieldsRequest': 'onFillIATIfieldsRequest'
    '.steps > ul > li click': 'onStepClick'
    '.steps > ul > li > ul > li click': 'onStepDimensionClick'
    '.forms form submit': 'onFormSubmit'
    '.forms form change': 'onFormChange'
    '#showdebug click': 'onShowDebugClick'
    '#hidedebug click': 'onHideDebugClick'
    '.add_data_field click': 'onAddDataFieldClick'
    'doFieldSelectors' : 'onDoFieldSelectors'
    '#iatifields .availablebtn click': 'onIATIFieldsAvailableClick'
    '#iatifields .allbtn click': 'onIATIFieldsAllClick'

  constructor: (element, options) ->
    super
    
    
    $('#multiple_rows_selector').html(
      "<option value=''>One row per activity</option>" + ("<option value='#{x}'>Multiple #{x} rows per activity</option>" for x in @options.iatifields when x isnt '').join('\n')
    )
    
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
    $('#model_data').show()
    $(document).keydown( (event)->
      if event.which == 27
        $('#model_data').hide()
    )
    return false

  onHideDebugClick: (e) ->
    $('#model_data').hide()
    return false

  onFormChange: (e) ->
    return if @ignoreFormChange

    @data = @form.serializeObject()
    
    @element.trigger('doFieldSelectors', 'iatifield')
    @element.trigger('doFieldSelectors', 'column')
        
    @ignoreFormChange = true
    @element.trigger 'modelChange'
    @ignoreFormChange = false

  # Missnamed now
  onDoFieldSelectors: (e) ->
    key = e + 's_used'
    @options[key] = []
    used = @options[key]
    @form.find('.' + e).each ->
      iatiname = ($(this).val())
      if iatiname not in used
        used.push(iatiname)
    used.sort()

  onFormSubmit: (e) ->
    # Conversion...
    # Need to know:
    # 1) model file
    # 2) csv file
    ## these should be in hidden inputs, and then only submit those to the API
    # 3) conversion API address should be stored by the system, and the request should be handled by the server.
    e.preventDefault();
    api_address = 'api_convert';
    model_file = $('#convert_model_file_URL').val()
    csv_file = $('#convert_csv_file_URL').val()
    $.post(api_address, { csv_file: csv_file, model_file: model_file }, complete:(result) ->
        alert(result.status);
    , "json");
    return false;

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
      ('<li><a href="#' + "m1_dim_#{n}" + '">' + "#{@data['mapping'][n]['label']}</a>" for n in dimNames).join('\n')
    )

    $('#debug').text(JSON.stringify(@data, null, 2))


  onFillColumnsRequest: (elem) ->
    options = ["<option></option>", "<option disabled>Unused columns:</option>"]
    options = options.concat(( "<option value='#{x}'>#{x}</option>" for x in @options.columns when x not in @options.columns_used and x!='' ))
    options.push('<option disabled>Previously used columns:</option>')
    options = options.concat(( "<option value='#{x}'>#{x}</option>" for x in @options.columns_used when x!='' ))
    $(elem).html(
      options.join('\n')
    )

  onFillIATIfieldsRequest: (elem) ->
    options = ["<option>Add a new element</option>", "<option disabled>Unused elements:</option>"]
    options = options.concat(( "<option value='#{x}'>#{x}</option>" for x in @options.iatifields when x not in @options.iatifields_used and x!='' ))
    options.push('<option disabled>Previously used elements:</option>')
    options = options.concat(( "<option value='#{x}'>#{x}</option>" for x in @options.iatifields_used when x!='' ))
    $(elem).html(
      options.join('\n')
    )

$.plugin 'modelEditor', ModelEditor

this.ModelEditor = ModelEditor
