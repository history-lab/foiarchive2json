import json
import psycopg2
import aiosql

def convert_to_json(list_of_tuples):
    # Convert the list of tuples to a list of dictionaries
    list_of_dicts = [dict(tuple_element) for tuple_element in list_of_tuples]

    # Convert the list of dictionaries to JSON
    json_data = json.dumps(list_of_dicts, indent=2)

    return json_data

conn = psycopg2.connect("")
stmts = aiosql.from_path("foiarchive.sql", "psycopg2")
docs = stmts.get_docs(conn)
docs_as_dicts = []
for d in docs:
    docs_as_dicts.append(dict(doc_id=d[0], corpus=d[1], classification=d[2], 
                              authored=d[3], title=d[4], body=d[5], source=d[6]))
with open('foiarchive.json', 'w') as j:
    j.write(json.dumps(docs_as_dicts, indent=4, default=str))

# print(dict(ldocs[0]))
# json_result = convert_to_json(ldocs)
#print(json_result)