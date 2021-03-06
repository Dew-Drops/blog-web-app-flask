from datetime import datetime
import werkzeug.utils
from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
import json
import os
import math
from flask_mail import Mail
with open('config.json', 'r') as c:
    params = json.load(c)['params']
local_server = True

app = Flask(__name__)
app.secret_key = "super-secret-key"


app.config['UPLOAD_FOLDER'] = params['upload_loc']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)

# if local_server:
#     app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
# else:
#     app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
# app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///the_bannermen_blog.sqlite"
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///the_bannermen_blog.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] =False 
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(20), nullable=False)
    mes = db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(50), nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    tagline = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    x = int(params['no_of_posts'])
    last = math.ceil(len(posts)/x)
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*x:((page-1)*x + x)]
    if page == 1:
        prev="#"
        next="/?page=" + str(page+1)
    elif page == last:
        prev="/?page=" + str(page-1)
        next="#"
    else:
        prev="/?page=" + str(page-1)
        next="/?page=" + str(page+1)
    return render_template('index.html', params = params, posts = posts, prev = prev, next = next)
    
@ app.route("/about")
def about():
    return render_template('about.html', params = params)


@ app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title=request.form.get('title')
            tline=request.form.get('tline')
            slug=request.form.get('slug')
            content=request.form.get('content')
            img_file=request.form.get('img_file')
            date=datetime.now()
            if sno == '0':
                post={"sno": '0'}
                post=Posts(title = box_title, slug = slug, content = content,
                             tagline = tline, img_file = img_file, date = date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno = sno).first()
                post.title=box_title
                post.slug=slug
                post.content=content
                post.tagline=tline
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(sno = sno).first()
        return render_template('edit.html', params = params, post = post, sno = sno)
    return render_template('login.html', params = params)####

@ app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post=Posts.query.filter_by(sno = sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@ app.route("/dashboard", methods = ['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts=Posts.query.all()
        return render_template('dashboard.html', params = params, posts = posts)
    if request.method == 'POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user']=username
            posts=Posts.query.all()
            return render_template('dashboard.html', params = params, posts = posts)
        
    
    return render_template('login.html', params = params)
    
@ app.route("/contact_request", methods = ['GET', 'POST'])
def contact_request():
    if 'user' in session and session['user'] == params['admin_user']:
        contacts=Contacts.query.all()
        return render_template('contact_request.html', params = params, contacts=contacts)
    if request.method == 'POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user']=username
            contacts=Contacts.query.all()
            return render_template('contact_request.html', params = params, contacts=contacts)
    return render_template('login.html', params = params)

@ app.route("/delete_contact/<string:sno>", methods = ['GET', 'POST'])
def delete_contact(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        contacts=Contacts.query.filter_by(sno = sno).first()
        db.session.delete(contacts)
        db.session.commit()
    return redirect('/contact_request')


@ app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if(request.method == 'POST'):
            f=request.files['file1']
            f.save(os.path.join(
                app.config['UPLOAD_FOLDER'], werkzeug.utils.secure_filename(f.filename)))
            return "Uploaded Successfully"
    return render_template('login.html', params = params)####

@ app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")
   






@ app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method == 'POST'):
        # add entry to data base
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        mes=request.form.get('mes')
        entry=Contacts(name = name, email = email,
                         phone_num=phone, mes=mes, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message from ' + name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=mes+"\n\n"+email+"\n"+phone
                          )
    return render_template('contact.html', params=params)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post(post_slug):
    ppost = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=ppost)


if __name__ == "__main__":
    app.run(debug=True, port=8000)
