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

# Initialise the database
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_CONNECTION
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
db = SQLAlchemy(app)
db.create_all()


class IATIModel(db.Model):
    id = db.Column(Integer, primary_key=True)
    model_owner = db.Column(UnicodeText)
    model_name = db.Column(UnicodeText)
    model_content = db.Column(UnicodeText)
    csv_headers = db.Column(UnicodeText)
    csv_file = db.Column(UnicodeText)
    csv_encoding = db.Column(UnicodeText)
    model_created = db.Column(Date)
    
    def __init__(self, model_name, model_owner, filename,csv_headers,csv_encoding):
        self.model_name = model_name
        self.model_owner = model_owner
        self.model_created = datetime.utcnow()
        self.csv_file = filename
        self.csv_headers = csv_headers
        self.csv_encoding = csv_encoding

    def __repr__(self):
        return self.model_owner, self.id

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

@app.route("/")
def index():
    if 'username' in session:
        user_id = session['user_id']
        models = IATIModel.query.filter_by(model_owner=user_id)
        if 'admin' in session:
            admin = True
            all_users = User.query.all()
            all_models = []
            for user in all_users:
                this_user_data = []
                x='1'
                user_models = IATIModel.query.filter_by(model_owner=user.id)
                this_user_data = dict({'user_id': user.id,'username': user.username, 'user_models':user_models})
                all_models.append(this_user_data)
        else:
            all_models = ''
            all_users = ''
            admin = False
        return render_template('dashboard.html', username=escape(session['username']), user_id=escape(session['user_id']), user_name=escape(session['user_name']), user_models=models, admin=admin, models=all_models, users=all_users)
    return render_template('form.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = escape(request.form['username'])
        password = escape(request.form['password'])
        
        if ((username == APP_ADMIN_USERNAME) and (username != "YOUR_ADMIN_USERNAME_HERE (MAKE THIS REALLY SECRET)") and (password == APP_ADMIN_PASSWORD)):
            session['username'] = escape(request.form['username'])
            session['user_id'] = '0'
            session['user_name'] = 'Master admin user'
            session['admin'] = '1'
            flash('Hello, admin user.', 'good')
            return redirect(url_for('index'))     
        
        u = User(username,password)
        getuser = User.query.filter_by(username=username).first()
        #u = User.query.filter_by(username=username, password=User.check_password(password)).first()
        
        ## found a user
        if ((getuser) and (getuser.check_password(password))):
            session['username'] = escape(request.form['username'])
            session['user_id'] = getuser.id
            session['user_name'] = getuser.user_name
            session['admin'] = getuser.admin
            flash('Welcome back.', 'good')
            return redirect(url_for('index'))
        else:
            flash("Could not find that user. Please try again.", 'bad')
            return redirect(url_for('index'))
    flash("Please log in.", 'bad')
    return redirect(url_for('index'))
    
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

@app.route('/create_model', methods=['GET','POST'])
def create_model():
    if 'username' in session:
        if (request.method == 'POST'):
            model_name = request.form['model_name']
            csv_file = request.files['file']
            something = request.files['file'].stream
            filename = secure_filename(os.path.splitext(csv_file.filename)[0]) + str(int(time.time())) + '.csv'
            csv_file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            reopen_for_headers=(open(os.path.join(app.config['UPLOAD_FOLDER'], filename)))
            the_csv = csv.DictReader(reopen_for_headers)
            columnnames = the_csv.fieldnames
            reopen_for_headers.close()
            reopen_for_decoding=(open(os.path.join(app.config['UPLOAD_FOLDER'], filename)))
            
            if not columnnames:
                flash('Could not detect column names from your data. Maybe your file is empty?', 'bad')
                return redirect(url_for('index'))
                    
            result = chardet.detect(reopen_for_decoding.read())
            csv_encoding = result['encoding']
            
            csv_headers = json.dumps(columnnames,encoding=csv_encoding)

            #csv_headers = ', '.join('"%s"' % unicode(header,csv_encoding) for header in columnnames)
            if csv_file and allowed_file(csv_file.filename):
                user_id = session['user_id']
                #filename = secure_filename(os.path.splitext(csv_file.filename)[0]) + str(int(time.time())) + '.csv'
                #the_file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                newmodel = IATIModel(model_name, user_id, filename,csv_headers,csv_encoding)
                db.session.add(newmodel)
                db.session.commit()
                flash('Created your model', 'good')
                return redirect(url_for('model', id=newmodel.id))
            else:
                flash('Please supply a file', 'bad')
                return redirect(url_for('index'))                
        else:
            flash('Please supply a file', 'bad')
            return redirect(url_for('index'))
    flash("Please log in.", 'bad')
    return redirect(url_for('index'))

@app.route('/csv_file', methods=['GET'])
@app.route('/csv_file/<id>', methods=['GET'])
@app.route('/csv_file/<id>/<filename>', methods=['GET'])
def csv_file(id='',filename=''):
    if (id and filename):
        getmodel = IATIModel.query.filter_by(id=id).first_or_404()
        if (filename==(getmodel.csv_file)):
            thepath=os.path.join(app.config['UPLOAD_FOLDER'], getmodel.csv_file)
            thefile = (open(thepath, 'r')).read()
            return Response(thefile, mimetype='text/csv')
        else:
            flash('Sorry, could not find that CSV file.','bad')
            return redirect(url_for('index'))
    else:
        flash('No CSV file selected.','bad')
        return redirect(url_for('index'))

@app.route('/model/convert/<id>')
def model_convert(id=id):
    if ('username' in session):
        if (id):        
            getmodel = IATIModel.query.filter_by(id=id).first_or_404()
            if getmodel is not None:
                if getmodel.model_content is not None:
                    import urllib
                    import urllib2
                    url = CONVERSION_API_SERVER
                    values = {'csv_url' : url_for('csv_file',id=getmodel.id,filename=getmodel.csv_file,_external=True),
                              'model_url' : url_for('model',id=getmodel.id,responsetype='json',_external=True)}

                    data = urllib.urlencode(values)
                    req = urllib2.Request(url, data)
                    try:
                        response = urllib2.urlopen(req)
                        the_page = response.read()
                        return the_page
                    except urllib2.HTTPError, e:
                        if (e.code == 400):
                            flash("Error 400. Could not convert your data. There was a fundamental error in the application. Please report this error.", "bad persist")
                            flash("The data file provided was: " + values["csv_file"], "notice persist")
                            flash("The mapping file provided was: " + values["model_file"], "notice persist")
                            return redirect(url_for('index'))
                
                else:
                    flash("That model has not yet been defined.", 'bad')
                    return redirect(url_for('index'))
            else:
                flash("Could not find that model.", 'bad')
                return redirect(url_for('index'))
        else:
            flash("Please select a model to convert.", 'bad')
            return redirect(url_for('index'))
    else:
        flash("Please log in.", 'bad')
        return redirect(url_for('index'))

@app.route('/model/')
@app.route('/model/<id>', methods=['GET', 'POST'])
@app.route('/model/<id>.<responsetype>', methods=['GET'])
def model(id='',responsetype=''):  
    if (responsetype and (responsetype=='json')):        
        getmodel = IATIModel.query.filter_by(id=id).first_or_404()
        if getmodel is not None:
            if getmodel.model_content is not None:
                return Response(getmodel.model_content, mimetype='application/json')
            else:
                flash('That model has not been defined yet. Please map your dimensions using the browser.', 'bad')
    if ('username' in session):
        if (id):
            if request.method == 'GET':
                # Get model details        
                getmodel = IATIModel.query.filter_by(id=id).first_or_404()
                if (('admin' in session) or ((session['user_id'])==getmodel.model_owner)):
                    sd = json.loads(getmodel.csv_headers)
                    if getmodel.model_content is not None:
                        model_content_real = getmodel.model_content
                    else:
                        model_content_real = ''
                    return render_template('model.html', id=id, model_name=getmodel.model_name, model_content=Markup(model_content_real),csv_headers=sd,csv_encoding=getmodel.csv_encoding,csv_file=getmodel.csv_file,model_created=str(getmodel.model_created))
                else:
                    flash("You don't have permission to edit that model.", 'bad')
                    return redirect(url_for('index'))
            elif request.method == 'POST':
                getmodel = IATIModel.query.filter_by(id=id).first_or_404()
                if (('admin' in session) or ((session['user_id'])==getmodel.model_owner)):
                    getmodel.model_content = request.form['model']
                    db.session.add(getmodel)
                    db.session.commit()
                    return redirect(url_for('model', id=id))
                else:
                    flash("You don't have permission to edit that model.", 'bad')
                    return redirect(url_for('index'))
        else:
            flash("Please select or create a model.", 'bad')
            return redirect(url_for('index'))
    else:
        flash("Please log in.", 'bad')
        return redirect(url_for('index'))

@app.route('/user/')
@app.route('/user/<id>', methods=['GET', 'POST'])
def user(id=''):
    if ('username' in session):
        if (id):
            if request.method == 'GET':
                # if the user is an admin or is looking at their own profile
                if (('admin' in session) or ((session['user_id'])==int(id))):
                    if 'admin' in session:
                        admin = True
                    else:
                        admin = False
                    user = User.query.filter_by(id=id).first_or_404()
                    return render_template('user.html', user=user, admin=admin)
                else:
                    flash("You do not have permission to edit that user's details.", 'bad')
                    return redirect(url_for('index'))
            elif request.method == 'POST':
                id = request.form['id']
                # if the user is an admin or is looking at their own profile
                if ((session['admin']) or ((session['user_id'])==int(id))):
                    u = User.query.filter_by(id=id).first()
                    u.username = request.form['username']
                    u.user_name = request.form['user_name']
                    u.email_address = request.form['email_address']
                    if (('admin' in request.form) and ('admin' in session)):
                        u.admin = '1'
                    else:
                        u.admin = '0'
                    if 'admin' in session:
                        admin = True
                    else:
                        admin = False
                    db.session.add(u)
                    db.session.commit()
                    flash('Updated user', 'good')
                    return render_template('user.html', user=u, admin=admin)
                else:
                    flash("You do not have permission to edit that user's details.", 'bad')
                    return redirect(url_for('index'))                
                
        else:
            users = User.query.all()
            return render_template('users.html', users=users)
    else:
        flash('Please log in.', 'bad')
        return redirect(url_for('index'))

@app.route('/register', methods=['GET','POST'])
def register():
    # Create database if it doesn't already exist
    db.create_all()
    username = escape(request.form['username'])
    password = escape(request.form['password'])
    user_name = escape(request.form['user_name'])
    email_address = escape(request.form['email'])
    admin = '0'
    user_check = User.query.filter_by(username=username).first()
    if user_check:
        flash("Sorry, that username has already been taken. Please choose another one.", 'bad')
        return redirect(url_for('index'))
    else:
        u = User(username,password,user_name,email_address,admin)
        db.session.add(u)
        db.session.commit()
        
        session['username'] = u.username
        session['user_id'] = u.id
        session['user_name'] = u.user_name
        flash("Your account has been created.", 'good')
        return redirect(url_for('index'))


@app.route('/logout')
def logout():
    # remove the login from the session if its there
    session.pop('username', None)
    session.pop('user_id', None)
    session.pop('user_name', None)
    session.pop('admin', None)
    flash('You have been logged out.', 'good')
    return redirect(url_for('index'))

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

# set the secret key.  keep this really secret:
app.secret_key = APP_SECRET_KEY

if __name__ == "__main__":
    db.create_all()
    if not os.path.exists(UPLOAD_FOLDER):
        try:
            os.makedirs(UPLOAD_FOLDER)
        except Exception, e:
            print "Failed:", e
            print "Couldn't create directory"        
    app.run(debug=True)
