#3374. First Letter Capitalization II

WITH RECURSIVE SplitWords AS (
    SELECT
        content_id,
        content_text,
        TRIM(SUBSTRING_INDEX(content_text, ' ', 1)) AS word,
        TRIM(SUBSTRING(content_text, LENGTH(SUBSTRING_INDEX(content_text, ' ', 1)) + 2)) AS remaining_text,
        1 AS word_order
    FROM
        user_content
    UNION ALL
    SELECT
        content_id,
        content_text,
        TRIM(SUBSTRING_INDEX(remaining_text, ' ', 1)) AS word,
        TRIM(SUBSTRING(remaining_text, LENGTH(SUBSTRING_INDEX(remaining_text, ' ', 1)) + 2)) AS remaining_text,
        word_order + 1
    FROM
        SplitWords
    WHERE
        remaining_text != ''
),
CapitalizedWords AS (
    SELECT
        content_id,
        content_text,
        word,
        word_order,
        CASE
            WHEN word LIKE '%-%' THEN
                CONCAT(
                    CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(word, '-', 1), 1, 1)), LOWER(SUBSTRING(SUBSTRING_INDEX(word, '-', 1), 2))),
                    '-',
                    CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(word, '-', -1), 1, 1)), LOWER(SUBSTRING(SUBSTRING_INDEX(word, '-', -1), 2)))
                )
            ELSE
                CONCAT(UPPER(SUBSTRING(word, 1, 1)), LOWER(SUBSTRING(word, 2)))
        END AS capitalized_word
    FROM
        SplitWords
),
ReconstructedText AS (
    SELECT
        content_id,
        content_text,
        GROUP_CONCAT(capitalized_word ORDER BY word_order SEPARATOR ' ') AS converted_text
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
