![header](https://capsule-render.vercel.app/api?type=Cylinder&color=003580&text=Booqueen.com&height=180&fontSize=50&fontColor=fff)
## ✨ Booqueen.com
- 호텔 등 숙박시설에 대한 온라인 예약을 다루는 웹사이트 <span color="#004679">booking</span><span color="#00A0D6">.com</span> 을 벤치마킹 하여 프로젝트 제작
- 프로젝트 기간 : 2022. 03. 02 ~ 2022. 04. 08
- 프로젝트 인원 : 5명
- 사이트 요약<br>
  ✔ 사용자(user) : 호텔을 보다 편리하게 검색/예약할 수 있는 서비스 제공<br>
  ✔ 호텔 관리자(partner) : 호텔 정책/객실/매출 관리 등을 통한 호텔 관리 서비스 제공<br>
  ✔ 사이트 관리자(admin) : 통계/대금지급 등을 비롯한 매출과 사이트 전반에 대한 관리 서비스 제공

![image](https://user-images.githubusercontent.com/97867506/165015588-eae1828c-4f46-479a-acb0-806b9ef7e138.png)
<br><br>
<div align="center">🛠<b> Tech Stack </b>🛠</div><br>
<div align="center">
  <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white"/>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"/>
  <img src="https://img.shields.io/badge/JSON-000000?style=flat&logo=JSON&logoColor=white"/><br>
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/>
  <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat&logo=Eclipse IDE&logoColor=white"/>
  <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat&logo=Apache Tomcat&logoColor=black"/>
  <img src="https://img.shields.io/badge/Amazon S3-569A31?style=flat&logo=Amazon S3&logoColor=white"/>
  <img src="https://img.shields.io/badge/Amazon AWS-232F3E?style=flat&logo=Amazon AWS&logoColor=white"/><br>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=PostgreSQL&logoColor=white"/>
  <img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=Git&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/>
</div><br>

# 1. 개발 동기
팀원들과 프로젝트 주제를 고민하던 중, 날짜/필터/지도 등 다양한 기능을 구현해야 하는 것이 흥미로워 예약 사이트 구현에 도전하게 되었습니다.
<br><br>

# 2. 개발 환경
| 분류 | 개발 환경 |
| :------------: | :-------------: |
| 운영체제 | Windows 10 64bit |
| 개발 언어 | Java, SQL, HTML, Javascript, CSS, JQuery, Ajax, XML, JSON |
| 개발 도구 | Eclipse, PgAdmin, PUTTY, Maven, Java ORM Plugin |
| 프레임 워크 | Spring Framework 5.3.4, MyBatis, Bootstrap |
| 데이터베이스 | PostgreSQL 12.9 |
| WAS | Apache Tomcat 9.0 |
| 웹 브라우저 | Chrome |
| 버전관리 시스템 | Git, Github |
| 라이브러리 | JSTL, lombok, aspectj, servlet-api, spring-security-web, jackson, poi, amazonaws, commons-fileupload |
| 오픈소스 | Kakao Map API, Kakao Login API, IamPort API |

<br><br>

# 3. 기능 소개

### 💛 사용자(user) 기능

- 회원가입, 로그인, 카카오 로그인, 회원정보 수정, 로그아웃
- 메인 페이지에서 여행지 및 날짜 선택해 호텔 검색
- 검색 결과 페이지(호텔 목록)에서 필터 선택을 통한 상세 검색
- 리뷰/요금/평점 순으로 호텔 목록 정렬
- 카카오 맵 API 활용으로 예약 가능한 호텔 목록과 관광명소 지도에서 확인
- 지도에서 중심좌표 이동 시 호텔 목록이 중심좌표 근처의 호텔 리스트로 변경
- 호텔 상세페이지에서 날짜 재검색, 호텔 위치/시설/정책/리뷰/문의/객실 사진/관광지와의 거리 확인, 위시리스트 추가/제거
- 호텔 상세페이지에서 예약 가능한 방이 없을 경우 예약 가능한 날짜와 가격정보를 제공
- 아임포트 API 활용으로 호텔 예약/결제 및 확인서 출력
- 예약한 사람의 경우 호텔 관리자와 1:1 채팅
- 호텔 이용 완료 후 리뷰 등록
- 이용하지 않은 호텔 예약 취소 및 확인서 출력
- 회원탈퇴(아직 이용하지 않은 예약된 호텔이 있을 경우 회원탈퇴 불가능)

### 💚 호텔 관리자(partner)

- 회원가입, 호텔 등록, 비밀번호 변경, 로그아웃
- 신규 객실 추가, 객실 현황 캘린더로 보기, 예약 가능 객실 등록, 일별 객실 상태 변경
- 전체 예약 목록, 예약정보 검색, 예약 상세페이지, 이용후기
- 예약 상태 업데이트(이용전/체크인/이용완료/사이트 관리자에 대금지급요청)
- 불법/부정 투숙객 신고
- 호텔 사진 및 정책 관리, 객실 관리
- 호텔 문의, 예약자와 1:1 채팅
- 청구목록 Excel로 다운로드
- 당월 매출액 & 일일 평균 요금 분석 & 월별 분석 차트 정보 확인

### 💙 사이트 관리자(admin)

- 로그인, 로그아웃
- 회원/파트너/호텔 목록 및 상세보기
- 신고 회원 관리
- 파트너 계정 차단 관리
- 사이트 문의게시판, 추천 여행지(배너), 이용약관 관리
- 예약현황 조회, 거래내역 조회
- 대금지급 관리

---
