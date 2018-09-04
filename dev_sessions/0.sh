➜  build-a-blog git:(master) source activate flask_env0
(flask_env0) ➜  build-a-blog git:(master) python
Python 3.7.0 (default, Jun 28 2018, 07:39:16)
[Clang 4.0.1 (tags/RELEASE_401/final)] :: Anaconda, Inc. on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> from main import db, Blog
/anaconda3/envs/flask_env0/lib/python3.7/site-packages/flask_sqlalchemy/__init__.py:794: FSADeprecationWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True or False to suppress this warning.
  'SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and '
>>> db.create_all()
2018-09-03 14:36:39,843 INFO sqlalchemy.engine.base.Engine SHOW VARIABLES LIKE 'sql_mode'
2018-09-03 14:36:39,844 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,850 INFO sqlalchemy.engine.base.Engine SELECT DATABASE()
2018-09-03 14:36:39,850 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,851 INFO sqlalchemy.engine.base.Engine show collation where `Charset` = 'utf8mb4' and `Collation` = 'utf8mb4_bin'
2018-09-03 14:36:39,851 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,852 INFO sqlalchemy.engine.base.Engine SELECT CAST('test plain returns' AS CHAR(60)) AS anon_1
2018-09-03 14:36:39,853 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,853 INFO sqlalchemy.engine.base.Engine SELECT CAST('test unicode returns' AS CHAR(60)) AS anon_1
2018-09-03 14:36:39,853 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,854 INFO sqlalchemy.engine.base.Engine SELECT CAST('test collated returns' AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_bin AS anon_1
2018-09-03 14:36:39,854 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,854 INFO sqlalchemy.engine.base.Engine DESCRIBE `blog`
2018-09-03 14:36:39,854 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,860 INFO sqlalchemy.engine.base.Engine ROLLBACK
2018-09-03 14:36:39,861 INFO sqlalchemy.engine.base.Engine
CREATE TABLE blog (
        id INTEGER NOT NULL AUTO_INCREMENT,
        title VARCHAR(120),
        body VARCHAR(600),
        pub_date DATETIME,
        PRIMARY KEY (id)
)


2018-09-03 14:36:39,862 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:36:39,871 INFO sqlalchemy.engine.base.Engine COMMIT
>>> db.session.commit()
>>> exit()
(flask_env0) ➜  build-a-blog git:(master) python main.py
/anaconda3/envs/flask_env0/lib/python3.7/site-packages/flask_sqlalchemy/__init__.py:794: FSADeprecationWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True or False to suppress this warning.
  'SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and '
 * Serving Flask app "main" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
/anaconda3/envs/flask_env0/lib/python3.7/site-packages/flask_sqlalchemy/__init__.py:794: FSADeprecationWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True or False to suppress this warning.
  'SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and '
 * Debugger is active!
 * Debugger PIN: 453-798-491
127.0.0.1 - - [03/Sep/2018 14:42:12] "GET / HTTP/1.1" 404 -
2018-09-03 14:42:16,927 INFO sqlalchemy.engine.base.Engine SHOW VARIABLES LIKE 'sql_mode'
2018-09-03 14:42:16,927 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,930 INFO sqlalchemy.engine.base.Engine SELECT DATABASE()
2018-09-03 14:42:16,930 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,931 INFO sqlalchemy.engine.base.Engine show collation where `Charset` = 'utf8mb4' and `Collation` = 'utf8mb4_bin'
2018-09-03 14:42:16,931 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,933 INFO sqlalchemy.engine.base.Engine SELECT CAST('test plain returns' AS CHAR(60)) AS anon_1
2018-09-03 14:42:16,933 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,933 INFO sqlalchemy.engine.base.Engine SELECT CAST('test unicode returns' AS CHAR(60)) AS anon_1
2018-09-03 14:42:16,934 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,934 INFO sqlalchemy.engine.base.Engine SELECT CAST('test collated returns' AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_bin AS anon_1
2018-09-03 14:42:16,934 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,935 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:42:16,936 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:42:16,965 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:42:16,978 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:42:16] "GET /blog HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:42:17] "GET /static/styles/blogs.css HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:42:29] "GET /newpost HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:42:55] "POST /newpost HTTP/1.1" 200 -
2018-09-03 14:43:15,792 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:43:15,795 INFO sqlalchemy.engine.base.Engine INSERT INTO blog (title, body, pub_date) VALUES (%(title)s, %(body)s, %(pub_date)s)
2018-09-03 14:43:15,795 INFO sqlalchemy.engine.base.Engine {'title': 'Hello', 'body': 'This is the first blog post.', 'pub_date': datetime.datetime(2018, 9, 3, 14, 43, 15, 791068)}
2018-09-03 14:43:15,796 INFO sqlalchemy.engine.base.Engine COMMIT
2018-09-03 14:43:15,798 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:43:15,799 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:43:15,799 INFO sqlalchemy.engine.base.Engine {'param_1': 1}
2018-09-03 14:43:15,800 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:43:15] "POST /newpost HTTP/1.1" 302 -
2018-09-03 14:43:15,809 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:43:15,810 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:43:15,848 INFO sqlalchemy.engine.base.Engine {'param_1': '1'}
2018-09-03 14:43:15,851 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:43:15,851 INFO sqlalchemy.engine.base.Engine {'param_1': '1'}
2018-09-03 14:43:15,858 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:43:15] "GET /blog?id=1 HTTP/1.1" 200 -
2018-09-03 14:43:20,995 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:43:20,995 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:43:20,995 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:43:20,997 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:43:20] "GET /blog HTTP/1.1" 200 -
2018-09-03 14:44:05,462 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:44:05,463 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:44:05,463 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:44:05,464 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:44:05] "GET /blog HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:44:05] "GET /static/styles/blogs.css HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:44:05] "GET /favicon.ico HTTP/1.1" 404 -
2018-09-03 14:45:03,448 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:45:03,449 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:45:03,449 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:45:03,451 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:45:03] "GET /blog HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:45:03] "GET /static/styles/blogs.css HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:45:03] "GET /favicon.ico HTTP/1.1" 404 -
127.0.0.1 - - [03/Sep/2018 14:45:12] "GET /newpost HTTP/1.1" 200 -
2018-09-03 14:45:59,858 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:45:59,859 INFO sqlalchemy.engine.base.Engine INSERT INTO blog (title, body, pub_date) VALUES (%(title)s, %(body)s, %(pub_date)s)
2018-09-03 14:45:59,859 INFO sqlalchemy.engine.base.Engine {'title': 'Blog posting is fun!', 'body': 'This web app is so cool !!', 'pub_date': datetime.datetime(2018, 9, 3, 14, 45, 59, 856768)}
2018-09-03 14:45:59,860 INFO sqlalchemy.engine.base.Engine COMMIT
2018-09-03 14:45:59,862 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:45:59,863 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:45:59,863 INFO sqlalchemy.engine.base.Engine {'param_1': 2}
2018-09-03 14:45:59,866 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:45:59] "POST /newpost HTTP/1.1" 302 -
2018-09-03 14:45:59,874 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:45:59,874 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:45:59,874 INFO sqlalchemy.engine.base.Engine {'param_1': '2'}
2018-09-03 14:45:59,876 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:45:59,876 INFO sqlalchemy.engine.base.Engine {'param_1': '2'}
2018-09-03 14:45:59,920 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:45:59] "GET /blog?id=2 HTTP/1.1" 200 -
2018-09-03 14:46:03,576 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:46:03,577 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:46:03,577 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:46:03,579 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:46:03] "GET /blog HTTP/1.1" 200 -
2018-09-03 14:46:08,328 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:46:08,328 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:46:08,328 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:46:08,330 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:46:08] "GET /blog HTTP/1.1" 200 -
2018-09-03 14:46:59,389 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:46:59,389 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:46:59,390 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:46:59,392 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:46:59] "GET /blog HTTP/1.1" 200 -
2018-09-03 14:47:17,242 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:47:17,242 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:47:17,242 INFO sqlalchemy.engine.base.Engine {'param_1': '2'}
2018-09-03 14:47:17,244 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog
WHERE blog.id = %(param_1)s
2018-09-03 14:47:17,244 INFO sqlalchemy.engine.base.Engine {'param_1': '2'}
2018-09-03 14:47:17,246 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:47:17] "GET /blog?id=2 HTTP/1.1" 200 -
2018-09-03 14:47:21,084 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:47:21,084 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:47:21,085 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:47:21,087 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:47:21] "GET /blog HTTP/1.1" 200 -
2018-09-03 14:48:08,581 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:48:08,581 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:48:08,581 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:48:08,583 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:48:08] "GET /blog HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:48:11] "GET /newpost HTTP/1.1" 200 -
127.0.0.1 - - [03/Sep/2018 14:48:15] "POST /newpost HTTP/1.1" 200 -
2018-09-03 14:48:40,836 INFO sqlalchemy.engine.base.Engine BEGIN (implicit)
2018-09-03 14:48:40,837 INFO sqlalchemy.engine.base.Engine SELECT blog.id AS blog_id, blog.title AS blog_title, blog.body AS blog_body, blog.pub_date AS blog_pub_date
FROM blog ORDER BY blog.pub_date DESC
2018-09-03 14:48:40,837 INFO sqlalchemy.engine.base.Engine {}
2018-09-03 14:48:40,839 INFO sqlalchemy.engine.base.Engine ROLLBACK
127.0.0.1 - - [03/Sep/2018 14:48:40] "GET /blog HTTP/1.1" 200 -