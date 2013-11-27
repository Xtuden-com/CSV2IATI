import json
from csviatimodeleditor import IATIModel, db
import sys
import collections

dec = json.JSONDecoder(object_pairs_hook=collections.OrderedDict).decode

for m in IATIModel.query.all():
    if m.model_content:
        model = dec(m.model_content)
        try:
            multiple = model['organisation']['data-structure']['multiple']
            if type(multiple) == unicode and multiple != '':
                print(multiple)
                model['organisation']['data-structure']['multiple'] = [ multiple ] 
                m.model_content = json.dumps(model)
                db.session.add(m)
                db.session.commit()
        except KeyError:
            pass


