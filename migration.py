from flask import Flask, render_template, flash, request, Markup, session, redirect, url_for, escape, Response
from flaskext.sqlalchemy import SQLAlchemy
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey, UnicodeText, Date, DateTime, Float, Boolean
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
import ConfigParser
import csv
import time
import os
import chardet
import json
from werkzeug import secure_filename

# Get configuration details
Config = ConfigParser.RawConfigParser()
#try:
#    CONFIGURATION_FILE_DIR
#except NameError:

Config.read('/usr/sites/icconfig.ini')
DATABASE_CONNECTION = Config.get('Environment','database_connection')
UPLOAD_FOLDER = Config.get('Environment','uploads_location_path')
CONVERSION_API_SERVER = Config.get('Environment','conversion_api_server')
ALLOWED_EXTENSIONS = set(['csv'])
APP_SECRET_KEY = Config.get('Environment','app_secret_key')
APP_ADMIN_USERNAME = Config.get('Admin','username')
APP_ADMIN_PASSWORD = Config.get('Admin','password')

app = Flask(__name__)
# Initialise the database
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_CONNECTION
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
db = SQLAlchemy(app)
db.create_all()


class IATIModel(db.Model):
    id = db.Column(Integer, primary_key=True)
    model_owner = db.Column(UnicodeText)
    model_name = db.Column(UnicodeText)
    model_content = db.Column(UnicodeText)
    csv_id = db.Column(UnicodeText)
    csv_headers = db.Column(UnicodeText)
    csv_file = db.Column(UnicodeText)
    csv_encoding = db.Column(UnicodeText)
    model_created = db.Column(Date)
    
    def __init__(self, model_name, model_owner, csv_id): 
        self.model_name = model_name
        self.model_owner = model_owner
        self.model_created = datetime.utcnow()
	self.csv_id = csv_id

    def __repr__(self):
        return self.model_owner, self.id

class CSVFile(db.Model):
    id = db.Column(Integer, primary_key=True)
    csv_headers = db.Column(UnicodeText)
    csv_file = db.Column(UnicodeText)
    csv_encoding = db.Column(UnicodeText)
    csv_owner = db.Column(UnicodeText)

    def __init__(self, csv_file, csv_headers, csv_encoding, csv_owner):
        self.csv_file = csv_file
        self.csv_headers = csv_headers
        self.csv_encoding = csv_encoding
        self.csv_owner = csv_owner

    def __repr__(self):
        return self.csv_file, self.id

class User(db.Model):
    id = db.Column(Integer, primary_key=True)
    username = db.Column(UnicodeText)
    password = db.Column(UnicodeText)
    user_name = db.Column(UnicodeText)
    email_address = db.Column(UnicodeText)
    admin = db.Column(Boolean)
    user_created = db.Column(Date)
    pw_hash = db.Column(db.String())
    
    def __init__(self, username, password, user_name='', email_address='', admin='',user_created=''):
        self.username = username
        self.pw_hash = generate_password_hash(password)
        self.user_name = user_name
        self.email_address = email_address
        self.user_created = datetime.utcnow()
        self.admin = admin

    def check_password(self, password):
        return check_password_hash(self.pw_hash, password)

    def __repr__(self):
        return self.username, self.id, self.password

def run_the_migration():
    iatimodels = IATIModel.query.all()
    for model in iatimodels:
	filename = model.csv_file
        csv_headers = model.csv_headers
        csv_encoding = model.csv_encoding
	user_id = model.model_owner
	newcsvfile = CSVFile(filename, csv_headers, csv_encoding, user_id)
	db.session.add(newcsvfile)
        model.csv_id = newcsvfile.id
	db.session.commit()

if __name__ == "__main__":
    run_the_migration()
