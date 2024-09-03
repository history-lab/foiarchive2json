 COPY (
    SELECT row_to_json(t)
    FROM (
        select doc_nbr, auto_decaption, reference, capture_date, channel, concepts, 
                control_nbr, copy, date, decaption_date, decaption_note, disp_action,
                disp_approved_on_date, disp_case, disp_comment, disp_date, disp_event,
                disp_history, disp_reason, disp_remarks, doc_source, drafter, 
                enclosure, eo, errors, expiration, film, handling, isecure, legacy_key,
                line_count, litigationhistory, locator, messageid, office, origclass, 
                orighand, origpclass, origphand, page_count, pchannel, pclass, 
                phandling, retention, review_action, review_content_flags, review_date,
                review_event, review_exemptions, review_media_id, review_release_date,
                review_release_event, review_transfer_date, review_withdrawn_fields,
                review_markings, sasid, secure, status, subject, to_field, vdkvgwkey, 
                markings, body, raw_body, nara_markings, type, format, from_field,
                class, id, cable_type, source_path, body_markup, collection, title,
                pdf, classification, composite_index, is_historic, frus_match,
                tags, tag_titles
        from declassification_cables.docs d 
                left join declassification_cables.doc_tags dt on d.id = dt.doc_id
        order by d.id) t
) TO '/Users/benjaminlis/history-lab/foiarchive2json/json/cfpf-full.json'