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
    c.execute("SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1")
    l_name  = c.fetchone()[0]
    conn.close()
    
    return ' '.join([f_name, l_name])

if __name__ == '__main__':
    import random
    gender = random.sample(['M', 'F'], 1)[0]
    namer = get_name(gender)
    print(namer)

