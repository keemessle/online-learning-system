/* insert users DML*/
INSERT INTO Students(name, id, password, student_number, email, phone_number, birth_date, role) 
VALUES('홍길동', 'student1', 'spass1', 2000100100, 'student1@example.com', '01012345678', '2000-01-01', 'Student');
INSERT INTO Students(name, id, password, student_number, email, phone_number, birth_date, role) 
VALUES('이순신', 'student2', 'spass2', 2000200100, 'student2@example.com', '01023456789', '2001-01-01', 'Student');
INSERT INTO Students(name, id, password, student_number, email, phone_number, birth_date, role) 
VALUES('장발장', 'student3', 'spass3', 2000300100, 'student3@example.com', '01034567890', '2002-01-01', 'Student');
INSERT INTO Students(name, id, password, student_number, email, phone_number, birth_date, role) 
VALUES('조정래', 'student4', 'spass4', 2000400100, 'student4@example.com', '01045678901', '2003-01-01', 'Student');
INSERT INTO Students(name, id, password, student_number, email, phone_number, birth_date, role) 
VALUES('홍길순', 'student5', 'spass5', 2000500100, 'student5@example.com', '01056789012', '2004-01-01', 'Student');

INSERT INTO Professors(name, id, password, professor_number, email, phone_number, birth_date, role) 
VALUES('김햇살', 'professor1', 'ppass1', 1985100100, 'professor1@example.com', '01067890123', '1960-01-01', 'Professor');
INSERT INTO Professors(name, id, password, professor_number, email, phone_number, birth_date, role) 
VALUES('이바람', 'professor2', 'ppass2', 1986200100, 'professor2@example.com', '01078901234', '1961-01-01', 'Professor');
INSERT INTO Professors(name, id, password, professor_number, email, phone_number, birth_date, role) 
VALUES('박구름', 'professor3', 'ppass3', 1983300100, 'professor3@example.com', '01089012345', '1962-01-01', 'Professor');
INSERT INTO Professors(name, id, password, professor_number, email, phone_number, birth_date, role) 
VALUES('최태풍', 'professor4', 'ppass4', 1982400100, 'professor4@example.com', '01090123456', '1963-01-01', 'Professor');
INSERT INTO Professors(name, id, password, professor_number, email, phone_number, birth_date, role) 
VALUES('정푸른', 'professor5', 'ppass5', 1987500100, 'professor5@example.com', '01011223344', '1964-01-01', 'Professor');


desc Students;
select * from Students;

desc Professors;
select * from Professors;

/* insert subject */
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('데이터베이스', 3, 'CS301');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('C# 프로그래밍', 3, 'CS302');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('JAVA 프로그래밍', 3, 'CS303');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('어플리케이션 개발 중급', 3, 'CS304');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('자료구조', 3, 'CS305');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('알고리즘', 3, 'CS306');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('소프트웨어의 이해', 3, 'CS307');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('자바스크립트 고급', 3, 'CS308');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('문학과 예술', 2, 'ABC101');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('인간의 역사', 2, 'ABC102');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('언어와 표현', 2, 'ABC103');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('가치와 윤리', 2, 'ABC104');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('국가와 사회', 2, 'ABC105');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('논리와 수리', 2, 'ABC106');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('지역과 세계', 2, 'ABC107');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('자연과 우주', 2, 'ABC108');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('World English1', 2, 'DEF101');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('World English2', 2, 'DEF102');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('Global English1', 2, 'DEF103');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('Global English2', 2, 'DEF104');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('World issues: English through the media', 2, 'DEF105');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('Research and presentation in english', 2, 'DEF106');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('Toeic1', 2, 'DEF107');
INSERT INTO Subjects(subject_name, subject_credit, subject_code) VALUES('Toeic2', 2, 'DEF108');

desc Subjects;
select * from Subjects;

/* insert student_subjects */
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 3);
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 6);
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 8);
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 13);
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 19);
INSERT INTO student_subjects(student_id, subject_id) VALUES(1, 23);
INSERT INTO student_subjects(student_id, subject_id) VALUES(2, 5);
INSERT INTO student_subjects(student_id, subject_id) VALUES(2, 7);
INSERT INTO student_subjects(student_id, subject_id) VALUES(2, 9);
INSERT INTO student_subjects(student_id, subject_id) VALUES(2, 13);
INSERT INTO student_subjects(student_id, subject_id) VALUES(2, 18);
INSERT INTO student_subjects(student_id, subject_id) VALUES(3, 2);
INSERT INTO student_subjects(student_id, subject_id) VALUES(3, 5);
INSERT INTO student_subjects(student_id, subject_id) VALUES(3, 10);
INSERT INTO student_subjects(student_id, subject_id) VALUES(3, 14);
INSERT INTO student_subjects(student_id, subject_id) VALUES(3, 17);
INSERT INTO student_subjects(student_id, subject_id) VALUES(4, 4);
INSERT INTO student_subjects(student_id, subject_id) VALUES(4, 8);
INSERT INTO student_subjects(student_id, subject_id) VALUES(4, 13);
INSERT INTO student_subjects(student_id, subject_id) VALUES(4, 20);
INSERT INTO student_subjects(student_id, subject_id) VALUES(4, 24);
INSERT INTO student_subjects(student_id, subject_id) VALUES(5, 1);
INSERT INTO student_subjects(student_id, subject_id) VALUES(5, 7);
INSERT INTO student_subjects(student_id, subject_id) VALUES(5, 16);
INSERT INTO student_subjects(student_id, subject_id) VALUES(5, 22);
INSERT INTO student_subjects(student_id, subject_id) VALUES(5, 23);


desc student_subjects;
select * from student_subjects;


/* professor_subjects */
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(1, 1);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(1, 2);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(2, 5);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(2, 4);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(3, 7);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(3, 8);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(3, 3);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(3, 6);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 13);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 14);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 15);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 17);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 18);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(4, 19);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(5, 21);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(5, 22);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(5, 23);
INSERT INTO professor_subjects(professor_id, subject_id) VALUES(5, 24);

desc professor_subjects;
select * from professor_subjects;


/* SubjectVideos 경로문제때문에 직접 insert하지 않음 -> 교수로 로그인 후 강의 -> 직접 강의 추가 */