 COPY (
    SELECT row_to_json(t)
    FROM (
        select doc_id, classification, authored, title, body, source,
               pg_cnt, char_cnt, word_cnt
        from foiarchive.docs d
        where corpus = 'cia' and doc_id = 'CIA-RDP00-01351R000200150002-4'
        order by d.doc_id
        limit 10) t
) TO '/Users/benjaminlis/history-lab/foiarchive2json/json/cia-full.json'