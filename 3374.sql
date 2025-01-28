#3374. First Letter Capitalization II

WITH SplitWords AS (
    SELECT
        content_id,
        content_text,
        REGEXP_SPLIT_TO_TABLE(content_text, ' ') AS word
    FROM
        user_content
),
CapitalizedWords AS (
    SELECT
        content_id,
        content_text,
        word,
        CASE
            WHEN word LIKE '%-%' THEN
                INITCAP(SPLIT_PART(word, '-', 1)) || '-' || INITCAP(SPLIT_PART(word, '-', 2))
            ELSE
                INITCAP(word)
        END AS capitalized_word
    FROM
        SplitWords
),
ReconstructedText AS (
    SELECT
        content_id,
        content_text,
        STRING_AGG(capitalized_word, ' ' ORDER BY ordinality) AS converted_text
    FROM
        CapitalizedWords
    GROUP BY
        content_id, content_text
)
SELECT
    content_id,
    content_text AS original_text,
    converted_text
FROM
    ReconstructedText
ORDER BY
    content_id;

