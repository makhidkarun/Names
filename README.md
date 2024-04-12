Names
=====

SQLite commands and files to populate the database. Have the SQL files in the same directory, and just run:

```
    sqlite3 names.db < create_names_db.sql
```

It will remove existing tables, recreate them, and then populate them
with data from the other sql files. 

Currently only has Human names. 

## All

  - Requires SQLite

### Go

  - Go is a compiled language.
  - Have not sifted this yet.

### Perl

  - Requires the DBI module.    
  - Should be CLI executable, mode 750 or so.

### PHP

  - Requires PDO


### Python

  - Should be CLI executable, mode 750 or so.

### Ruby

  - Using a class, mostly because I'm learning OOP. 

### Rust
    
  - Rust is a compiled language, and you're much better off using Cargo to compile Rust projects.
  - The code in getName.rs should be copied to your projects main.rs file.


