-- name: get_docs
select doc_id, corpus, classification, authored, title, body, source
    from foiarchive.docs
    where authored = '1976-01-01';

