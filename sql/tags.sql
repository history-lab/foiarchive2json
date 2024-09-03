
COPY (
    SELECT row_to_json(t)
    FROM (
        SELECT *
        FROM declassification_cables.tags
    ) t
) TO '/Users/benjaminlis/history-lab/foiarchive2json/json/tags.json'