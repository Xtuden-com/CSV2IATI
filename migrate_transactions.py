import json
from csviatimodeleditor import IATIModel, db
import sys
import collections

dec = json.JSONDecoder(object_pairs_hook=collections.OrderedDict).decode

for m in IATIModel.query.all():
    if m.model_content:
        model = dec(m.model_content)
        for k,v in model['mapping'].items():
            if v['datatype'] == 'transaction':
                v['datatype'] = 'compound'
                v['fields'] = v['tdatafields']
                del v['tdatafields']
                v['fields']['transaction-type'] = v['fields']['transaction_type']
                del v['fields']['transaction_type']
                for k,field in v['fields'].items():
                    assert k == field['iati-field']
                    del field['iati-field']
                    field['datatype'] = 'compound'
        m.model_content = json.dumps(model)
        db.session.add(m)
        db.session.commit()


