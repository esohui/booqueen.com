<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>mysettings</title>
	<link rel="stylesheet" href="${contextPath}/resources/user/css/mysettings.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/user/member/header.jsp"/>
	
	<div class="container">

		<!-- container-left -->
		<!-- 개인정보 -->
		<form class="container-left" action="${contextPath}/mypageUpdate.do" method="post">
			<div class="settings-top">
				<div class="settings-title">
					<div class="title">계정 관리</div>
				</div>
				<div class="settings-avatar" onclick="on()">
					<span class="avatar">
						<div class="my-avatar"></div>
						<span class="edit-icon"><i class="bi-camera"></i></span>
					</span>
				</div>
			</div>
			<div class="settings-table">
				<!-- 이름 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>이름</h2></div>
						<div class="container-element">
							<div class="element">
									<input type="text" id="name" value="${member.name }" name="name" readonly/>
							</div>
						</div>
					</div>
				</div>

				<!-- 비밀번호 변경 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>비밀번호 확인</h2></div>
						<div class="container-element">
							<div class="element">
									<input type="password" id="password" name="passwd">
							</div>
						</div>
					</div>
				</div>

				<!-- 성별 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>성별</h2></div>
						<div class="container-element">
							<div class="element element-gender">
								<c:choose>
								<c:when test="${member.gender == '남성' || member.gender == '여성'}">
									<input type="text" value="${member.gender }" name="gender" readonly/>
								</c:when>
								<c:otherwise>
									<c:if test="${member.gender == 'male'}">
										<input type="text" value="남성" name="gender" readonly/>
									</c:if>
									<c:if test="${member.gender == 'female'}">
										<input type="text" value="여성" name="gender" readonly/>
									</c:if>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>

				<!-- 생년월일 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>생년월일</h2></div>
						<div class="container-element">
							<div class="element element-birth">
								<input type="text" placeholder="YYYY" id="birth-year" maxlength="4" value="${member.birth_year }" name="birth_year">
								<input type="text" placeholder="MM" id="birth-month" maxlength="2" value="${member.birth_month }" name="birth_month">
								<input type="text" placeholder="DD" id="birth-day" maxlength="2" value="${member.birth_day }" name="birth_day">
							</div>
						</div>
					</div>
				</div>

				<!-- 전화번호 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>전화번호</h2></div>
						<div class="container-element">
							<div class="element element-phone">
								<select id="phone1" name="phone1">
		                           <option value="010" <c:if test="${member.phone1 == '010'}">selected</c:if>>010</option>
		                           <option value="011" <c:if test="${member.phone1 == '011'}">selected</c:if>>011</option>
		                           <option value="016" <c:if test="${member.phone1 == '016'}">selected</c:if>>016</option>
		                           <option value="017" <c:if test="${member.phone1 == '017'}">selected</c:if>>017</option>
		                           <option value="018" <c:if test="${member.phone1 == '018'}">selected</c:if>>018</option>
		                           <option value="019" <c:if test="${member.phone1 == '019'}">selected</c:if>>019</option>
                        		</select>
								<div class="hyphen">-</div>
								<input type="text" placeholder="0000" id="phone2" maxlength="4" value="${member.phone2 }" name="phone2">
								<div class="hyphen">-</div>
								<input type="text" placeholder="0000" id="phone3" maxlength="4" value="${member.phone3 }" name="phone3">
							</div>
						</div>
					</div>
				</div>

				<!-- 이메일 주소 -->
				<div class="settings-row">
					<div class="settings-container">
						<div class="container-label"><h2>이메일 주소</h2></div>
						<div class="container-element">
							<div class="element">
								<input type="text" value="${member.userid }" name="userid" readonly>
							</div>
						</div>
					</div>
				</div>
				<div class="modify-hr"><div></div></div>
				<div class="modify-button">
					<button type="button" class="modify-pw-btn" id="modifyPwBtn">비밀번호 변경</button>
					<button type="submit" class="modify-btn">개인정보 수정</button>
				</div>
				

				

			</div>
		</form>


		<!-- container-right -->
		<div class="container-right">
			<div class="container-right-top">
				<div class="update-explanation">
					<i class="bi-shield-lock"></i>
					<div class="update-question"><h2>수정할 수 있는 세부 정보는 무엇인가요?</h2></div>
					<div class="update-answer">booqueen.com에서 본인 인증 시 사용하는 세부 정보는 변경할 수 없습니다. 연락처 정보와 일부 개인정보는 수정할 수 있지만, 다음번 예약 또는 숙소를 등록할 때 본인 인증 절차를 거쳐야 할 수도 있습니다.</div>
				</div>
				<div class="update-hr"><div></div></div>
				<div class="update-explanation">
					<i class="bi-person-rolodex"></i>
					<div class="update-question"><h2>다른 사람에게 어떤 정보가 공개되나요?</h2></div>
					<div class="update-answer">booqueen.com은 예약이 확정된 후에만 호스트 및 게스트의 연락처 정보를 공개합니다.</div>
				</div>
			</div>
			<div class="delete-button">
				<c:if test="${hasReservation}">
					<button class="delete-btn" onclick="disabled_Btn()">회원 탈퇴</button>
				</c:if>
				<c:if test="${!hasReservation}">
					<button class="delete-btn" id="deleteBtn">회원 탈퇴</button>
				</c:if>
				
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="deleteMyAccount" class="delete-modal">

		<!-- Modal content -->
		<form class="delete-modal-content" action="deleteMember.do" method="post">
			<span class="close">&times;</span>
			<div><h2 class="modal-title">정말 탈퇴하시겠습니까?</h2></div>
			<div class="delete-hr"><div></div></div>
			<div class="modal-delete-reason">
				<div class=reason-title>회원 탈퇴 사유</div>
				<select id="delete-account" name="reason">
					<option value="">선택</option>
					<option value="delete1">사이트 사용이 불편해서</option>
					<option value="delete2">원하는 정보가 없어서</option>
					<option value="delete3">여러 계정을 보유하고 있어서</option>
					<option value="delete4">기타</option>
				</select>
			</div>
			<div class="delete-hr"><div></div></div>
			<div class="modal-delete-password">
				<div class="password-title">비밀번호 입력</div>
				<div class="input-password">
					<input type="password" placeholder="" id="deletePassword" name="passwd">
					<input type="hidden" value="${member.userid }" name="userid">
					<div>회원 탈퇴를 원하실 경우 비밀번호를 입력해 주세요.</div>
				</div>
			</div>
			<div class="delete-hr"><div></div></div>
			<div class="modal-delete-button">
				<button type="submit" class="delete-btn-real" id="deleteBtnReal">회원 탈퇴하기</button>
			</div>
		</form>
	</div>
	
	<!-- 비밀번호 수정 Modal -->
   <div id="modifyPassword" class="modify-pw-modal">

      <!-- Modal content -->
      <form class="modify-modal-content" action="${contextPath }/changePasswd.do" method="post">
         <span class="close modifyClose">&times;</span>
         <div><h2 class="modal-title">비밀번호 변경</h2></div>
         <div class="delete-hr"><div></div></div>
         <div class="modal-password">
            <div class="password-title">현재 비밀번호</div>
            <div class="input-password">
               <input type="hidden" value="${member.userid }" name="userid">
               <input type="hidden" id="name" value="${member.name }" name="name" readonly />
               <input type="hidden" value="${member.gender }" name="gender" readonly/>
               <input type="hidden" placeholder="YYYY" id="birth-year" maxlength="4" value="${member.birth_year }" name="birth_year">
               <input type="hidden" placeholder="MM" id="birth-month" maxlength="2" value="${member.birth_month }" name="birth_month">
               <input type="hidden" placeholder="DD" id="birth-day" maxlength="2" value="${member.birth_day }" name="birth_day">
               <input type="hidden" placeholder="0000" id="phone1" maxlength="3" value="${member.phone1 }" name="phone1">
               <input type="hidden" placeholder="0000" id="phone2" maxlength="4" value="${member.phone2 }" name="phone2">
               <input type="hidden" placeholder="0000" id="phone3" maxlength="4" value="${member.phone3 }" name="phone3">
               
               <input type="password" placeholder="현재 비밀번호를 입력해 주세요" name="passwd" id="old-passwd">
            </div>
         </div>
         <div class="delete-hr"><div></div></div>
         <div class="modal-password">
            <div class="password-title">새 비밀번호</div>
            <div class="input-password">
               <input type="password" placeholder="새 비밀번호를 입력해 주세요" name="newPasswd" id="new-passwd" onkeyup="passwdCheck(this)">
               <div id="new-passwdCheck"></div>
            </div>
         </div>
         <div class="modal-password">
            <div class="password-title">새 비밀번호 확인</div>
            <div class="input-password">
               <input type="password" placeholder="새 비밀번호를 다시 입력해 주세요" name="rePasswd" id="re-passwd" onkeyup="passwdCheck(this)">
               <div id="re-passwdCheck"></div>
            </div>
         </div>
         <div class="delete-hr"><div></div></div>
         <div class="modal-modify-button">
            <button type="submit" class="modify-pw-btn-real" id="modifyPwBtnReal">확인</button>
         </div>
      </form>
   </div>

	<!-- footer -->
	<div class="footer">


	</div>
	
	<div id="overlay">
		<div class="_3wdogU_BPiAO796UieqXu4">
			<div class="_2TqRTXEePkV7u2syZ0Nq9z _1X0LeewVPMTpAX22drlvZ3 _1BiqJ9_C-T-CmHOq8EfJPo AjHVSw_0X32hqyrAh3MUT">
				<div class="_3sMXBxNj_x3hbgmbkj8r2R">
					<div class="my-settings-flex-by-row">
						<div class="my-settings-avatar-block">
							<div class="Dw6-MstZiKz3coVI3dKuj _2jQGBo-dU-M17-7-nkJvPF _3pU5tM4MQzFtYInGl8UH5o _2XvExLWApLv6qJyr0CBtpT _3_WZQkZUZTGSLPBIQMP_nQ my-settings-avatar-modal-avatar _2snvxn2KX3RwldusJ44Ez6"></div>
							<img id="preview-image" src="" >
						</div>
						<div class="my-settings-avatar-controls">
							<div class="my-settings-avatar-controls__container">
								<div class="_1wW80ZAB9m6Wqrw4PPEzrT my-settings-large-margin-sides">
									<div class="_16qew0Y8jvEvovkAvEDWkH _1B97E_2FGLDQnmvbkd4Ax4">업로드할 이미지를 선택해 주세요</div>
								</div>
								<div lass="my-settings-large-margin-top my-settings-large-margin-sides bui-spacer--large">
									<form id="fileForm" method="post" enctype="multipart/form-data" action="${contextPath}/profile/upload.do">
										<div class="iux-file-upload">
											<input id="my-settings-file-upload" type="file" accept="image/*" name="file" onchange="myFunction()">
											<label for="my-settings-file-upload">
												<span class="bui-button my-settings-avatar-select bui-button--secondary">파일 선택</span>
											</label>
										</div>
									</form>
									<progress hidden="" tabindex="-1"></progress>
								</div>
								<div class="my-settings-file-name"><span id="file-name"></span></div>
							</div>
							<div class="my-settings-flex-by-row my-settings-avatar-bottom-controls">
								<div class="my-settings-flex-grow"></div>
								<button
									type="button"  id="submit-button" onclick="document.getElementById('fileForm').submit();" disabled
									class="_2emQHDWTNbBMVHK80Tj0A2 _2V1p8Jqj0mC6lhwPQD7Wm2 _3idbYJ1oAGD-sl-6gdCR2e _2hGEkEybl8yfB856UNZRrl my-settings-avatar-save">
									<span class="_1jp30RWusTBQoML9GSCZ_C">저장</span>
								</button>
							</div>
						</div>
					</div>
					<div class="_3emjUeI82v5sK9ORoPWii _36fOkOHXSmy8oq_aSJZ3fP _2z2vMbkB0u-n29UvuzaoL3 _36nb0Acmnwz7d6zO_z67nC">
						<button onclick="off()"
							aria-label="닫기"
							type="button"
							class="_2emQHDWTNbBMVHK80Tj0A2 _2V1p8Jqj0mC6lhwPQD7Wm2 _1FTTNGoNRUyslbavDhKmik _2hGEkEybl8yfB856UNZRrl _1cIr3TVDFXPBWOPm5iPASW">
							<span class="_1egDh0TNT7Uqzh_IMo60Zv">
								<span
									class="_1DYeoLTBFL3S4-b0JE_GoR _3uTqlFFf-UdhcjqE8SRhTn"
									aria-hidden="true">
									<svg viewBox="0 0 24 24">
										<path
											d="M13.31 12l6.89-6.89a.93.93 0 1 0-1.31-1.31L12 10.69 5.11 3.8A.93.93 0 0 0 3.8 5.11L10.69 12 3.8 18.89a.93.93 0 0 0 1.31 1.31L12 13.31l6.89 6.89a.93.93 0 1 0 1.31-1.31z"></path>
									</svg>
								</span>
							</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
var isEmpty = function(value){ 
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true 
	} else { 
		return false 
	}
};

function on() {
	document.getElementById("overlay").style.display = "block";
	var paragraph = document.getElementById("file-name");
	paragraph.textContent = "";
	const previewImage = document.getElementById("preview-image")
	previewImage.src = "${contextPath}/resources/user/images/default_profile.jpg";
	document.getElementById('submit-button').disabled = true;
 }

function off() {
	document.getElementById("overlay").style.display = "none";
 }
</script>

<script>
var deleteMyAccount = document.getElementById("deleteMyAccount");
var deleteBtn = document.getElementById("deleteBtn");
var deleteBtnReal = document.getElementById("deleteBtnReal");
var close = document.getElementsByClassName("close")[0];

deleteBtn.onclick = function () { // When the user clicks the button, open the modal
	deleteMyAccount.style.display = "block";
}
deleteBtnReal.onclick = function () { // When the user clicks the button, open the modal
	deleteMyAccount.style.display = "none"; // 회원 탈퇴시? 일단 닫기로 해놓음. 나중에 홈화면으로 돌아가는 걸로 수정
}
close.onclick = function () { // When the user clicks on <span> (x), close the modal
	deleteMyAccount.style.display = "none";
}
window.onclick = function (event) { // When the user clicks anywhere outside of the modal, close it
   if (event.target == deleteMyAccount) {
		deleteMyAccount.style.display = "none";
   }
}

// 비밀번호 변경
var modifyPassword = document.getElementById("modifyPassword");
var modifyPwBtn = document.getElementById("modifyPwBtn");
var modifyPwBtnReal = document.getElementById("modifyPwBtnReal");
var modifyClose = document.getElementsByClassName("modifyClose")[0];

modifyPwBtn.onclick = function () {
	modifyPassword.style.display = "block";
}
modifyPwBtnReal.onclick = function () {
	modifyPassword.style.display = "none";
}
modifyClose.onclick = function () {
	modifyPassword.style.display = "none";
}
window.onclick = function (event) {
	if (event.target == modifyPassword) {
		modifyPassword.style.display = "none";
	}
}
   
// input label change
function myFunction() {
  
	var paragraph = document.getElementById("file-name");
	paragraph.textContent = "";
	  
	var fullPath = document.getElementById('my-settings-file-upload').value;
	if (fullPath) {
		var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
		var filename = fullPath.substring(startIndex);
		if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
			filename = filename.substring(1);
		}
		paragraph.textContent = filename;
	}
	document.getElementById('submit-button').disabled = false;
}
   
// input preview
function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			const previewImage = document.getElementById("preview-image")
			previewImage.src = e.target.result
		}
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}
  
// input file에 change 이벤트 부여
const inputImage = document.getElementById("my-settings-file-upload")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

// 비밀번호 변경
function passwdCheck() {
	var passwdRules = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;
	var newPasswd = $('#new-passwd').val();
	var rePasswd = $('#re-passwd').val();
	
	if (!passwdRules.test(newPasswd)) {
		$('#new-passwd').css('border', '1px solid #e21111')
		$('#new-passwdCheck').css('color', 'red')
		$('#new-passwdCheck').html("비밀번호는 영문/숫자/특수문자(!@#$%^&*)를 포함하여 8~16자로 입력해야 합니다.")
		flag = false;
	} else {
		$('#new-passwd').css('border', '1px solid #545454')
		$('#new-passwdCheck').css('color', '#0071c2')
		$('#new-passwdCheck').html("사용 가능합니다.")
		flag = true;
	}
	if (!isEmpty(rePasswd)) {
		if (newPasswd != rePasswd) {
			$('#re-passwd').css('border', '1px solid #e21111')
			$('#re-passwdCheck').css('color', 'red')
			$('#re-passwdCheck').html("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.")
			flag = false;
		} else {
			$('#re-passwd').css('border', '1px solid #545454')
			$('#re-passwdCheck').css('color', '#0071c2')
			$('#re-passwdCheck').html("새 비밀번호와 새 비밀번호 확인이 일치합니다.")
			flag = true;
		}
	}
}

function disabled_Btn(){
// 	alert("다가올 예약이 있는 경우 탈퇴가 불가능합니다.");
	swal({
		   title: "죄송합니다.",
		   text: "다가올 예약이 있는 경우 탈퇴가 불가능합니다.",
		   icon: "warning" //"info,success,warning,error" 중 택1
		});
}
	
</script>
</body>
</html>