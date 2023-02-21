--6
SELECT course_id, sec_id, count(ID) as enrollment
FROM section NATURAL JOIN takes
WHERE semester = 'Fall' AND year = 2022
GROUP BY course_id, sec_id
