/* DDL */

USE userdb;

CREATE TABLE board (
	num int not null auto_increment,
	id varchar(10) not null,
	name varchar(10) not null,
	title varchar(50) not null,
	content text not null,
	postdate varchar(30),
	hit int,
	ip varchar(20),
	PRIMARY KEY(num)
) default CHARSET=utf8;

desc board;

CREATE TABLE member (
	id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    login_password VARCHAR(100),
    email VARCHAR(100),
    regdate varchar(30)
) default CHARSET=utf8;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT, /* 학번 */
    name VARCHAR(255) NOT NULL, /* 학생 이름 */
    login_id VARCHAR(255) UNIQUE NOT NULL, /* 학생 로그인 아이디 */
    login_password VARCHAR(255) NOT NULL, /* 학생 로그인 패스워드 */
    student_number INT NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(255),
    birth_date DATE,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE Professors (
	professor_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	login_id VARCHAR(255) UNIQUE NOT NULL, /* 교수 로그인 아이디 */
    login_password VARCHAR(255) NOT NULL, /* 교수 로그인 패스워드 */
    professor_number INT UNIQUE NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(255),
    birth_date DATE,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(255) NOT NULL,
    subject_credit INT NOT NULL,
    subject_code VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Student_subjects (
    student_subject_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);

CREATE TABLE Professor_subjects (
    professor_subject_id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT,
    subject_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);

CREATE TABLE SubjectVideos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT,
    video_path VARCHAR(255) NOT NULL,
    video_title VARCHAR(255),
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);

/* 출석 관리용 테이블 */
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    video_id INT,
    watched BOOLEAN DEFAULT FALSE,
    watched_date TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES SubjectVideos(video_id) ON DELETE CASCADE
);

CREATE TABLE comment(
	boardID int,
	commentID int,
	num int,
	login_id varchar(50),
	commentdate varchar(30),
	commenttxt varchar(255)
);