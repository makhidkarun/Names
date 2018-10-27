#!/usr/bin/env python

def get_name(gender):
  import sqlite3
  f_name = ""
  l_name = ""
  conn    = sqlite3.connect('data/names.db')
  c       = conn.cursor()
  if gender == 'F':
    c.execute("SELECT * from humaniti_female_first ORDER BY RANDOM() LIMIT 1")
  else:
    c.execute("SELECT * from humaniti_male_first ORDER BY RANDOM() LIMIT 1")
  f_name  = c.fetchone()[0]

  conn    = sqlite3.connect('data/names.db')
  c       = conn.cursor()
  c.execute("SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1")
  l_name  = c.fetchone()[0]
  conn.close()
  
  name = ' '.join([f_name, l_name]).encode("utf-8")
  return name

namer = get_name('F')
print(namer)

