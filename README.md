# **웹서버 컴퓨팅 기말 프로젝트👩🏻‍💻📚**
웹서버(Back-end) 개발을 위해서 자반 기반의 웹서버 개발 프로그램 JSP를 이용한 웹서버 구축 팀 프로젝트입니다.



## **🌟 프로젝트 소개**
온라인으로 강의를 듣거나 관리할 수 있는 교육 플랫폼을 주제로 선정하여 학생, 교수의 역할에 따라 다른 기능을 사용할 수 있도록 하였습니다.



## **❣️ 결과 화면**
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 03" src="https://github.com/user-attachments/assets/c4201b98-27f8-49c0-8bc3-961f3498f585" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 10" src="https://github.com/user-attachments/assets/ea2ff3a9-8b8c-45f2-93ad-865104a4af9b" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 17" src="https://github.com/user-attachments/assets/ccba667b-495d-4394-a727-b511c53435fc" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 23" src="https://github.com/user-attachments/assets/9c4bcc84-0c94-47f6-b835-813ee3db83ca" /><img width="1470" alt="스크린샷 2025-03-31 오전 2 30 30" src="https://github.com/user-attachments/assets/732f53e8-ad58-4e20-8c31-bd5bccc8aa59" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 36" src="https://github.com/user-attachments/assets/f06e1d7a-3f08-4a43-9148-bed9e43401ef" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 45" src="https://github.com/user-attachments/assets/289706f0-d229-4f56-8e61-f8db12307e06" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 51" src="https://github.com/user-attachments/assets/254c5c3f-5dd2-421c-9d23-70f2bc7cb671" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 30 57" src="https://github.com/user-attachments/assets/99a655a1-c4de-4804-b304-c2671eb261e0" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 04" src="https://github.com/user-attachments/assets/1dbaeeb2-588b-402a-a516-6bba9ace4ba1" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 11" src="https://github.com/user-attachments/assets/62d5c1f8-621f-4efa-8dfb-8db26e33ec8d" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 19" src="https://github.com/user-attachments/assets/32f1b29f-def7-47c8-a91a-a187bc88a76c" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 26" src="https://github.com/user-attachments/assets/ba5f19ff-a196-4862-b0c7-92fdd73329ec" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 32" src="https://github.com/user-attachments/assets/3c1748f8-6dab-4d99-85e6-7091aeba413a" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 39" src="https://github.com/user-attachments/assets/54a59507-1940-4c16-a590-66d37fa7aead" />
<img width="1470" alt="스크린샷 2025-03-31 오전 2 31 45" src="https://github.com/user-attachments/assets/d637b634-1e2d-45e9-ae74-af8d824889c4" />






## **📌 주요 기능**
✅ 영상 기반 강의 시스템 구현
   - 교수 권한으로 영상 업로드 / 삭제 기능 구현
     - UUID + 과목코드 기반으로 서버 내 영상 저장 및 경로 관리
   - 학생은 업로드 된 영상 시청 가능
   - JavaScript의 video ended 이벤트를 이용해 수강 완료 기록 전송 -> 출결 처리 완료 <br>
💡 실시간 재생 완료 여부를 프론트엔드 이벤트 + 백엔드 request로 처리

<br>

✅ 출결 관리 시스템
   - 학생은 자신의 영상 수강 여부를 확인할 수 있음 / 교수는 드롭다운으로 과목 선택 후 학생별 수강 완료 여부 확인
   - 모든 영상 시청 시 출석 인정 로직 처리 <br>
💡 출결 로직도 프론트와 백엔드가 분리되어 있고 MVC 패턴 기반으로 구성

<br>

✅ MVC 기반 게시판 구현
   - 자유게시판 형태로 글 작성/ 조회/ 수정/ 삭제 기능 지원
   - 작성자만 수정 및 삭제 가능하도록 세션 기반 인증 로직 구현
   - 게시판 페이징 처리, 검색 기능 포함

<br>

✅ 교수/학생 권한 분리된 과목 관리
   - 교수는 과목 생성 가능
     - 과목코드 중복 체크 및 예외 처리 포함 (SQL Unique Key)
   - 학생은 수강신청처럼 과목을 선택해 수강 가능

<br>

✅ 회원정보 수정 및 탈퇴 기능
   - 이름과 학번 제외한 나머지 정보(비밀번호, 이메일 등) 수정 가능
   - 탈퇴 시 확인창 후 서버로 request 처리

<br>

✅ RESTful 경로 설계 및 구조
   - JSP + 서블릿 구조 기반의 MVC 패턴 적용


## **🛠️ 기술 스택**
- Frontend: HTML, CSS (Bootstrap), JS
- Backend: JSP, Servlet, JDBC
- DB: MySQL
- 패턴: MVC, 유효성 검증 (JavaScript), UUID 기반 파일명 관리


## **⏳ 개발 기간**
2024.05.17 ~ 2024.06.14 (29일)
