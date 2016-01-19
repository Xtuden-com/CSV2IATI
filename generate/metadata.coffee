DEFAULT_FIELD_SETUP =
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
      'ref':
        datatype: 'column'
        required: true
      'type':
        datatype: 'column'
        required: true
      'owner-org':
        datatype: 'compound'
        label: 'Owner Org'
        fields:
          'ref':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
  'title':
    datatype: 'compound'
    label: 'Title'
    fields:
        'narrative':
          datatype: 'compound'
          label: 'Narrative'
          fields:
            'text':
              datatype: 'column'
              required: false
  'description':
    datatype: 'compound'
    label: 'Description'
    fields:
      'type':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'activity-status':
    datatype: 'compound'
    label: 'Activity Status'
    fields:
      'code':
        datatype: 'column'
        required: true
  'activity-date':
    datatype: 'compound'
    label: 'Activity Date'
    fields:
      'type':
        datatype: 'column'
        required: true
      'iso-date':
        datatype: 'column'
        required: true
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'contact-info':
    datatype: 'compound'
    label: 'Contact Info'
    fields:
      'type':
        datatype: 'column'
        required: false
      'organisation':
        datatype: 'compound'
        label: 'Organisation'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'department':
        datatype: 'compound'
        label: 'Department'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'person-name':
        datatype: 'compound'
        label: 'Person Name'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'job-title':
        datatype: 'compound'
        label: 'Job Title'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
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
      'website':
        datatype: 'compound'
        label: 'Website'
        fields:
          'text':
            datatype: 'column'
            required: false
      'mailing-address':
        datatype: 'compound'
        label: 'Mailing Address'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
  'participating-org':
    datatype: 'compound'
    label: 'Participating Org'
    fields:
      'ref':
        datatype: 'column'
        required: false
      'type':
        datatype: 'column'
        required: false
      'role':
        datatype: 'column'
        required: true
      'activity-id':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'activity-scope':
    datatype: 'compound'
    label: 'Activity Scope'
    fields:
      'code':
        datatype: 'column'
        required: true
  'recipient-country':
    datatype: 'compound'
    label: 'Recipient Country'
    fields:
      'code':
        datatype: 'column'
        required: true
      'percentage':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'recipient-region':
    datatype: 'compound'
    label: 'Recipient Region'
    fields:
      'code':
        datatype: 'column'
        required: true
      'vocabulary':
        datatype: 'column'
        required: false
      'vocabulary-uri':
        datatype: 'column'
        required: false
      'percentage':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'location':
    datatype: 'compound'
    label: 'Location'
    fields:
      'ref':
        datatype: 'column'
        required: false
      'location-reach':
        datatype: 'compound'
        label: 'Location Reach'
        fields:
          'code':
            datatype: 'column'
            required: true
      'location-id':
        datatype: 'compound'
        label: 'Location Id'
        fields:
          'code':
            datatype: 'column'
            required: true
          'vocabulary':
            datatype: 'column'
            required: true
      'name':
        datatype: 'compound'
        label: 'Name'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'activity-description':
        datatype: 'compound'
        label: 'Activity Description'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'administrative':
        datatype: 'compound'
        label: 'Administrative'
        fields:
          'code':
            datatype: 'column'
            required: true
          'vocabulary':
            datatype: 'column'
            required: true
          'level':
            datatype: 'column'
            required: false
      'point':
        datatype: 'compound'
        label: 'Point'
        fields:
          'srsName':
            datatype: 'column'
            required: true
          'pos':
            datatype: 'compound'
            label: 'Pos'
            fields:
                'text':
                  datatype: 'column'
                  required: false
      'exactness':
        datatype: 'compound'
        label: 'Exactness'
        fields:
          'code':
            datatype: 'column'
            required: true
      'location-class':
        datatype: 'compound'
        label: 'Location Class'
        fields:
          'code':
            datatype: 'column'
            required: true
      'feature-designation':
        datatype: 'compound'
        label: 'Feature Designation'
        fields:
          'code':
            datatype: 'column'
            required: true
  'sector':
    datatype: 'compound'
    label: 'Sector'
    fields:
      'vocabulary':
        datatype: 'column'
        required: false
      'vocabulary-uri':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: true
      'percentage':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'country-budget-items':
    datatype: 'compound'
    label: 'Country Budget Items'
    fields:
      'vocabulary':
        datatype: 'column'
        required: true
      'budget-item':
        datatype: 'compound'
        label: 'Budget Item'
        fields:
          'code':
            datatype: 'column'
            required: true
          'percentage':
            datatype: 'column'
            required: false
          'description':
            datatype: 'compound'
            label: 'Description'
            fields:
                'narrative':
                  datatype: 'compound'
                  label: 'Narrative'
                  fields:
                    'text':
                      datatype: 'column'
                      required: false
  'policy-marker':
    datatype: 'compound'
    label: 'Policy Marker'
    fields:
      'vocabulary':
        datatype: 'column'
        required: false
      'vocabulary-uri':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: true
      'significance':
        datatype: 'column'
        required: false
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'collaboration-type':
    datatype: 'compound'
    label: 'Collaboration Type'
    fields:
      'code':
        datatype: 'column'
        required: true
  'default-finance-type':
    datatype: 'compound'
    label: 'Default Finance Type'
    fields:
      'code':
        datatype: 'column'
        required: true
  'default-flow-type':
    datatype: 'compound'
    label: 'Default Flow Type'
    fields:
      'code':
        datatype: 'column'
        required: true
  'default-aid-type':
    datatype: 'compound'
    label: 'Default Aid Type'
    fields:
      'code':
        datatype: 'column'
        required: true
  'default-tied-status':
    datatype: 'compound'
    label: 'Default Tied Status'
    fields:
      'code':
        datatype: 'column'
        required: true
  'budget':
    datatype: 'compound'
    label: 'Budget'
    fields:
      'type':
        datatype: 'column'
        required: false
      'status':
        datatype: 'column'
        required: false
      'period-start':
        datatype: 'compound'
        label: 'Period Start'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
            'currency':
              datatype: 'column'
              required: false
            'value-date':
              datatype: 'column'
              required: false
  'planned-disbursement':
    datatype: 'compound'
    label: 'Planned Disbursement'
    fields:
      'type':
        datatype: 'column'
        required: false
      'period-start':
        datatype: 'compound'
        label: 'Period Start'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
            'currency':
              datatype: 'column'
              required: false
            'value-date':
              datatype: 'column'
              required: false
      'provider-org':
        datatype: 'compound'
        label: 'Provider Org'
        fields:
          'ref':
            datatype: 'column'
            required: false
          'provider-activity-id':
            datatype: 'column'
            required: false
          'type':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'receiver-org':
        datatype: 'compound'
        label: 'Receiver Org'
        fields:
          'ref':
            datatype: 'column'
            required: false
          'receiver-activity-id':
            datatype: 'column'
            required: false
          'type':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
  'capital-spend':
    datatype: 'compound'
    label: 'Capital Spend'
    fields:
      'percentage':
        datatype: 'column'
        required: true
  'transaction':
    datatype: 'compound'
    label: 'Transaction'
    fields:
      'ref':
        datatype: 'column'
        required: false
      'humanitarian':
        datatype: 'column'
        required: false
      'transaction-type':
        datatype: 'compound'
        label: 'Transaction Type'
        fields:
          'code':
            datatype: 'column'
            required: true
      'transaction-date':
        datatype: 'compound'
        label: 'Transaction Date'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
      'value':
        datatype: 'compound'
        label: 'Value'
        fields:
            'text':
              datatype: 'column'
              required: false
            'currency':
              datatype: 'column'
              required: false
            'value-date':
              datatype: 'column'
              required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'provider-org':
        datatype: 'compound'
        label: 'Provider Org'
        fields:
          'ref':
            datatype: 'column'
            required: false
          'provider-activity-id':
            datatype: 'column'
            required: false
          'type':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'receiver-org':
        datatype: 'compound'
        label: 'Receiver Org'
        fields:
          'ref':
            datatype: 'column'
            required: false
          'receiver-activity-id':
            datatype: 'column'
            required: false
          'type':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'disbursement-channel':
        datatype: 'compound'
        label: 'Disbursement Channel'
        fields:
          'code':
            datatype: 'column'
            required: true
      'sector':
        datatype: 'compound'
        label: 'Sector'
        fields:
          'vocabulary':
            datatype: 'column'
            required: false
          'vocabulary-uri':
            datatype: 'column'
            required: false
          'code':
            datatype: 'column'
            required: true
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'recipient-country':
        datatype: 'compound'
        label: 'Recipient Country'
        fields:
          'code':
            datatype: 'column'
            required: true
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'recipient-region':
        datatype: 'compound'
        label: 'Recipient Region'
        fields:
          'code':
            datatype: 'column'
            required: true
          'vocabulary':
            datatype: 'column'
            required: false
          'vocabulary-uri':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
      'flow-type':
        datatype: 'compound'
        label: 'Flow Type'
        fields:
          'code':
            datatype: 'column'
            required: true
      'finance-type':
        datatype: 'compound'
        label: 'Finance Type'
        fields:
          'code':
            datatype: 'column'
            required: true
      'aid-type':
        datatype: 'compound'
        label: 'Aid Type'
        fields:
          'code':
            datatype: 'column'
            required: true
      'tied-status':
        datatype: 'compound'
        label: 'Tied Status'
        fields:
          'code':
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
        required: true
      'title':
        datatype: 'compound'
        label: 'Title'
        fields:
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'category':
        datatype: 'compound'
        label: 'Category'
        fields:
          'code':
            datatype: 'column'
            required: true
      'language':
        datatype: 'compound'
        label: 'Language'
        fields:
          'code':
            datatype: 'column'
            required: true
      'document-date':
        datatype: 'compound'
        label: 'Document Date'
        fields:
          'iso-date':
            datatype: 'column'
            required: true
  'related-activity':
    datatype: 'compound'
    label: 'Related Activity'
    fields:
      'ref':
        datatype: 'column'
        required: true
      'type':
        datatype: 'column'
        required: true
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
          'type':
            datatype: 'column'
            required: true
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
              'text':
                datatype: 'column'
                required: false
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
            'narrative':
              datatype: 'compound'
              label: 'Narrative'
              fields:
                'text':
                  datatype: 'column'
                  required: false
      'description':
        datatype: 'compound'
        label: 'Description'
        fields:
          'type':
            datatype: 'column'
            required: false
          'narrative':
            datatype: 'compound'
            label: 'Narrative'
            fields:
              'xml:lang':
                datatype: 'column'
                required: false
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
                'narrative':
                  datatype: 'compound'
                  label: 'Narrative'
                  fields:
                    'text':
                      datatype: 'column'
                      required: false
          'description':
            datatype: 'compound'
            label: 'Description'
            fields:
              'type':
                datatype: 'column'
                required: false
              'narrative':
                datatype: 'compound'
                label: 'Narrative'
                fields:
                  'xml:lang':
                    datatype: 'column'
                    required: false
                  'text':
                    datatype: 'column'
                    required: false
          'reference':
            datatype: 'compound'
            label: 'Reference'
            fields:
              'vocabulary':
                datatype: 'column'
                required: true
              'code':
                datatype: 'column'
                required: true
              'indicator-uri':
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
                    'narrative':
                      datatype: 'compound'
                      label: 'Narrative'
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
                  'iso-date':
                    datatype: 'column'
                    required: true
              'period-end':
                datatype: 'compound'
                label: 'Period End'
                fields:
                  'iso-date':
                    datatype: 'column'
                    required: true
              'target':
                datatype: 'compound'
                label: 'Target'
                fields:
                  'value':
                    datatype: 'column'
                    required: true
                  'location':
                    datatype: 'compound'
                    label: 'Location'
                    fields:
                      'ref':
                        datatype: 'column'
                        required: false
                  'dimension':
                    datatype: 'compound'
                    label: 'Dimension'
                    fields:
                      'name':
                        datatype: 'column'
                        required: false
                      'value':
                        datatype: 'column'
                        required: false
                  'comment':
                    datatype: 'compound'
                    label: 'Comment'
                    fields:
                        'narrative':
                          datatype: 'compound'
                          label: 'Narrative'
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
                  'location':
                    datatype: 'compound'
                    label: 'Location'
                    fields:
                      'ref':
                        datatype: 'column'
                        required: false
                  'dimension':
                    datatype: 'compound'
                    label: 'Dimension'
                    fields:
                      'name':
                        datatype: 'column'
                        required: false
                      'value':
                        datatype: 'column'
                        required: false
                  'comment':
                    datatype: 'compound'
                    label: 'Comment'
                    fields:
                        'narrative':
                          datatype: 'compound'
                          label: 'Narrative'
                          fields:
                            'text':
                              datatype: 'column'
                              required: false
  'legacy-data':
    datatype: 'compound'
    label: 'Legacy Data'
    fields:
      'name':
        datatype: 'column'
        required: true
      'value':
        datatype: 'column'
        required: true
      'iati-equivalent':
        datatype: 'column'
        required: false
  'crs-add':
    datatype: 'compound'
    label: 'Crs Add'
    fields:
      'other-flags':
        datatype: 'compound'
        label: 'Other Flags'
        fields:
          'code':
            datatype: 'column'
            required: true
          'significance':
            datatype: 'column'
            required: true
      'loan-terms':
        datatype: 'compound'
        label: 'Loan Terms'
        fields:
          'rate-1':
            datatype: 'column'
            required: false
          'rate-2':
            datatype: 'column'
            required: false
          'repayment-type':
            datatype: 'compound'
            label: 'Repayment Type'
            fields:
              'code':
                datatype: 'column'
                required: true
          'repayment-plan':
            datatype: 'compound'
            label: 'Repayment Plan'
            fields:
              'code':
                datatype: 'column'
                required: true
          'commitment-date':
            datatype: 'compound'
            label: 'Commitment Date'
            fields:
              'iso-date':
                datatype: 'column'
                required: true
          'repayment-first-date':
            datatype: 'compound'
            label: 'Repayment First Date'
            fields:
              'iso-date':
                datatype: 'column'
                required: true
          'repayment-final-date':
            datatype: 'compound'
            label: 'Repayment Final Date'
            fields:
              'iso-date':
                datatype: 'column'
                required: true
      'loan-status':
        datatype: 'compound'
        label: 'Loan Status'
        fields:
          'year':
            datatype: 'column'
            required: true
          'currency':
            datatype: 'column'
            required: false
          'value-date':
            datatype: 'column'
            required: true
          'interest-received':
            datatype: 'compound'
            label: 'Interest Received'
            fields:
                'text':
                  datatype: 'column'
                  required: false
          'principal-outstanding':
            datatype: 'compound'
            label: 'Principal Outstanding'
            fields:
                'text':
                  datatype: 'column'
                  required: false
          'principal-arrears':
            datatype: 'compound'
            label: 'Principal Arrears'
            fields:
                'text':
                  datatype: 'column'
                  required: false
          'interest-arrears':
            datatype: 'compound'
            label: 'Interest Arrears'
            fields:
                'text':
                  datatype: 'column'
                  required: false
      'channel-code':
        datatype: 'compound'
        label: 'Channel Code'
        fields:
            'text':
              datatype: 'column'
              required: false
  'fss':
    datatype: 'compound'
    label: 'Fss'
    fields:
      'extraction-date':
        datatype: 'column'
        required: true
      'priority':
        datatype: 'column'
        required: false
      'phaseout-year':
        datatype: 'column'
        required: false
      'forecast':
        datatype: 'compound'
        label: 'Forecast'
        fields:
          'year':
            datatype: 'column'
            required: true
          'currency':
            datatype: 'column'
            required: false
          'value-date':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false
  'humanitarian-scope':
    datatype: 'compound'
    label: 'Humanitarian Scope'
    fields:
      'type':
        datatype: 'column'
        required: true
      'vocabulary':
        datatype: 'column'
        required: true
      'vocabulary-uri':
        datatype: 'column'
        required: false
      'code':
        datatype: 'column'
        required: true
      'narrative':
        datatype: 'compound'
        label: 'Narrative'
        fields:
          'xml:lang':
            datatype: 'column'
            required: false
          'text':
            datatype: 'column'
            required: false

DIMENSION_META =
  'iati-activity':
    fixedDataType:true
    helpText: '''
<p>
        Top-level element for a single IATI activity report.
      </p>
              '''
  'iati-identifier':
    fixedDataType:true
    helpText: '''
<p>
        A globally unique identifier for the activity.
</p><p>
        This MUST be prefixed with EITHER the current IATI
        organisation identifier for the reporting organisation
        (reporting-org/@ref) OR a previous identifier reported in
        other-identifier, and suffixed with the organisation’s own
        activity identifier. The prefix and the suffix should be
        separated by a hyphen "-".
</p><p>
        Once an activity has been reported to IATI its identifier MUST
        NOT be changed in subsequent updates.
      </p>
              '''
  'other-identifier':
    fixedDataType:true
    helpText: '''
<p>
        An other identifier for the activity. This may be a publishers
        own identifier that it wishes to record with the activity.
        This element is also used to trace changes to activity
        identifiers, for example when and organisation has changed
        it's organisation identifier.
      </p>
              '''
  'narrative':
    fixedDataType:true
    helpText: '''
<p>
        The free text name or description of the item being described. This can
        be repeated in multiple languages.
      </p>
              '''
  'activity-status':
    fixedDataType:true
    helpText: '''
<p>
        The current status of the activity. See codelist for values.
      </p>
              '''
  'activity-date':
    fixedDataType:true
    helpText: '''
<p>
        The planned and actual start and completion dates of the
        activity. Start dates may reflect either the commencement of
        funding, planning or physical activity. End dates should,
        wherever possible, reflect the ending of physical activity.
        
        The narrative content may contain text (e.g. 2011Q1) for
        accurately recording less specific dates such as month,
        quarter, or year.
      </p>
              '''
  'contact-info':
    fixedDataType:true
    helpText: '''
<p>
        Contact information for the activity.  Specify whatever is
        available.  You may repeat this element for each contact
        person.
      </p>
              '''
  'participating-org':
    fixedDataType:true
    helpText: '''
<p>
        An organisation involved with the activity. May be a donor,
        fund, agency, etc. Specifying the @ref identifier is strongly
        recommended. May contain the organisation name as narrative.
</p><p>
        If the reporting organisation plays a role in the activity it
        should be repeated here. One organisation may play more than
        one role (eg, funding and implementing): in such a case each
        role should be reported and the name of the organisation
        repeated.
      </p>
              '''
  'activity-scope':
    fixedDataType:true
    helpText: '''
<p>
        The geographical scope of the activity: regional, national,
        sub-national, etc.
      </p>
              '''
  'recipient-country':
    fixedDataType:true
    helpText: '''
<p>
        A country that will benefit from this activity. If a specific
        country is not known the recipient-region element should be
        used instead. For geographical location, use the location
        element.
</p><p>
        Multiple countries and regions can be reported, in which case
        the percentage attribute MUST be used to specify the share of
        total commitments across all reported countries and regions.
</p><p>
        The country can also be specified at transaction rather than
        activity level. If recipient-country OR recipient-region are 
        reported at the transaction level, ALL transactions MUST 
        contain a recipient-country or recipient-region element and 
        iati-activity/recipient-country 
        and iati-activity/recipient-region MUST NOT be used.
      </p>
              '''
  'recipient-region':
    fixedDataType:true
    helpText: '''
<p>
        A supranational geopolitical region that will benefit from
        this activity. For sub-national geographical location, use the
        location element.
</p><p>
        Multiple countries and regions can be reported, in which case
        the percentage attribute MUST be used to specify the share of
        total commitments across all reported countries and regions.
        Recipient-region must not be used merely to describe the
        region of a country reported in recipient-region, but ONLY if
        the region is a recipient IN ADDITION to the country.
</p><p>
        Region can also be reported at transaction rather than
        activity level. If transaction/recipient-country AND/OR
        transaction/recipient-region are used THEN ALL transaction
        elements MUST contain a recipient-country and/or
        recipient-region element AND iati-activity/recipient-region
        and iati-activity/recipient-region MUST NOT be used AND each
        transaction MUST only contain one recipient-country or
        recipient-region.
      </p>
              '''
  'location':
    fixedDataType:true
    helpText: '''
<p>
        The sub-national geographical identification of the target
        locations of an activity. These can be described by gazetteer
        reference, coordinates, administrative areas or a textual
        description. Any number of locations may be reported.
      </p>
              '''
  'sector':
    fixedDataType:true
    helpText: '''
<p>
        A recognised code, from a recognised vocabulary, classifying
        the purpose of the activity. Sector MUST EITHER be reported
        here OR at transaction level for ALL transactions
      </p>
              '''
  'country-budget-items':
    fixedDataType:true
    helpText: '''
<p>
        This item encodes the alignment of activities with both the
        functional and administrative classifications used in the
        recipient country's Chart of Accounts. This applies to both
        on- and off-budget activities.
      </p>
              '''
  'policy-marker':
    fixedDataType:true
    helpText: '''
<p>
        A policy or theme addressed by the activity. This element was
        designed for the reporting of OECD DAC CRS policy markers
        (columns 20-23 and 28-31 of the CRS++ reporting format) but
        the vocabulary attribute allows it use by other (including
        local) systems. This element can be repeated for each policy
        marker. 
      </p>
              '''
  'collaboration-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of collaboration involved in the activity's
        disbursements, e.g. "bilateral" or "multilateral".
      </p>
              '''
  'default-finance-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of finance (e.g. grant, loan, debt relief, etc). This
        the default value for all transactions in the activity report;
        it can be overridden by individual transactions.
      </p>
              '''
  'default-flow-type':
    fixedDataType:true
    helpText: '''
<p>
        Whether the activity is funded by Official Development
        Assistance (ODA), Other Official Flows (OOF), etc
      </p>
              '''
  'default-aid-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of aid being supplied (project-type intervention,
        budget support, debt relief, etc.). This element specifies a
        default for all the activity's financial transactions; it can
        be overridden at the individual transaction level.
      </p>
              '''
  'default-tied-status':
    fixedDataType:true
    helpText: '''
<p>
        Whether the aid is untied, tied, or partially tied. This
        element specifies a default for all the activity's financial
        transactions; it can be overridden at the individual
        transaction level.
        
        If an activity is partially tied it is recommended that tied
        and untied commitments are reported as separate transactions
        and that transaction/tied-status is used to classify them.
      </p>
              '''
  'budget':
    fixedDataType:true
    helpText: '''
<p>
        The value of the aid activity's budget for each financial
        quarter or year over the lifetime of the activity. The total
        budget for an activity should be reported as a commitment in
        the transaction element. The purpose of this element is to
        provide predictability for recipient planning on an annual
        basis. The status explains whether the budget being reported 
        is indicative or has been formally committed. The value 
        should appear within the BudgetStatus codelist. If the @status 
        attribute is not present, the budget is assumed to be 
        indicative. While it is useful for the sum of budgets to match 
        the sum of commitments this is not necessarily the case, 
        depending on a publisher's business model and legal frameworks. 
      </p>
              '''
  'planned-disbursement':
    fixedDataType:true
    helpText: '''
<p>
        The planned disbursement element should only be used to report
        specific planned cash transfers. These should be reported for
        a specific date or a meaningfully predictable period. These
        transactions should be reported in addition to budgets - which
        are typically annual breakdowns of the total activity
        commitment.
      </p>
              '''
  'capital-spend':
    fixedDataType:true
    helpText: '''
<p>
        The percentage of the total commitment that is for capital
        spending
      </p>
              '''
  'transaction':
    fixedDataType:true
    helpText: '''
<p>
        Transactions recording committed or actual funds flowing in or
        out of an aid activity.
      </p>
              '''
  'document-link':
    fixedDataType:true
    helpText: '''
<p>
        A  link to an online, publicly accessible web page or
        document.
      </p>
              '''
  'related-activity':
    fixedDataType:true
    helpText: '''
<p>
        Another separately reported IATI activity that is related to
        this one. The 'type' attribute describes the type of
        relationship: eg. parent, child, multifunded ... 
      </p>
              '''
  'conditions':
    fixedDataType:true
    helpText: '''
<p>
        Specific terms and conditions attached to the activity that,
        if not met, may influence the delivery of commitments made by
        participating organisations.
      </p>
              '''
  'result':
    fixedDataType:true
    helpText: '''
<p>
        A container for reporting outputs, outcomes, impacts and other
        results that stem directly from the activity. This may be
        repeated for each type of result reported.
      </p>
              '''
  'legacy-data':
    fixedDataType:true
    helpText: '''
<p>
        The legacy data element allows for the reporting of values
        held in a field in the reporting organisation's system which
        is similar, but not identical to an IATI element.
      </p>
              '''
  'crs-add':
    fixedDataType:true
    helpText: '''
<p>
        Additional items specific to CRS++ reporting.
      </p>
              '''
  'fss':
    fixedDataType:true
    helpText: '''
<p>
        This section allows entry of data required for the OECD
        DAC Forward Spending Survey at an activity level.
      </p>
              '''
  'humanitarian-scope':
    fixedDataType:true
    helpText: '''
<p>
        Classification of emergencies, appeals and other humanitarian 
        events and actions.
      </p>
              '''

