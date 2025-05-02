--Top Performing Students by Grade
SELECT 
    s.student_id,
    p.first_name || ' ' || p.last_name AS student_name,
    s.grade_level,
    cs.grade
FROM 
    classroom_students cs
JOIN students s ON cs.student_id = s.student_id
JOIN people p ON s.person_id = p.person_id
ORDER BY cs.grade DESC
FETCH FIRST 10 ROWS ONLY;


--Average Grade by School
SELECT 
    sc.school_name,
    ROUND(AVG(cs.grade), 2) AS average_grade
FROM 
    classroom_students cs
JOIN students s ON cs.student_id = s.student_id
JOIN people p ON s.person_id = p.person_id
JOIN schools sc ON p.school_id = sc.school_id
GROUP BY sc.school_name;


--Most Common Grade Level
SELECT 
    grade_level,
    COUNT(*) AS num_students
FROM students
GROUP BY grade_level
ORDER BY num_students DESC;



--Highest Paid Principal
SELECT 
    p.first_name || ' ' || p.last_name AS principal_name,
    sc.school_name,
    pr.salary
FROM principals pr
LEFT JOIN people p ON pr.person_id = p.person_id
LEFT JOIN schools sc ON sc.principal_id = pr.principal_id
ORDER BY pr.salary DESC;





