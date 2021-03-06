# IPL-DBMS
This project is done as an assignment for the UE19CS301 Database Management System course at PES University. It is done using a part of the IPL database. Functions such as add player, remove player, add match stats, display matches, display bastmen' stats, display bowlers' stats, place bid, resolve bid have been implemented. The project is done using `Flask` and `Postgresql`. 

## Team members:
1. [Vignesh Laxman ](https://github.com/vignesh-laxman-vb)

2. [Vinay P ](https://github.com/Vinaypnaidu)

3. [Vinay V ](https://github.com/vinayv1102)

### Installing dependencies
Installing Flask and Sqlalchemy -
```bash
$ pip3 install flask
$ pip3 install sqlalchemy
```
Installing Postgresql - 
```bash
$ brew install postgresql
```

### Running the project
Creating and populating the database - 
```bash 
$ psql postgres
\i IPL_Create.sql
\c IPL
\i IPL_Insert_Full.sql
```
Running the Flask app -
```bash
$ export APP_SETTINGS='config.DevelopmentConfig'
$ export DATABASE_URL='postgresql://localhost/IPL'
$ export FLASK_DEBUG=True
$ flask run
```

The login functionality and validation while inserting match stats are yet to be implemented. The navbar and css are borrowed from the official IPL website, videos and highlights etc are also linked to the official IPL website.
