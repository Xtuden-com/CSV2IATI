DEFAULT_FIELD_SETUP =
  'activity-website':
    datatype: 'compound'
    label: 'Activity Website'
    fields:
      'text':
        datatype: 'column'
        required: false
  'reporting-org':
    datatype: 'compound'
    label: 'Reporting Org'
    fields:
      'text':
        datatype: 'column'
        required: false
      'ref':
        datatype: 'column'
        required: true
      'type':
        datatype: 'column'
        required: false
  'participating-org':
    datatype: 'compound'
    label: 'Participating Org'
    fields:
      'text':
        datatype: 'column'
        required: false
      'ref':
        datatype: 'column'
        required: false
      'type':
        datatype: 'column'
        required: false
      'role':
        datatype: 'column'
        required: true
  'recipient-country':
    datatype: 'compound'
    label: 'Recipient Country'
    fields:
      'text':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: true
      'percentage':
        datatype: 'column'
        required: false
  'recipient-region':
    datatype: 'compound'
    label: 'Recipient Region'
    fields:
      'text':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: false
      'percentage':
        datatype: 'column'
        required: false
  'collaboration-type':
    datatype: 'compound'
    label: 'Collaboration Type'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: true
  'default-flow-type':
    datatype: 'compound'
    label: 'Default Flow Type'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: true
  'default-aid-type':
    datatype: 'compound'
    label: 'Default Aid Type'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: true
  'default-finance-type':
    datatype: 'compound'
    label: 'Default Finance Type'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: true
  'iati-identifier':
    datatype: 'compound'
    label: 'Iati Identifier'
    fields:
      'text':
        datatype: 'column'
        required: false
  'other-identifier':
    datatype: 'compound'
    label: 'Other Identifier'
    fields:
      'text':
        datatype: 'column'
        required: false
      'owner-ref':
        datatype: 'column'
        required: false
      'owner-name':
        datatype: 'column'
        required: false
  'title':
    datatype: 'compound'
    label: 'Title'
    fields:
        'text':
          datatype: 'column'
          required: false
  'description':
    datatype: 'compound'
    label: 'Description'
    fields:
        'text':
          datatype: 'column'
          required: false
  'sector':
    datatype: 'compound'
    label: 'Sector'
    fields:
      'text':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: false
      'vocabulary':
        datatype: 'column'
        required: false
      'percentage':
        datatype: 'column'
        required: false
  'activity-date':
    datatype: 'compound'
    label: 'Activity Date'
    fields:
      'text':
        datatype: 'column'
        required: false
  'activity-status':
    datatype: 'compound'
    label: 'Activity Status'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: false
  'contact-info':
    datatype: 'compound'
    label: 'Contact Info'
    fields:
      'organisation':
        datatype: 'compound'
        label: 'Organisation'
        fields:
            'text':
              datatype: 'column'
              required: false
      'person-name':
        datatype: 'compound'
        label: 'Person Name'
        fields:
            'text':
              datatype: 'column'
              required: false
      'telephone':
        datatype: 'compound'
        label: 'Telephone'
        fields:
          'text':
            datatype: 'column'
            required: false
      'email':
        datatype: 'compound'
        label: 'Email'
        fields:
            'text':
              datatype: 'column'
              required: false
      'mailing-address':
        datatype: 'compound'
        label: 'Mailing Address'
        fields:
          'text':
            datatype: 'column'
            required: false
  'default-tied-status':
    datatype: 'compound'
    label: 'Default Tied Status'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: true
  'policy-marker':
    datatype: 'compound'
    label: 'Policy Marker'
    fields:
      'text':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: false
      'vocabulary':
        datatype: 'column'
        required: false
      'significance':
        datatype: 'column'
        required: false
  'location':
    datatype: 'compound'
    label: 'Location'
    fields:
      'percentage':
        datatype: 'column'
        required: false
      'location-type':
        datatype: 'compound'
        label: 'Location Type'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'name':
        datatype: 'compound'
        label: 'Name'
        fields:
            'text':
              datatype: 'column'
              required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
            'text':
              datatype: 'column'
              required: false
      'administrative':
        datatype: 'compound'
        label: 'Administrative'
        fields:
          'text':
            datatype: 'column'
            required: false
          'country':
            datatype: 'column'
            required: false
          'adm1':
            datatype: 'column'
            required: false
          'adm2':
            datatype: 'column'
            required: false
      'coordinates':
        datatype: 'compound'
        label: 'Coordinates'
        fields:
          'latitude':
            datatype: 'column'
            required: true
          'longitude':
            datatype: 'column'
            required: true
          'precision':
            datatype: 'column'
            required: false
      'gazetteer-entry':
        datatype: 'compound'
        label: 'Gazetteer Entry'
        fields:
          'text':
            datatype: 'column'
            required: false
          'gazetteer-ref':
            datatype: 'column'
            required: true
  'transaction':
    datatype: 'compound'
    label: 'Transaction'
    fields:
      'ref':
        datatype: 'column'
        required: false
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
            'text':
              datatype: 'column'
              required: false
      'transaction-type':
        datatype: 'compound'
        label: 'Transaction Type'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'provider-org':
        datatype: 'compound'
        label: 'Provider Org'
        fields:
          'text':
            datatype: 'column'
            required: false
          'ref':
            datatype: 'column'
            required: false
          'provider-activity-id':
            datatype: 'column'
            required: false
      'receiver-org':
        datatype: 'compound'
        label: 'Receiver Org'
        fields:
          'text':
            datatype: 'column'
            required: false
          'ref':
            datatype: 'column'
            required: false
          'receiver-activity-id':
            datatype: 'column'
            required: false
      'transaction-date':
        datatype: 'compound'
        label: 'Transaction Date'
        fields:
          'text':
            datatype: 'column'
            required: false
          'iso-date':
            datatype: 'column'
            required: true
      'flow-type':
        datatype: 'compound'
        label: 'Flow Type'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'aid-type':
        datatype: 'compound'
        label: 'Aid Type'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'finance-type':
        datatype: 'compound'
        label: 'Finance Type'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'tied-status':
        datatype: 'compound'
        label: 'Tied Status'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'disbursement-channel':
        datatype: 'compound'
        label: 'Disbursement Channel'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
  'result':
    datatype: 'compound'
    label: 'Result'
    fields:
      'type':
        datatype: 'column'
        required: true
      'aggregation-status':
        datatype: 'column'
        required: false
      'title':
        datatype: 'compound'
        label: 'Title'
        fields:
            'text':
              datatype: 'column'
              required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
            'text':
              datatype: 'column'
              required: false
      'indicator':
        datatype: 'compound'
        label: 'Indicator'
        fields:
          'measure':
            datatype: 'column'
            required: true
          'ascending':
            datatype: 'column'
            required: false
          'title':
            datatype: 'compound'
            label: 'Title'
            fields:
                'text':
                  datatype: 'column'
                  required: false
          'description':
            datatype: 'compound'
            label: 'Description'
            fields:
                'text':
                  datatype: 'column'
                  required: false
          'baseline':
            datatype: 'compound'
            label: 'Baseline'
            fields:
              'year':
                datatype: 'column'
                required: true
              'value':
                datatype: 'column'
                required: true
              'comment':
                datatype: 'compound'
                label: 'Comment'
                fields:
                    'text':
                      datatype: 'column'
                      required: false
          'period':
            datatype: 'compound'
            label: 'Period'
            fields:
              'period-start':
                datatype: 'compound'
                label: 'Period Start'
                fields:
                    'text':
                      datatype: 'column'
                      required: false
              'period-end':
                datatype: 'compound'
                label: 'Period End'
                fields:
                    'text':
                      datatype: 'column'
                      required: false
              'target':
                datatype: 'compound'
                label: 'Target'
                fields:
                  'value':
                    datatype: 'column'
                    required: true
                  'comment':
                    datatype: 'compound'
                    label: 'Comment'
                    fields:
                        'text':
                          datatype: 'column'
                          required: false
              'actual':
                datatype: 'compound'
                label: 'Actual'
                fields:
                  'value':
                    datatype: 'column'
                    required: true
                  'comment':
                    datatype: 'compound'
                    label: 'Comment'
                    fields:
                        'text':
                          datatype: 'column'
                          required: false
  'conditions':
    datatype: 'compound'
    label: 'Conditions'
    fields:
      'attached':
        datatype: 'column'
        required: true
      'condition':
        datatype: 'compound'
        label: 'Condition'
        fields:
          'text':
            datatype: 'column'
            required: false
          'type':
            datatype: 'column'
            required: true
  'budget':
    datatype: 'compound'
    label: 'Budget'
    fields:
      'type':
        datatype: 'column'
        required: false
      'period-start':
        datatype: 'compound'
        label: 'Period Start'
        fields:
            'text':
              datatype: 'column'
              required: false
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
            'text':
              datatype: 'column'
              required: false
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
  'planned-disbursement':
    datatype: 'compound'
    label: 'Planned Disbursement'
    fields:
      'updated':
        datatype: 'column'
        required: false
      'period-start':
        datatype: 'compound'
        label: 'Period Start'
        fields:
            'text':
              datatype: 'column'
              required: false
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
            'text':
              datatype: 'column'
              required: false
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
  'related-activity':
    datatype: 'compound'
    label: 'Related Activity'
    fields:
      'text':
        datatype: 'column'
        required: false
      'ref':
        datatype: 'column'
        required: true
      'type':
        datatype: 'column'
        required: true
  'document-link':
    datatype: 'compound'
    label: 'Document Link'
    fields:
      'url':
        datatype: 'column'
        required: true
      'format':
        datatype: 'column'
        required: false
      'title':
        datatype: 'compound'
        label: 'Title'
        fields:
            'text':
              datatype: 'column'
              required: false
      'category':
        datatype: 'compound'
        label: 'Category'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: true
      'language':
        datatype: 'compound'
        label: 'Language'
        fields:
            'text':
              datatype: 'column'
              required: false
            'code':
              datatype: 'column'
              required: false
  'legacy-data':
    datatype: 'compound'
    label: 'Legacy Data'
    fields:
      'text':
        datatype: 'column'
        required: false
      'name':
        datatype: 'column'
        required: true
      'value':
        datatype: 'column'
        required: true
      'iati-equivalent':
        datatype: 'column'
        required: false

