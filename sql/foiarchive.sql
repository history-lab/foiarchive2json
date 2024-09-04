-- name: get_docs
select doc_id, classification, authored, title, body, source,
        pg_cnt, char_cnt, word_cnt
from foiarchive.docs d
order by d.doc_id;