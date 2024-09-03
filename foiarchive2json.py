import json
import psycopg2
import aiosql
import argparse

conn = psycopg2.connect("")
# Create a cursor
cur = conn.cursor()
cur.execute("SET statement_timeout = 0;")
stmts = aiosql.from_path("sql/cia-foiarchive.sql", "psycopg2")
docs = stmts.get_docs(conn)
docs_as_dicts = []
for d in docs:
    docs_as_dicts.append(dict(
        doc_id=d[0], classification=d[1], authored=d[2], 
        title=d[3], body=d[4], source=d[5],
        pg_cnt=d[6], char_cnt=d[7], word_cnt=d[8]))
with open('cia-foiarchive.json', 'w') as j:
    j.write(json.dumps(docs_as_dicts, indent=4, default=str))
