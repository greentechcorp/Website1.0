from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import hashlib

app = Flask(__name__)

app.secret_key = 'your useless secret key'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'blogTest'

mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = hashlib.md5((request.form['password']).encode()).hexdigest()
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
        else:
            msg = 'Invalid Credentials. Please try again.'
    return render_template('index.html', msg=msg)

@app.route('/logout')
def logout():
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('username', None)
   session.pop('name', None)
   session.pop('hiddenPosts', None)
   return redirect(url_for('login'))


@app.route('/home')
def home():
    if 'loggedin' in session:
        return render_template('home.html', name=session['name'])
    return redirect(url_for('login'))


@app.route('/blog',  methods=['GET', 'POST'])
def blog():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if 'hiddenPosts' in session and session['hiddenPosts']:
        cursor.execute('SELECT * FROM blog_posts')
    else:
        cursor.execute('SELECT * FROM blog_posts WHERE public = 1')
    
    posts = cursor.fetchall()
    if request.method == 'POST' and 'title' in request.form and 'content' in request.form:
        title = request.form['title']
        content = request.form['content']
        cursor.execute('INSERT INTO blog_posts (`postOwnerID`,`postOwnerName`,`postTitle`,`postContent`) VALUES  (%s, %s, %s, %s)', (session['id'], session['name'], title, content))
        mysql.connection.commit()
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
    cursor.execute('DELETE FROM blog_posts WHERE postID = %s' % (id) ) 
    mysql.connection.commit()
    return redirect(url_for('blog'))


if __name__ == '__main__':
    app.run(debug=True)