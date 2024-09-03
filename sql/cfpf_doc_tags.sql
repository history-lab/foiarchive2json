create or replace view declassification_cables.doc_tags as
select doc_id, array_agg(tag) as tags, array_agg(title) as tag_titles
   from declassification_cables.tags t join declassification_cables.tag_doc td on t.id = td.tag_id
   group by doc_id;
comment on view declassification_cables.doc_tags is 'Tags and tag_titles associated with each doc. One row per doc.';