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
                    'iso-date':
                      datatype: 'column'
                      required: false
              'period-end':
                datatype: 'compound'
                label: 'Period End'
                fields:
                    'text':
                      datatype: 'column'
                      required: false
                    'iso-date':
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
            'iso-date':
              datatype: 'column'
              required: false
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
            'text':
              datatype: 'column'
              required: false
            'iso-date':
              datatype: 'column'
              required: false
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
            'iso-date':
              datatype: 'column'
              required: false
      'period-end':
        datatype: 'compound'
        label: 'Period End'
        fields:
            'text':
              datatype: 'column'
              required: false
            'iso-date':
              datatype: 'column'
              required: false
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

DIMENSION_META =
  'iati-activity':
    fixedDataType:true
    helpText: '''

        Top-level element for a single IATI activity report.
      
              '''
  'activity-website':
    fixedDataType:true
    helpText: '''

        A link to a web site providing more information about the aid
        activity.  Multiple versions of the link may appear for
        different languages.
      
              '''
  'reporting-org':
    fixedDataType:true
    helpText: '''

        The organisation issuing a report (not necessarily involved in
        the organisation or activity being described).  May be a
        donor, fund, agency, etc.  Specifying the @identifier and
        @role attributes is strongly recommended.  May contain the
        organisation name as content.

        For the value of the @type attribute, see
        http://iatistandard.org/codelists/organisation-type

        For the value of the @ref attribute, see the list of
        officially-registered organizations at
        http://iatistandard.org/codelists/organisation
      
              '''
  'participating-org':
    fixedDataType:true
    helpText: '''

        An organisation (including the reporting organisation)
        involved with the activity.  May be a donor, fund, agency,
        etc.  Specifying the @identifier and @role attributes is
        strongly recommended.  May contain the organisation name as
        content.

        For the value of the @type attribute, see
        http://iatistandard.org/codelists/organisation-type

        For the value of the @ref attribute, see the list of
        officially-registered organizations at
        http://iatistandard.org/codelists/organisation
      
              '''
  'recipient-country':
    fixedDataType:true
    helpText: '''

        A partner country that will benefit from this activity.  This
        element is primarily for administrative and geopolitical
        purposes.  If a specific country is not known, the activity
        report can use the recipient-region element instead. For
        geographical location, use the location element.

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/country
      
              '''
  'recipient-region':
    fixedDataType:true
    helpText: '''

        A geopolitical region (above the country level) that will
        benefit from this activity.  This element is primarily for
        administrative and geopolitical purposes.  If the specific
        country/-ies are known, the activity report can use the
        recipient-country element instead. For geographical location,
        use the location element.

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/region
      
              '''
  'collaboration-type':
    fixedDataType:true
    helpText: '''

        The type of collaboration involved in the project's
        disbursements, e.g. "bilateral" or "multilateral".

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/collaboration_type
      
              '''
  'default-flow-type':
    fixedDataType:true
    helpText: '''

        The type of assistance provided, e.g. Official Development
        Assistance (ODA).  Type types will be defined by IATI.

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/flow_type
      
              '''
  'default-aid-type':
    fixedDataType:true
    helpText: '''

        The type of aid being supplied (budget support, debt relief,
        etc.).  This element specifies a default for all the
        activity's financial transactions; it can be overridden at the
        individual transaction level.

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/aid_type
      
              '''
  'default-finance-type':
    fixedDataType:true
    helpText: '''

        The type of finance (e.g. debt relief). The types will be
        defined by IATI.  This the default value for all transactions
        in the activity report; it can be overridded by individual
        transactions.

        For the value of the @code attribute, see
        http://iatistandard.org/codelists/finance_type
      
              '''
  'iati-identifier':
    fixedDataType:true
    helpText: '''

        IATI identifier

        This element contains the official IATI identifier for an
        entity (activity or organisation).  It must appear only once
        in the XML file, and is guaranteed unique across all entities
        of the same type (there will never be two organisations or
        activities with the same IATI identifier).
      
              '''
  'other-identifier':
    fixedDataType:true
    helpText: '''

        An alternative, non-IATI identifier for the activity.  This
        identifier is not guaranteed to be unique or persistent (it
        depends on the owner organisation's policies, not IATI's).
      
              '''
  'title':
    fixedDataType:true
    helpText: '''

        A short, human-readable title.  May be repeated for different
        languages.
      
              '''
  'description':
    fixedDataType:true
    helpText: '''

                A human-readable description of the transaction.
              
              '''
  'sector':
    fixedDataType:true
    helpText: '''

        Sector code and name.  For the value of the @code attribute,
        see http://iatistandard.org/codelists/sector
      
              '''
  'activity-date':
    fixedDataType:true
    helpText: '''

        Planned starting date for the activity in ISO 8601 date
        format, e.g. "2010-10-01".  For the value of the @type
        attribute, see
        http://iatistandard.org/codelists/activity_date_type
      
              '''
  'activity-status':
    fixedDataType:true
    helpText: '''

        The current status of the project (e.g. "planned"), using a
        list defined by IATI.  For the value of the @code attribute,
        see http://iatistandard.org/codelists/activity_status
      
              '''
  'contact-info':
    fixedDataType:true
    helpText: '''

        Contact information for the project.  Specify whatever is
        available.
      
              '''
  'default-tied-status':
    fixedDataType:true
    helpText: '''

        Specify whether the aid is untied, tied, or partially tied,
        using a code list created by IATI.  The content is free text
        that can optionally provide more detail.  For the value of the
        @code attribute, see
        http://iatistandard.org/codelists/tied_status
      
              '''
  'policy-marker':
    fixedDataType:true
    helpText: '''

        A policy or theme addressed by the activity.  A text
        description of the theme appears in the content, and a formal
        identifier appears in the @ref attribute.  The @vocabulary
        attribute can also help to segment the markers into separate
        vocabularies.  This element can be repeated for each policy
        marker.  For the value of the @code attribute, see
        http://iatistandard.org/codelists/policy_marker
      
              '''
  'location':
    fixedDataType:true
    helpText: '''

        A geographical location.
      
              '''
  'transaction':
    fixedDataType:true
    helpText: '''

        Committed or actual money flowing in or out of an aid
        activity.The @ref attribute allows uniquely identifying a
        transaction, to match it up with the corresponding in- or
        outflow in a different activity.
      
              '''
  'result':
    fixedDataType:true
    helpText: '''

        A measurable result of aid work.
      
              '''
  'conditions':
    fixedDataType:true
    helpText: '''

        Conditions attached to the activity.
      
              '''
  'budget':
    fixedDataType:true
    helpText: '''

        The value of the aid activity's budget for each financial year
        as in the original project document.
      
              '''
  'planned-disbursement':
    fixedDataType:true
    helpText: '''

      
              '''
  'related-activity':
    fixedDataType:true
    helpText: '''

        XX.XX Related Activity

        Another IATI activity related to this one.  The 'type'
        attribute describes the type of relationship (e.g. parent,
        sibling).  This does not need to be used to express funding
        relationships, since those are covered in individual
        transactions.

        For the value of the @type attribute, see
        http://iatistandard.org/codelists/related_activity_type
      
              '''
  'document-link':
    fixedDataType:true
    helpText: '''

        A categorized link to an external document.
      
              '''
  'legacy-data':
    fixedDataType:true
    helpText: '''

        Hold a single name=value pair of legacy data.  This element is
        *not* for adding new data types; instead, it holds the
        original (non-IATI) value or code for an existing data type.
      
              '''

