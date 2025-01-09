-- name: get_docs
select doc_id, classification, authored, title, body, source, 
       pg_cnt, char_cnt, word_cnt
from foiarchive.docs d
where corpus in ('frus', 'cia', 'briefing', 'cfpf', 'kissinger', 'nato', 
                 'un', 'worldbank') and
      (authored is null or authored > '1954-01-01') and
      full_text @@ to_tsquery('english', 
        'fobs | fractional | partial <-> orbit | ss-x-6 | ss-x-10 | ss-10 | ' ||
        'r-36O | ogch | scrag | gr-1 | bomb <2> orbit | warhead <2> orbit | ' ||
        'warhead <2> outer |  orbit <-> bombardment | orbiting <-> weapons | ' ||
        'orbital <-> bomb | obs | mobs | asat | anti-satellite | kkv | pbw | ' ||
        'dew | destruction <2> space | destruction <2> outer | ' || 
        'destruction <2> orbit | wmd <2> space | wmd <2> orbit | ' ||
        'wmd <2> outer | orbit <-> weapons | orbital <-> weapons | ' ||
        'orbit <-> weapon | orbit <2> weapon | particle <-> beam | ' ||
        'directed <-> energy | laser | kinetic <-> kill | kill <-> vehicle | ' ||
        'space  <-> treaty | ost | brilliant <-> pebbles | ' ||
        'agreed <-> statement | orbit <-> nuclear | kinetic <-> orbital | ' || 
        'kinetic <-> bombardment | project <-> thor');