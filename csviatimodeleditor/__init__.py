from flask import Flask, render_template, flash, request, Markup, session, redirect, url_for, escape
from flaskext.sqlalchemy import SQLAlchemy
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey, UnicodeText, Date, DateTime, Float
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
import os
from werkzeug import secure_filename
UPLOAD_FOLDER = 'static/uploads/'
ALLOWED_EXTENSIONS = set(['csv'])
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///csviati_models.sqlite'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
db = SQLAlchemy(app)

class IATIModel(db.Model):
    id = db.Column(Integer, primary_key=True)
    model_owner = db.Column(UnicodeText)
    model_name = db.Column(UnicodeText)
    model_content = db.Column(UnicodeText)
    csv_file = db.Column(UnicodeText)
    model_created = db.Column(Date)
    
    def __init__(self, model_name, model_owner, filename):
        self.model_name = model_name
        self.model_owner = model_owner
        self.model_created = datetime.utcnow()
        self.csv_file = filename

    def __repr__(self):
        return self.model_owner, self.id

class User(db.Model):
    id = db.Column(Integer, primary_key=True)
    username = db.Column(UnicodeText)
    password = db.Column(UnicodeText)
    user_name = db.Column(UnicodeText)
    email_address = db.Column(UnicodeText)
    user_created = db.Column(Date)
    pw_hash = db.Column(db.String())
    
    def __init__(self, username, password, user_name='', email_address='', user_created=''):
        self.username = username
        self.pw_hash = generate_password_hash(password)
        self.user_name = user_name
        self.email_address = email_address
        self.user_created = datetime.utcnow()

    def check_password(self, password):
        return check_password_hash(self.pw_hash, password)

    def __repr__(self):
        return self.username, self.id, self.password

@app.route("/")
def index():
    if 'username' in session:
        user_id = session['user_id']
        models = IATIModel.query.filter_by(model_owner=user_id)
        return render_template('dashboard.html', username=escape(session['username']), user_id=escape(session['user_id']), user_name=escape(session['user_name']), user_models=models)
    return render_template('form.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        u = User(username,password)
        getuser = User.query.filter_by(username=username).first()
        #u = User.query.filter_by(username=username, password=User.check_password(password)).first()
        
        ## found a user
        if (getuser.check_password(password)):
            session['username'] = request.form['username']
            session['user_id'] = getuser.id
            session['user_name'] = getuser.user_name
            return redirect(url_for('index'))
        else:
            return "Sorry, couldn't find that user"
    return '''
        <form action="" method="post">
            <p><input type=text name=username>
            <p><input type=submit value=Login>
        </form>
    '''
    
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

@app.route('/create_model', methods=['GET','POST'])
def create_model():
    if 'username' in session:
        if (request.method == 'POST'):
            model_name = request.form['model_name']
            csv_file = request.files['file']
            if csv_file and allowed_file(csv_file.filename):
                user_id = session['user_id']
                filename = secure_filename(csv_file.filename) + str(datetime.utcnow())
                csv_file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                newmodel = IATIModel(model_name, user_id, filename)
                db.session.add(newmodel)
                db.session.commit()
                flash('Created your model', 'good')
                return redirect(url_for('model', id=newmodel.id))
        else:
            flash('Please supply a file', 'bad')
            return redirect(url_for('index'))
    return redirect(url_for('index'))

@app.route('/model/')
@app.route('/model/<id>', methods=['GET', 'POST'])
def model(id=''):
    if (('username' in session) and (id)):
        if request.method == 'GET':
            # Get model details        
            getmodel = IATIModel.query.filter_by(id=id).first()
            if getmodel.model_content is not None:
                model_content_real = getmodel.model_content
            else:
                model_content_real = ''
            return render_template('model.html', id=id, model_name=getmodel.model_name, model_content=Markup(model_content_real))
        elif request.method == 'POST':
            getmodel = IATIModel.query.filter_by(id=id).first()
            getmodel.model_content = request.form['model']
            db.session.add(getmodel)
            db.session.commit()
            return redirect(url_for('model', id=id))
    else:
        return redirect(url_for('index'))

@app.route('/user')
@app.route('/user/<id>', methods=['GET', 'POST'])
def user(id=''):
    if (('username' in session) and (id)):
        return "This section hasn't been made yet"
    else:
        return redirect(url_for('index'))

@app.route('/register', methods=['GET','POST'])
def register():
    username = request.form['username']
    password = request.form['password']
    user_name = request.form['user_name']
    email_address = request.form['email']
    u = User(username,password,user_name,email_address)
    db.session.add(u)
    db.session.commit()
    
    session['username'] = u.username
    session['user_id'] = u.id
    session['user_name'] = u.user_name
    flash("Your account has been created!", 'good')
    return redirect(url_for('index'))


@app.route('/logout')
def logout():
    # remove the username from the session if its there
    session.pop('username', None)
    return redirect(url_for('index'))

# set the secret key.  keep this really secret:
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

if __name__ == "__main__":
    db.create_all()
    if not os.path.exists(UPLOAD_FOLDER):
        try:
            os.makedirs(UPLOAD_FOLDER)
        except Exception, e:
            print "Failed:", e
            print "Couldn't create directory"        
    app.run(debug=True)
