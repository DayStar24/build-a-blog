from flask import Flask, request, redirect, render_template, session, flash
from flask_sqlalchemy import SQLAlchemy
import datetime


app = Flask(__name__)
app.config['DEBUG'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://build-a-blog:abc123@localhost:3306/build-a-blog'
app.config['SQLALCHEMY_ECHO'] = True
db = SQLAlchemy(app)
app.secret_key = 'ghia4e8t948tbh4t7b4b58745t'


class Blog(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(120))
    body = db.Column(db.String(600))
    pub_date = db.Column(db.DateTime)

    def __init__(self, title, body, pub_date):

        self.title = title
        self.body = body
        self.pub_date = pub_date


@app.route('/blog', methods=['GET'])
def blogs():

    template = ''
    
    #blogs = db.session.query(Blog).order_by(Blog.pub_date.desc())
    #blog = request.args.get('id')

    if request.args.get('id'):
        template = render_template (
            'blog.html', 
            h1_text = Blog.query.get(request.args.get('id')).title, 
            p_text = Blog.query.get(request.args.get('id')).body
        )
    else:
        template = render_template(
            'blogs.html', 
            h1_text = 'Build a Blog', 
            blogs = db.session.query(Blog).order_by(Blog.pub_date.desc())
        )

    return template


@app.route('/newpost', methods=['POST','GET'])
def new_post():

    pub_date = datetime.datetime.now()

    title = ''
    body = ''
    error_title = ''
    error_body = ''
    template = ''

    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']

        if not title:
            error_title = 'Enter a blog title...'
    
        if not body:
            error_body = 'Write a blog...'

        if error_title or error_body:
            template = render_template (
                'new_post.html', 
                title = title, 
                body = body, 
                error_title = error_title, 
                error_body = error_body
            )
        else:
            blog = Blog(title, body, pub_date)
            db.session.add(blog)
            db.session.commit()
            template = redirect('/blog?id=' + str(blog.id))
    else:
        template = render_template('new_post.html')

    return template


if __name__ == '__main__':
    #app.run(host='0.0.0.0', debug=True)
    app.run()
