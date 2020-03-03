import os
import urllib.request
from flask import Flask, flash, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import hashlib
from werkzeug.utils import secure_filename

max_file_size = 16777216
database_key = open("database_key.txt", "r")
flask_key = open("flask_key.txt","r")

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = database_key.read()
app.config['MYSQL_DB'] = 'blogTest'

app.config['SECRET_KEY'] = flask_key.read()

UPLOAD_FOLDER = '/home/jbosch/scrapyard/3rd_try/static/img/blog'
blog_folder = "/static/img/blog/"
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = max_file_size

mysql = MySQL(app)

ALLOWED_EXTENSIONS = ['png', 'jpg', 'jpeg', 'gif']

def allowed_file(filename):
    #Finds the extension of the file and checks if it is allowed
	return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = hashlib.sha256((request.form['password']).encode()).hexdigest()
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user_login WHERE username = %s AND psswrd = %s', (username, password))
        account = cursor.fetchone()
        if account:
            # Create session, access this data in other routes
            session['loggedin'] = True
            session['hiddenPosts'] = False
            session['id'] = account['id']
            session['username'] = account['username']
            session['name'] = account['name']
            msg= 'Logged in successfully!'
            return redirect(url_for('blog', msg=msg))
        else:
            msg = 'Invalid Credentials. Please try again.'
    return render_template('login.html', msg=msg)

@app.route('/logout')
def logout():
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('username', None)
   session.pop('name', None)
   session.pop('hiddenPosts', None)
   return redirect(url_for('login'))


def team_members():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM team')
    people = cursor.fetchall()
    people_per_subteam = 3

    subTeams =  (len(people)//people_per_subteam)
    if ((len(people)%people_per_subteam) != 0):
        subTeams += 1
    team = [[None for i in range(people_per_subteam)] for j in range(subTeams)]
            
    for i in range (len(people)):
        team [i//people_per_subteam][i%people_per_subteam] = people[i]

    return team

def values():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM ourValues')
    return cursor.fetchall()

@app.route('/')
def index():
    return render_template('home.html', team=team_members(), values=values())

@app.route('/home')
def home():
    return render_template('home.html', team=team_members(), values=values())

@app.route('/team')
def team():
    return render_template('home.html', section='team', team=team_members(), values=values())

@app.route('/product')
def product():
    return render_template('home.html', section='product', team=team_members(), values=values())

@app.route('/contact')
def contact():
    return render_template('home.html', section='contact', team=team_members(), values=values())

@app.route('/map')
def map():
    return render_template('map.html')

@app.route('/news')
def news():
    return render_template('news.html')

def filenameToPath(filename):
    return blog_folder + filename

def pathToFilename(path):
    return path[(len(blog_folder)):]


@app.route('/blog',  methods=['GET', 'POST'])
def blog():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if 'hiddenPosts' in session and session['hiddenPosts']:
        cursor.execute('SELECT * FROM blog_posts')
    else:
        cursor.execute('SELECT * FROM blog_posts WHERE public = 1')
    
    posts = cursor.fetchall()
    if request.method == 'POST' and 'title' in request.form and 'content' in request.form:
        file = request.files['file']
        title = request.form['title']
        content = request.form['content']
        if ('file' not in request.files) or (file.filename == ''):
            cursor.execute('INSERT INTO blog_posts (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES  (%s, %s, %s, %s)', (session['id'], session['name'], title, content))
            flash('No image uploaded')
        elif file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            cursor.execute('INSERT INTO blog_posts (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`,`pathToPic`) VALUES  (%s, %s, %s, %s, %s)', (session['id'], session['name'], title, content,filenameToPath(filename)))
            flash('File successfully uploaded')
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        else:
            flash('Allowed file types are png, jpg, jpeg, gif')
            return redirect(request.url)
        mysql.connection.commit()
        return redirect(url_for('blog'))
    return render_template('blog.html', posts=reversed(posts))


@app.route('/seeHidden/<b>')
def seeHidden(b):
    if (b == "False"):
        session['hiddenPosts'] = False
    if (b == "True"):
        session['hiddenPosts'] = True
    return redirect (url_for('blog'))


@app.route('/edit/<int:id>', methods=['GET', 'POST'])
def edit(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM blog_posts WHERE postID = %s' % (id))
    post = cursor.fetchone()
    if request.method == 'POST' and 'title' in request.form and 'content' in request.form:
        title = request.form['title']
        content = request.form['content']
        cursor.execute('UPDATE blog_posts SET postTitle = %s, postContent = %s, edited =  1 WHERE postID = %s' , (title, content, id) )
        mysql.connection.commit()
        return redirect (url_for('blog'))
    return render_template('edit.html', post=(post))

@app.route('/hide/<int:id>')
def hide(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('UPDATE blog_posts SET public = 0 WHERE postID = %s' % (id) ) 
    mysql.connection.commit()
    return redirect(url_for('blog'))

@app.route('/show/<int:id>')
def show(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('UPDATE blog_posts SET public = 1 WHERE postID = %s' % (id) ) 
    mysql.connection.commit()
    return redirect(url_for('blog'))

@app.route('/delete/<id>')
def delete(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM blog_posts WHERE postID = %s' % (id))
    pathToPic = cursor.fetchone()['pathToPic']
    if (pathToPic):
        filePath = UPLOAD_FOLDER + "/" + pathToFilename(pathToPic)
        os.system('rm %s' % filePath)
    cursor.execute('DELETE FROM blog_posts WHERE postID = %s' % (id) ) 
    mysql.connection.commit()
    return redirect(url_for('blog'))

@app.errorhandler(404)
def page_not_found(error):
   return render_template('404.html', title = '404'), 404

if __name__ == '__main__':
    app.run(debug=True)