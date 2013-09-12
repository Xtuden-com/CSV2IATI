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
      'text':
        datatype: 'column'
        required: false
      'owner-ref':
        datatype: 'column'
        required: false
      'owner-name':
        datatype: 'column'
        required: false
  'activity-website':
    datatype: 'compound'
    label: 'Activity Website'
    fields:
      'text':
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
  'activity-date':
    datatype: 'compound'
    label: 'Activity Date'
    fields:
      'type':
        datatype: 'column'
        required: true
      'iso-date':
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
      'job-title':
        datatype: 'compound'
        label: 'Job Title'
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
      'website':
        datatype: 'compound'
        label: 'Website'
        fields:
            'text':
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
  'activity-scope':
    datatype: 'compound'
    label: 'Activity Scope'
    fields:
        'text':
          datatype: 'column'
          required: false
        'code':
          datatype: 'column'
          required: false
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
      'vocabulary':
        datatype: 'column'
        required: false
      'percentage':
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
  'country-budget-items':
    datatype: 'compound'
    label: 'Country Budget Items'
    fields:
      'text':
        datatype: 'column'
        required: false
      'vocabulary':
        datatype: 'column'
        required: true
      'budget-item':
        datatype: 'compound'
        label: 'Budget Item'
        fields:
          'text':
            datatype: 'column'
            required: false
          'code':
            datatype: 'column'
            required: true
          'percentage':
            datatype: 'column'
            required: true
          'description':
            datatype: 'compound'
            label: 'Description'
            fields:
                'text':
                  datatype: 'column'
                  required: false
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
  'crs-add':
    datatype: 'compound'
    label: 'Crs Add'
    fields:
      'aidtype-flag':
        datatype: 'compound'
        label: 'Aidtype Flag'
        fields:
          'text':
            datatype: 'column'
            required: false
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
                'text':
                  datatype: 'column'
                  required: false
                'code':
                  datatype: 'column'
                  required: false
          'repayment-plan':
            datatype: 'compound'
            label: 'Repayment Plan'
            fields:
                'text':
                  datatype: 'column'
                  required: false
                'code':
                  datatype: 'column'
                  required: false
          'commitment-date':
            datatype: 'compound'
            label: 'Commitment Date'
            fields:
                'text':
                  datatype: 'column'
                  required: false
                'iso-date':
                  datatype: 'column'
                  required: false
          'repayment-first-date':
            datatype: 'compound'
            label: 'Repayment First Date'
            fields:
                'text':
                  datatype: 'column'
                  required: false
                'iso-date':
                  datatype: 'column'
                  required: false
          'repayment-final-date':
            datatype: 'compound'
            label: 'Repayment Final Date'
            fields:
                'text':
                  datatype: 'column'
                  required: false
                'iso-date':
                  datatype: 'column'
                  required: false
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
        A globally unique identifier for this activity. This should be
        in the form of the IATI Organisation Identifier (for the
        reporting organisation) concatenated to that organisation's
        activity identifier. (NB. Two or more reporting organisations
        may publish information on the same activity. To
        cross-reference these reports the other-identifier element
        should be used.)
      </p>
              '''
  'other-identifier':
    fixedDataType:true
    helpText: '''
<p>
        An alternative, non-IATI identifier for the activity.  This
        identifier is not guaranteed to be unique or persistent (it
        depends on the owner organisation's policies, not IATI's).
</p><p>
        If other-identifier is present then either @owner-ref or
        @owner-name must be present
      </p>
              '''
  'activity-website':
    fixedDataType:true
    helpText: '''
<p>
        A link to a web site providing more information about the aid
        activity.  Multiple versions of the link may appear for
        different languages.
      </p>
              '''
  'title':
    fixedDataType:true
    helpText: '''
<p>
        A short, human-readable title.  May be repeated for different
        languages.
      </p>
              '''
  'description':
    fixedDataType:true
    helpText: '''
<p>
              A human-readable description of the transaction.
            </p>
              '''
  'activity-status':
    fixedDataType:true
    helpText: '''
<p>
        The current status of the project (e.g. "planned"), using a
        list defined by IATI.  For the value of the @code attribute,
        see <a href="http://iatistandard.org/codelists/activity_status" target="_blank">http://iatistandard.org/codelists/activity_status</a>
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
        Dates should be in ISO 8601 date YYYY-MM-DD format, e.g. 
        2010-10-01. 
        
        For the value of the @type attribute, see
        <a href="http://iatistandard.org/codelists/activity_date_type" target="_blank">http://iatistandard.org/codelists/activity_date_type</a>
</p><p>
        The text content may contain a general date text (e.g. 2011Q1)
        for recording less specific dates such as month, quarter, or
        year.
      </p>
              '''
  'contact-info':
    fixedDataType:true
    helpText: '''
<p>
        Contact information for the project.  Specify whatever is
        available.  You may repeat this element for each contact
        person.
      </p>
              '''
  'participating-org':
    fixedDataType:true
    helpText: '''
<p>
        An organisation (including the reporting organisation)
        involved with the activity.  May be a donor, fund, agency,
        etc.  Specifying the @identifier and @role attributes is
        strongly recommended.  May contain the organisation name as
        content.
</p><p>
        For the value of the @type attribute, see
        <a href="http://iatistandard.org/codelists/organisation-type" target="_blank">http://iatistandard.org/codelists/organisation-type</a>
</p><p>
        For the value of the @ref attribute, see the list of
        officially-registered organizations at
        <a href="http://iatistandard.org/codelists/organisation" target="_blank">http://iatistandard.org/codelists/organisation</a>
      </p>
              '''
  'activity-scope':
    fixedDataType:true
    helpText: '''
<p>
        What geographical area does the activity encompass?
        eg. Global, Regional, Multi-National, National, Multiple
        (sub-national) administrative areas, etc
      </p>
              '''
  'recipient-country':
    fixedDataType:true
    helpText: '''
<p>
        A partner country that will benefit from this activity.  This
        element is primarily for administrative and geopolitical
        purposes.  If a specific country is not known, the activity
        report can use the recipient-region element instead. For
        geographical location, use the location element.
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/country" target="_blank">http://iatistandard.org/codelists/country</a>
      </p>
              '''
  'recipient-region':
    fixedDataType:true
    helpText: '''
<p>
        A geopolitical region (above the country level) that will
        benefit from this activity.  This element is primarily for
        administrative and geopolitical purposes.  If the specific
        country/-ies are known, the activity report can use the
        recipient-country element instead. For geographical location,
        use the location element.
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/region" target="_blank">http://iatistandard.org/codelists/region</a>
      </p>
              '''
  'location':
    fixedDataType:true
    helpText: '''
<p>
        A geographical location.
      </p>
              '''
  'sector':
    fixedDataType:true
    helpText: '''
<p>
        Sector code and name.  For the value of the @code attribute,
        see <a href="http://iatistandard.org/codelists/sector" target="_blank">http://iatistandard.org/codelists/sector</a>
</p><p>
        Either the @code attribute or descriptive text content must be
        present.
      </p>
              '''
  'country-budget-items':
    fixedDataType:true
    helpText: '''
<p>
        Recipient country budget items.
</p><p>
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
        A policy or theme addressed by the activity.  A text
        description of the theme appears in the content, and a formal
        identifier appears in the @ref attribute.  The @vocabulary
        attribute can also help to segment the markers into separate
        vocabularies.  This element can be repeated for each policy
        marker.  For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/policy_marker" target="_blank">http://iatistandard.org/codelists/policy_marker</a>
      </p>
              '''
  'collaboration-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of collaboration involved in the project's
        disbursements, e.g. "bilateral" or "multilateral".
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/collaboration_type" target="_blank">http://iatistandard.org/codelists/collaboration_type</a>
      </p>
              '''
  'default-finance-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of finance (e.g. debt relief). The types will be
        defined by IATI.  This the default value for all transactions
        in the activity report; it can be overridded by individual
        transactions.
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/finance_type" target="_blank">http://iatistandard.org/codelists/finance_type</a>
      </p>
              '''
  'default-flow-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of assistance provided, e.g. Official Development
        Assistance (ODA).  Type types will be defined by IATI.
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/flow_type" target="_blank">http://iatistandard.org/codelists/flow_type</a>
      </p>
              '''
  'default-aid-type':
    fixedDataType:true
    helpText: '''
<p>
        The type of aid being supplied (budget support, debt relief,
        etc.).  This element specifies a default for all the
        activity's financial transactions; it can be overridden at the
        individual transaction level.
</p><p>
        For the value of the @code attribute, see
        <a href="http://iatistandard.org/codelists/aid_type" target="_blank">http://iatistandard.org/codelists/aid_type</a>
      </p>
              '''
  'default-tied-status':
    fixedDataType:true
    helpText: '''
<p>
        Specify whether the aid is untied, tied, or partially tied,
        using a code list created by IATI.  The content is free text
        that can optionally provide more detail.  For the value of the
        @code attribute, see
        <a href="http://iatistandard.org/codelists/tied_status" target="_blank">http://iatistandard.org/codelists/tied_status</a>
      </p>
              '''
  'budget':
    fixedDataType:true
    helpText: '''
<p>
        The value of the aid activity's budget for each financial year
        as in the original project document.
      </p>
              '''
  'planned-disbursement':
    fixedDataType:true
    helpText: '''
<p>
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
        Committed or actual money flowing in or out of an aid
        activity.The @ref attribute allows uniquely identifying a
        transaction, to match it up with the corresponding in- or
        outflow in a different activity.
      </p>
              '''
  'document-link':
    fixedDataType:true
    helpText: '''
<p>
        A categorized link to an external document.
      </p>
              '''
  'related-activity':
    fixedDataType:true
    helpText: '''
<p>
        XX.XX Related Activity
</p><p>
        Another IATI activity related to this one.  The 'type'
        attribute describes the type of relationship (e.g. parent,
        sibling).  This does not need to be used to express funding
        relationships, since those are covered in individual
        transactions.
</p><p>
        For the value of the @type attribute, see
        <a href="http://iatistandard.org/codelists/related_activity_type" target="_blank">http://iatistandard.org/codelists/related_activity_type</a>
      </p>
              '''
  'conditions':
    fixedDataType:true
    helpText: '''
<p>
        Conditions attached to the activity.
      </p>
              '''
  'result':
    fixedDataType:true
    helpText: '''
<p>
        A measurable result of aid work.
      </p>
              '''
  'legacy-data':
    fixedDataType:true
    helpText: '''
<p>
        Hold a single name=value pair of legacy data.  This element is
        *not* for adding new data types; instead, it holds the
        original (non-IATI) value or code for an existing data type.
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

