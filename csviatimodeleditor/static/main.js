(function() {
  var DEFAULT_FIELD_SETUP, DEFAULT_MODEL, DIMENSION_META, Delegator, DimensionWidget, DimensionsWidget, FIELDS_META, ModelEditor, SAMPLE_DATA, UniqueKeyWidget, Widget, util,
    __slice = Array.prototype.slice,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; },
    __indexOf = Array.prototype.indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Delegator = (function() {

    Delegator.prototype.events = {};

    Delegator.prototype.options = {};

    Delegator.prototype.element = null;

    function Delegator(element, options) {
      this.options = $.extend(true, {}, this.options, options);
      this.element = $(element);
      this.on = this.subscribe;
      this.addEvents();
    }

    Delegator.prototype.addEvents = function() {
      var event, functionName, sel, selector, _i, _ref, _ref2, _results;
      _ref = this.events;
      _results = [];
      for (sel in _ref) {
        functionName = _ref[sel];
        _ref2 = sel.split(' '), selector = 2 <= _ref2.length ? __slice.call(_ref2, 0, _i = _ref2.length - 1) : (_i = 0, []), event = _ref2[_i++];
        _results.push(this.addEvent(selector.join(' '), event, functionName));
      }
      return _results;
    };

    Delegator.prototype.addEvent = function(bindTo, event, functionName) {
      var closure, isBlankSelector,
        _this = this;
      closure = function() {
        return _this[functionName].apply(_this, arguments);
      };
      isBlankSelector = typeof bindTo === 'string' && bindTo.replace(/\s+/g, '') === '';
      if (isBlankSelector) bindTo = this.element;
      if (typeof bindTo === 'string') {
        this.element.delegate(bindTo, event, closure);
      } else {
        if (this.isCustomEvent(event)) {
          this.subscribe(event, closure);
        } else {
          $(bindTo).bind(event, closure);
        }
      }
      return this;
    };

    Delegator.prototype.isCustomEvent = function(event) {
      var natives;
      natives = "blur focus focusin focusout load resize scroll unload click dblclick\nmousedown mouseup mousemove mouseover mouseout mouseenter mouseleave\nchange select submit keydown keypress keyup error".split(/[^a-z]+/);
      event = event.split('.')[0];
      return $.inArray(event, natives) === -1;
    };

    Delegator.prototype.publish = function() {
      this.element.triggerHandler.apply(this.element, arguments);
      return this;
    };

    Delegator.prototype.subscribe = function(event, callback) {
      var closure;
      closure = function() {
        return callback.apply(this, [].slice.call(arguments, 1));
      };
      closure.guid = callback.guid = ($.guid += 1);
      this.element.bind(event, closure);
      return this;
    };

    Delegator.prototype.unsubscribe = function() {
      this.element.unbind.apply(this.element, arguments);
      return this;
    };

    return Delegator;

  })();

  $.plugin = function(name, object) {
    return jQuery.fn[name] = function(options) {
      var args;
      args = Array.prototype.slice.call(arguments, 1);
      return this.each(function() {
        var instance;
        instance = $.data(this, name);
        if (instance) {
          return options && instance[options].apply(instance, args);
        } else {
          instance = new object(this, options);
          return $.data(this, name, instance);
        }
      });
    };
  };

  $.a2o = function(ary) {
    var obj, walk;
    obj = {};
    walk = function(o, path, value) {
      var key;
      key = path[0];
      if (path.length === 2 && path[1] === '') {
        if ($.type(o[key]) !== 'array') o[key] = [];
        return o[key].push(value);
      } else if (path.length === 1) {
        return o[key] = value;
      } else {
        if ($.type(o[key]) !== 'object') o[key] = {};
        return walk(o[key], path.slice(1), value);
      }
    };
    $.each(ary, function() {
      var p, path;
      path = this.name.split('[');
      path = [path[0]].concat(__slice.call((function() {
          var _i, _len, _ref, _results;
          _ref = path.slice(1);
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            p = _ref[_i];
            _results.push(p.slice(0, -1));
          }
          return _results;
        })()));
      return walk(obj, path, this.value);
    });
    return obj;
  };

  $.fn.serializeObject = function() {
    var ary;
    ary = this.serializeArray();
    return $.a2o(ary);
  };

  SAMPLE_DATA = {
    "Project ID": "AGNA64",
    "Title Project": "WE CAN end violence against women in Afghanistan",
    "Short Descr Project": "The project is part of PIP P00115 which is the South Asia regional “We Can end violence against women campaign”. The objective is to challenge and change the patriarchal idea, beliefs, attitude, behaviour and practice that perpetuate violence against women. Project will take numbers of initiatives, which ultimately contribute to breaking the silence of domestic violence, which has huge prevalence all over the Afghan society. Under this project numbers of campaign initiatives will be taken to mobilise 2000 change makers and to make them aware about the issue and bring positive change in their personal attitudes, behaviours and practices.",
    "Project Starts": "1-May-07",
    "Project Ends": "31-Mar-11",
    "Level of Impact": "Country",
    "ISO CODE": "AF",
    "Loc of Impact": "Afghanistan",
    "Loc Info": " Kabul ",
    "% Aim 1: Right to Sustainable Livelihoods": "-0",
    "% Aim 2: Right to Essential services": "-0",
    "% Aim 3: Right to Life and Security": "-0",
    "% Aim 4: Right to be heard": "10",
    "% Aim 5: Right to Equity": "90",
    " Expenditure prior to 2010/11": " 95,018 ",
    "Expenditure in 2010/11": " 40,415 ",
    " Revised Budget  in current and future years (£) ": "-0",
    "Total Value all years (£)": " 135,433 "
  };

  DEFAULT_MODEL = {
    organisation: {},
    mapping: {
      'iati-identifier': {
        type: 'compound',
        'iati-field': 'iati-identifier',
        label: 'IATI Identifier',
        fields: {
          'text': {}
        }
      },
      'title': {
        type: 'compound',
        'iati-field': 'title',
        label: 'Title',
        fields: {
          'text': {}
        }
      },
      'description': {
        type: 'compound',
        'iati-field': 'description',
        label: 'Description',
        fields: {
          'text': {}
        }
      },
      'recipient-country': {
        type: 'compound',
        'iati-field': 'recipient-country',
        label: 'Recipient Country',
        fields: {
          'text': {},
          'code': {}
        }
      },
      'implementing-organisation': {
        type: 'compound',
        'iati-field': 'participating-organisation',
        label: 'Implementing Organisation',
        fields: {
          'role': {
            'constant': 'implementing',
            'datatype': 'constant'
          },
          'text': {},
          'ref': {},
          'type': {}
        }
      },
      'funding-organisation': {
        type: 'compound',
        'iati-field': 'participating-organisation',
        label: 'Funding Organisation',
        fields: {
          'role': {
            'constant': 'funding',
            'datatype': 'constant'
          },
          'text': {},
          'ref': {},
          'type': {}
        }
      },
      'extending-organisation': {
        type: 'compound',
        'iati-field': 'participating-organisation',
        label: 'Extending Organisation',
        fields: {
          'role': {
            'constant': 'extending',
            'datatype': 'constant'
          },
          'text': {},
          'ref': {},
          'type': {}
        }
      },
      sectors: {
        type: 'compound',
        label: 'Sectors',
        'iati-field': 'sector',
        fields: {
          'text': {
            'label': 'Name (text) of the sector'
          },
          'code': {
            'label': 'Code for the sector'
          },
          'vocab': {
            'label': 'Sector code vocabulary'
          }
        }
      },
      transaction: {
        type: 'transaction',
        label: 'Transactions',
        'iati-field': 'transaction',
        'transaction_data_fields': {
          transaction_type: {
            "label": "Transaction type",
            "iati_field": "transaction-type",
            "type": "compound",
            "fields": {
              "text": {
                "constant": "Expenditure",
                "type": "constant"
              },
              "code": {
                "constant": "E",
                "type": "constant"
              }
            }
          },
          transaction_value: {
            "label": "Transaction value",
            "iati_field": "value",
            "type": "compound",
            "fields": {
              "text": {},
              "value-date": {}
            }
          }
        }
      }
    }
  };

  DEFAULT_FIELD_SETUP = {
    'iati-identifier': {
      type: 'value',
      label: 'IATI Identifier',
      fields: {
        'text': {
          required: true
        }
      }
    },
    'title': {
      type: 'value',
      label: 'Title'
    },
    'description': {
      type: 'value',
      label: 'Description'
    },
    'sector': {
      type: 'compound',
      label: 'Sectors',
      fields: {
        'code': {
          required: true
        },
        'vocab': {
          required: false
        },
        'text': {
          required: false
        }
      }
    }
  };

  DIMENSION_META = {
    'iati-identifier': {
      fixedDataType: true,
      helpText: 'The unique IATI Identifier for your project. This must appear only once in the file: there can not be two activities with the same IATI Identifier. The Identifier is normally composed of the reporting organisation\'s unique reference, followed by the organisation\'s internal project code.<br />E.g. an Oxfam project would be <code>GB-CHC-202918-<b>P00001</b></code>, where <code>P0001</code> is the project code.'
    },
    title: {
      fixedDataType: true,
      helpText: 'A short, human-readable title. May be repeated for different languages. ',
      label: 'Title'
    },
    description: {
      fixedDataType: true,
      helpText: 'A longer, human-readable description. May be repeated for different languages. '
    },
    sector: {
      fixedDataType: true,
      field_type: 'compound',
      fields: 'code,text,vocab',
      helpText: 'The sectors in your dataset'
    },
    'recipient-country': {
      fixedDataType: true
    },
    transaction: {
      fixedDataType: true,
      field_type: 'transaction',
      helpText: 'Transactions in your dataset'
    },
    'implementing-organisation': {
      fixedDatType: true,
      helpText: 'The organisation implementing the project'
    }
  };

  FIELDS_META = {
    label: {
      required: true
    }
  };

  String.prototype.dasherize = function() {
    return this.replace(/_/g, "-");
  };

  util = {
    flattenObject: function(obj) {
      var flat, pathStr, walk;
      flat = {};
      pathStr = function(path) {
        var ary, p;
        ary = [path[0]];
        ary = ary.concat((function() {
          var _i, _len, _ref, _results;
          _ref = path.slice(1);
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            p = _ref[_i];
            _results.push("[" + p + "]");
          }
          return _results;
        })());
        return ary.join('');
      };
      walk = function(path, o) {
        var key, newpath, value, _results;
        _results = [];
        for (key in o) {
          value = o[key];
          newpath = $.extend([], path);
          newpath.push(key);
          if ($.type(value) === 'object') {
            _results.push(walk(newpath, value));
          } else {
            if ($.type(value) === 'array') newpath.push('');
            _results.push(flat[pathStr(newpath)] = value);
          }
        }
        return _results;
      };
      walk([], obj);
      return flat;
    }
  };

  Widget = (function(_super) {

    __extends(Widget, _super);

    function Widget() {
      Widget.__super__.constructor.apply(this, arguments);
    }

    Widget.prototype.deserialize = function(data) {};

    return Widget;

  })(Delegator);

  UniqueKeyWidget = (function(_super) {

    __extends(UniqueKeyWidget, _super);

    function UniqueKeyWidget() {
      UniqueKeyWidget.__super__.constructor.apply(this, arguments);
    }

    UniqueKeyWidget.prototype.events = {
      'span click': 'onKeyClick'
    };

    UniqueKeyWidget.prototype.deserialize = function(data) {
      var availableKeys, fk, fv, k, uniq, v, _ref, _ref2, _ref3;
      uniq = ((_ref = data['dataset']) != null ? _ref['unique_keys'] : void 0) || [];
      availableKeys = [];
      _ref2 = data['mapping'];
      for (k in _ref2) {
        v = _ref2[k];
        if (v['type'] !== 'value') {
          _ref3 = v['fields'];
          for (fk in _ref3) {
            fv = _ref3[fk];
            availableKeys.push("" + k + "." + fk);
          }
        } else {
          availableKeys.push(k);
        }
      }
      this.keys = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = availableKeys.length; _i < _len; _i++) {
          k = availableKeys[_i];
          _results.push({
            'name': k,
            'used': __indexOf.call(uniq, k) >= 0
          });
        }
        return _results;
      })();
      return this.render();
    };

    UniqueKeyWidget.prototype.promptAddDimensionNamed = function(props, thename) {
      return false;
    };

    UniqueKeyWidget.prototype.render = function() {
      return this.element.html($.tmpl('tpl_unique_keys', {
        'keys': this.keys
      }));
    };

    UniqueKeyWidget.prototype.onKeyClick = function(e) {
      var idx;
      idx = this.element.find('span').index(e.currentTarget);
      this.keys[idx]['used'] = !this.keys[idx]['used'];
      this.render();
      return this.element.parents('form').first().change();
    };

    return UniqueKeyWidget;

  })(Widget);

  DimensionWidget = (function(_super) {

    __extends(DimensionWidget, _super);

    DimensionWidget.prototype.events = {
      '.add_field click': 'onAddFieldClick',
      '.field_switch_constant click': 'onFieldSwitchConstantClick',
      '.field_switch_column click': 'onFieldSwitchColumnClick',
      '.field_switch_constant_transaction click': 'onFieldSwitchConstantClickTransaction',
      '.field_switch_column_transaction click': 'onFieldSwitchColumnClickTransaction',
      '.field_rm click': 'onFieldRemoveClick',
      '.delete_dimension click': 'onDeleteDimensionClick',
      '.iatifield change': 'onIATIFieldChange',
      '.column change': 'onColumnChange'
    };

    function DimensionWidget(name, container, options) {
      this.formFieldRequired2 = __bind(this.formFieldRequired2, this);
      this.formFieldRequired = __bind(this.formFieldRequired, this);
      this.formFieldTransactionPrefix = __bind(this.formFieldTransactionPrefix, this);
      this.formFieldPrefix = __bind(this.formFieldPrefix, this);
      var el;
      this.name = name;
      el = $("<fieldset class='dimension' data-dimension-name='" + this.name + "'>            </fieldset>").appendTo(container);
      DimensionWidget.__super__.constructor.call(this, el, options);
      this.id = "" + (this.element.parents('.modeleditor').attr('id')) + "_dim_" + this.name;
      this.element.attr('id', this.id);
      this.meta = DIMENSION_META[this.name] || {};
    }

    DimensionWidget.prototype.deserialize = function(data) {
      var formObj, k, v, _ref, _ref2, _results;
      this.data = ((_ref = data['mapping']) != null ? _ref[this.name] : void 0) || {};
      if (this.data.type !== 'value' && !('fields' in this.data)) {
        this.data.fields = {
          'label': {
            'datatype': 'string'
          }
        };
      }
      this.element.html($.tmpl('tpl_dimension', this));
      this.element.trigger('fillColumnsRequest', [this.element.find('select.column')]);
      this.element.trigger('fillIATIfieldsRequest', [this.element.find('select.iatifield')]);
      formObj = {
        'mapping': {}
      };
      formObj['mapping'][this.name] = this.data;
      _ref2 = util.flattenObject(formObj);
      _results = [];
      for (k in _ref2) {
        v = _ref2[k];
        _results.push(this.element.find("[name=\"" + k + "\"]").val(v));
      }
      return _results;
    };

    DimensionWidget.prototype.formFieldPrefix = function(fieldName) {
      return "mapping[" + this.name + "][fields][" + fieldName + "]";
    };

    DimensionWidget.prototype.formFieldTransactionPrefix = function(fieldName, transaction_part) {
      return "mapping[" + this.name + "][transaction_data_fields][" + transaction_part + "][fields][" + fieldName + "]";
    };

    DimensionWidget.prototype.formFieldRequired = function(fieldName, fieldParent) {
      var _ref;
      if (fieldParent) {
        return ((_ref = FIELDS_META[fieldName]) != null ? _ref['required'] : void 0) || false;
      } else {
        return false;
      }
    };

    DimensionWidget.prototype.formFieldRequired2 = function(fieldName, fieldParent) {
      var _ref, _ref2;
      if (fieldParent) {
        if (DEFAULT_FIELD_SETUP[fieldParent]) {
          if (DEFAULT_FIELD_SETUP[fieldParent]['fields'] && DEFAULT_FIELD_SETUP[fieldParent]['fields'][fieldName]) {
            return ((_ref = DEFAULT_FIELD_SETUP[fieldParent]['fields'][fieldName]) != null ? _ref['required'] : void 0) || false;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return ((_ref2 = FIELDS_META[fieldName]) != null ? _ref2['required'] : void 0) || false;
      }
    };

    DimensionWidget.prototype.onAddFieldClick = function(e) {
      var name, row;
      name = prompt("Field name:").trim();
      row = this._makeFieldRow(name);
      row.appendTo(this.element.find('tbody'));
      this.element.trigger('fillColumnsRequest', [row.find('select.column')]);
      return false;
    };

    DimensionWidget.prototype.onDeleteDimensionClick = function(e) {
      $(e.currentTarget).parents('fieldset').first().remove();
      this.element.parents('form').first().change();
      return false;
    };

    DimensionWidget.prototype.onColumnChange = function(e) {
      var construct_iatifield, curDimension, dimension_data, dimension_name, k, samplevalue, textdata, thedata, thiscolumn, v, _ref;
      curDimension = $(e.currentTarget).parents('fieldset').first();
      dimension_name = curDimension.data('dimension-name');
      dimension_data = curDimension.serializeObject()['mapping'];
      construct_iatifield = '<' + dimension_data[dimension_name]['iati-field'];
      _ref = dimension_data[dimension_name]['fields'];
      for (k in _ref) {
        v = _ref[k];
        if (k === 'text') {
          if (v['datatype'] === 'constant') {
            textdata = dimension_data[dimension_name]['fields'][k]['constant'];
          } else {
            textdata = this.dataSample(dimension_data[dimension_name]['fields'][k]['column']);
          }
        } else {
          if (v['datatype'] === 'constant') {
            samplevalue = dimension_data[dimension_name]['fields'][k]['constant'];
          } else {
            samplevalue = this.dataSample(dimension_data[dimension_name]['fields'][k]['column']);
          }
          construct_iatifield = construct_iatifield + ' ' + k + '="' + samplevalue + '"';
        }
      }
      if (textdata) {
        construct_iatifield = construct_iatifield + ">" + textdata + "</" + dimension_data[dimension_name]['iati-field'] + ">";
      } else {
        construct_iatifield = construct_iatifield + "/>";
      }
      thiscolumn = $(e.currentTarget).val();
      thedata = this.dataSample(thiscolumn);
      curDimension.find('span').first().html('Sample data: <code></code>');
      curDimension.find('span code').first().text(construct_iatifield);
      return false;
    };

    DimensionWidget.prototype.onIATIFieldChange = function(e) {
      var k, row, thisfield, thisfieldsfields, v;
      this.element.parents('form').first().change();
      thisfield = $(e.currentTarget).val();
      this.element.find('tbody tr').remove();
      thisfieldsfields = DEFAULT_FIELD_SETUP[thisfield]['fields'];
      for (k in thisfieldsfields) {
        v = thisfieldsfields[k];
        row = this._makeFieldRowUpdate(k, thisfield, v['required']);
        row.appendTo(this.element.find('tbody'));
        this.element.trigger('fillColumnsRequest', [row.find('select.column')]);
      }
      return false;
    };

    DimensionWidget.prototype.onFieldRemoveClick = function(e) {
      $(e.currentTarget).parents('tr').first().remove();
      this.element.parents('form').first().change();
      return false;
    };

    DimensionWidget.prototype.onFieldSwitchConstantClick = function(e) {
      var curRow, row;
      curRow = $(e.currentTarget).parents('tr').first();
      row = this._makeFieldRow(curRow.data('field-name'), true);
      curRow.replaceWith(row);
      this.element.parents('form').first().change();
      return false;
    };

    DimensionWidget.prototype.onFieldSwitchColumnClick = function(e) {
      var curRow, row;
      curRow = $(e.currentTarget).parents('tr').first();
      row = this._makeFieldRow(curRow.data('field-name'), false);
      curRow.replaceWith(row);
      this.element.trigger('fillColumnsRequest', [row.find('select.column')]);
      this.element.parents('form').first().change();
      return false;
    };

    DimensionWidget.prototype.onFieldSwitchConstantClickTransaction = function(e) {
      var curDimension, curRow, newrow;
      curRow = $(e.currentTarget).parents('tr').first();
      curDimension = $(e.currentTarget).parents('fieldset').first();
      newrow = this._makeFieldRowTransaction(curRow.data('field-name'), curDimension.data('dimension-name'), true);
      curRow.replaceWith(newrow);
      this.element.trigger('fillColumnsRequest', [newrow.find('select.column')]);
      this.element.parents('form').first().change();
      return false;
    };

    DimensionWidget.prototype.onFieldSwitchColumnClickTransaction = function(e) {
      alert('yo');
      return false;
    };

    DimensionWidget.prototype.promptAddDimensionNamed = function(props, thename) {
      return false;
    };

    DimensionWidget.prototype.dataSample = function(columnName) {
      return SAMPLE_DATA[columnName];
    };

    DimensionWidget.prototype._makeFieldRow = function(name, constant) {
      var tplName;
      if (constant == null) constant = false;
      tplName = constant ? 'tpl_dimension_field_const' : 'tpl_dimension_field';
      return $.tmpl(tplName, {
        'fieldName': name,
        'prefix': this.formFieldPrefix,
        'required': this.formFieldRequired
      });
    };

    DimensionWidget.prototype._makeFieldRowTransaction = function(name, dimension_name, constant) {
      var tplName;
      if (constant == null) constant = false;
      tplName = constant ? 'tpl_dimension_field_const' : 'tpl_dimension_field';
      return $.tmpl(tplName, {
        'fieldName': name,
        'transaction_part': dimension_name,
        'prefix': this.formFieldTransactionPrefix,
        'required': this.formFieldRequired,
        'transaction': 'yes'
      });
    };

    DimensionWidget.prototype._makeFieldRowUpdate = function(name, thisfield, requiredvar, constant) {
      var tplName;
      if (constant == null) constant = false;
      tplName = constant ? 'tpl_dimension_field_const' : 'tpl_dimension_field';
      return $.tmpl(tplName, {
        'fieldName': name,
        'prefix': this.formFieldPrefix,
        'required': this.formFieldRequired2
      });
    };

    return DimensionWidget;

  })(Widget);

  DimensionsWidget = (function(_super) {

    __extends(DimensionsWidget, _super);

    DimensionsWidget.prototype.events = {
      '.add_value_dimension click': 'onAddValueDimensionClick',
      '.add_compound_dimension click': 'onAddCompoundDimensionClick'
    };

    function DimensionsWidget(element, options) {
      DimensionsWidget.__super__.constructor.apply(this, arguments);
      this.widgets = [];
      this.dimsEl = this.element.find('.dimensions').get(0);
    }

    DimensionsWidget.prototype.addDimension = function(name) {
      var w;
      w = new DimensionWidget(name, this.dimsEl);
      this.widgets.push(w);
      return w;
    };

    DimensionsWidget.prototype.removeDimension = function(name) {
      var idx, w, _i, _len, _ref;
      idx = null;
      _ref = this.widgets;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        w = _ref[_i];
        if (w.name === name) {
          idx = this.widgets.indexOf(w);
          break;
        }
      }
      if (idx !== null) return this.widgets.splice(idx, 1)[0].element.remove();
    };

    DimensionsWidget.prototype.deserialize = function(data) {
      var dims, name, obj, toRemove, widget, _i, _j, _len, _len2, _ref, _results;
      if (this.ignoreParent) return;
      dims = data['mapping'] || {};
      toRemove = [];
      _ref = this.widgets;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        widget = _ref[_i];
        if (widget.name in dims) {
          widget.deserialize(data);
          delete dims[widget.name];
        } else {
          toRemove.push(widget.name);
        }
      }
      for (_j = 0, _len2 = toRemove.length; _j < _len2; _j++) {
        name = toRemove[_j];
        this.removeDimension(name);
      }
      _results = [];
      for (name in dims) {
        obj = dims[name];
        _results.push(this.addDimension(name).deserialize(data));
      }
      return _results;
    };

    DimensionsWidget.prototype.promptAddDimension = function(props) {
      var data, name;
      name = prompt("Give a unique name for your new dimension (letters and numbers, no spaces):");
      if (!name) return false;
      data = {
        'mapping': {}
      };
      data['mapping'][name] = props;
      return this.addDimension(name.trim()).deserialize(data);
    };

    DimensionsWidget.prototype.promptAddDimensionNamed = function(thename, props) {
      var data, name;
      alert("Column \"" + thename + "\" has been added.");
      name = thename;
      if (!name) return false;
      data = {
        'mapping': {}
      };
      data['mapping'][name] = props;
      return this.addDimension(name.trim()).deserialize(data);
    };

    DimensionsWidget.prototype.onAddValueDimensionClick = function(e) {
      this.promptAddDimension({
        'type': 'value'
      });
      return false;
    };

    DimensionsWidget.prototype.onAddCompoundDimensionClick = function(e) {
      this.promptAddDimension({
        'type': 'compound'
      });
      return false;
    };

    return DimensionsWidget;

  })(Delegator);

  ModelEditor = (function(_super) {

    __extends(ModelEditor, _super);

    ModelEditor.prototype.widgetTypes = {
      '.unique_keys_widget': UniqueKeyWidget,
      '.dimensions_widget': DimensionsWidget
    };

    ModelEditor.prototype.events = {
      'modelChange': 'onModelChange',
      'fillColumnsRequest': 'onFillColumnsRequest',
      'fillIATIfieldsRequest': 'onFillIATIfieldsRequest',
      '.steps > ul > li click': 'onStepClick',
      '.steps > ul > li > ul > li click': 'onStepDimensionClick',
      '.forms form submit': 'onFormSubmit',
      '.forms form change': 'onFormChange',
      '#showdebug click': 'onShowDebugClick',
      '.add_data_field click': 'onAddDataFieldClick',
      'doFieldSelectors': 'onDoFieldSelectors',
      '#columns .availablebtn click': 'onColumnsAvailableClick',
      '#columns .allbtn click': 'onColumnsAllClick',
      '#iatifields .availablebtn click': 'onIATIFieldsAvailableClick',
      '#iatifields .allbtn click': 'onIATIFieldsAllClick'
    };

    function ModelEditor(element, options) {
      var ctor, e, model_data, selector, _i, _len, _ref, _ref2;
      ModelEditor.__super__.constructor.apply(this, arguments);
      if (this.options.model_data) {
        model_data = JSON.parse(this.options.model_data);
      } else {
        model_data = DEFAULT_MODEL;
      }
      this.data = $.extend(true, {}, model_data);
      this.widgets = [];
      this.form = $(element).find('.forms form').eq(0);
      this.id = this.element.attr('id');
      if (!(this.id != null)) {
        this.id = Math.floor(Math.random() * 0xffffffff).toString(16);
        this.element.attr('id', this.id);
      }
      this.element.find('script[type="text/x-jquery-tmpl"]').each(function() {
        return $(this).template($(this).attr('id'));
      });
      this.options.columns.unshift('');
      this.element.find('select.iatifield').each(function() {
        return $(this).trigger('fillColumnsRequest', [this]);
      });
      this.options.iatifields.unshift('');
      this.element.find('select.iatifield').each(function() {
        return $(this).trigger('fillIATIfieldsRequest', [this]);
      });
      _ref = this.widgetTypes;
      for (selector in _ref) {
        ctor = _ref[selector];
        _ref2 = this.element.find(selector).get();
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          e = _ref2[_i];
          this.widgets.push(new ctor(e));
        }
      }
      this.element.trigger('modelChange');
      this.element.trigger('doFieldSelectors', 'iatifield');
      this.element.trigger('doFieldSelectors', 'column');
      this.setStep(0);
    }

    ModelEditor.prototype.setStep = function(s) {
      $(this.element).find('.steps > ul > li').removeClass('active').eq(s).addClass('active');
      return $(this.element).find('.forms div.formpart').hide().eq(s).show();
    };

    ModelEditor.prototype.onStepClick = function(e) {
      var idx;
      idx = this.element.find('.steps > ul > li').index(e.currentTarget);
      this.setStep(idx);
      return false;
    };

    ModelEditor.prototype.onAddDataFieldClick = function(e) {
      var thevar, w, _i, _len, _ref;
      thevar = $(e.currentTarget).text();
      _ref = this.widgets;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        w = _ref[_i];
        w.promptAddDimensionNamed(thevar, {
          'type': 'value',
          'column': thevar,
          'label': thevar
        });
      }
      this.data = this.form.serializeObject();
      this.element.trigger('modelChange');
      return $(e.currentTarget).removeClass('add_data_field available').addClass('unavailable');
    };

    ModelEditor.prototype.onShowDebugClick = function(e) {
      if ($('#debug').hasClass('debug-shown')) {
        $('#debug').slideUp().removeClass('debug-shown');
      } else {
        $('#debug').slideDown().addClass('debug-shown');
      }
      return false;
    };

    ModelEditor.prototype.onFormChange = function(e) {
      if (this.ignoreFormChange) return;
      this.data = this.form.serializeObject();
      this.form.find('.column').each(function() {
        var columnname;
        columnname = $(this).val();
        return $('#user_columns ul li a').each(function() {
          if (($(this).text()) === columnname) {
            return $(this).removeClass('available').addClass('unavailable');
          }
        });
      });
      this.element.trigger('doFieldSelectors', 'iatifield');
      this.element.trigger('doFieldSelectors', 'column');
      this.ignoreFormChange = true;
      this.element.trigger('modelChange');
      return this.ignoreFormChange = false;
    };

    ModelEditor.prototype.onColumnsAvailableClick = function(e) {
      $('#columns ul').addClass('hideunavailable');
      $('#columns .allbtn').removeClass('fieldsbuttons-selected');
      return $('#columns .availablebtn').addClass('fieldsbuttons-selected');
    };

    ModelEditor.prototype.onColumnsAllClick = function(e) {
      $('#columns ul').removeClass('hideunavailable');
      $('#columns .availablebtn').removeClass('fieldsbuttons-selected');
      return $('#columns .allbtn').addClass('fieldsbuttons-selected');
    };

    ModelEditor.prototype.onIATIFieldsAvailableClick = function(e) {
      $('#iatifields ul').addClass('hideunavailable');
      $('#iatifields .allbtn').removeClass('fieldsbuttons-selected');
      return $('#iatifields .availablebtn').addClass('fieldsbuttons-selected');
    };

    ModelEditor.prototype.onIATIFieldsAllClick = function(e) {
      $('#iatifields ul').removeClass('hideunavailable');
      $('#iatifields .availablebtn').removeClass('fieldsbuttons-selected');
      return $('#iatifields .allbtn').addClass('fieldsbuttons-selected');
    };

    ModelEditor.prototype.onDoFieldSelectors = function(e) {
      $('#' + e + 's ul li a').each(function() {
        if ($(this).hasClass('unavailable')) {
          $(this).removeClass('unavailable');
          return $(this).addClass('available');
        }
      });
      return this.form.find('.' + e).each(function() {
        var iatiname;
        iatiname = $(this).val();
        return $('#' + e + 's ul li a').each(function() {
          if ($(this).text() === iatiname) {
            $(this).removeClass('available');
            return $(this).addClass('unavailable');
          }
        });
      });
    };

    ModelEditor.prototype.onFormSubmit = function(e) {
      return false;
    };

    ModelEditor.prototype.onModelChange = function() {
      var dimNames, k, n, v, w, _i, _len, _ref, _ref2;
      _ref = util.flattenObject(this.data);
      for (k in _ref) {
        v = _ref[k];
        this.form.find("[name=\"" + k + "\"]").val(v);
      }
      _ref2 = this.widgets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        w = _ref2[_i];
        w.deserialize($.extend(true, {}, this.data));
      }
      dimNames = (function() {
        var _ref3, _results;
        _ref3 = this.data['mapping'];
        _results = [];
        for (k in _ref3) {
          v = _ref3[k];
          _results.push(k);
        }
        return _results;
      }).call(this);
      this.element.find('.steps ul.steps_dimensions').html(((function() {
        var _j, _len2, _results;
        _results = [];
        for (_j = 0, _len2 = dimNames.length; _j < _len2; _j++) {
          n = dimNames[_j];
          _results.push('<li><a href="#' + ("m1_dim_" + n) + '">' + ("" + (n.dasherize()) + "</a>"));
        }
        return _results;
      })()).join('\n'));
      return $('#debug').text(JSON.stringify(this.data, null, 2).dasherize());
    };

    ModelEditor.prototype.onFillColumnsRequest = function(elem) {
      var x;
      return $(elem).html(((function() {
        var _i, _len, _ref, _results;
        _ref = this.options.columns;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          x = _ref[_i];
          _results.push("<option name='" + x + "'>" + x + "</option>");
        }
        return _results;
      }).call(this)).join('\n'));
    };

    ModelEditor.prototype.onFillIATIfieldsRequest = function(elem) {
      var x;
      return $(elem).html(((function() {
        var _i, _len, _ref, _results;
        _ref = this.options.iatifields;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          x = _ref[_i];
          _results.push("<option name='" + x + "'>" + x + "</option>");
        }
        return _results;
      }).call(this)).join('\n'));
    };

    return ModelEditor;

  })(Delegator);

  $.plugin('modelEditor', ModelEditor);

  this.ModelEditor = ModelEditor;

}).call(this);