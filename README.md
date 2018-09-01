Names
=====

SQLite commands and files to populate the database.

Have the SQL files in the same directory, and just run:

 sqlite3 names.db < create_names_db.sql

It will remove existing tables, recreate them, and then populate them
with data from the other sql files. 

Currently only has Humaniti names. 

## All
	- Requires SQLite

### Go

	- Go is a compiled language.
	- Have not sifted this yet.

### PHP

  - Requires PDO
	#### Usage:
	```
    php getName.php
	```

### Ruby

  - Using a class, mostly because I'm learning OOP. 
	#### Usage:
	```
    ruby getName.rb
	```
