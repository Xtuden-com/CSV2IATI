import sys
import logging, sys
import os
logging.basicConfig(stream=sys.stderr)
activate_this = 'ABS_PATH_TO_YOUR_PYENV_IN_MODELEDITOR_FOLDER/CSV-IATI-Converter.modeleditor/pyenv/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))
sys.path.insert(0, 'ABS_PATH_TO_MODELEDITOR_FOLDER/CSV-IATI-Converter.modeleditor')
from csviatimodeleditor import app as application

