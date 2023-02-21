--2
SELECT sec_id, semester, year, course_id 
FROM(
  SELECT MAX(count)
  FROM(
    SELECT COUNT(id), sec_id, semester, year, course_id
    FROM takes
    GROUP BY sec_id, semester, year, course_id) AS count_sec
    WHERE count != 0) as max_num
  INNER JOIN(
    SELECT COUNT(id), sec_id, semester, year, course_id
    FROM takes
    GROUP BY sec_id, semester, year, course_id) AS count_sec
  ON count_sec.count = max_num.max
