function CheckUpdate() {
	var id = document.getElementById("id");
	var name = document.getElementById("name");
	var passwd = document.getElementById("passwd");
	var check_passwd = document.getElementById("check_passwd");
	var email = document.getElementById("email");
	var phoneNumber = document.getElementById("phone_number");
	var birthDate = document.getElementById("birth_date");
	var role = document.getElementsByName("role");
	var roleValue = false;
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var regDate = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
	
	console.log("222");
	// id check
	if(id.value.length < 1){
		alert("[아이디]\n아이디를 입력하세요");
		id.focus();
		return false;
	}
	
	// passwd check
	if(passwd.value.length < 1){
		alert("[비밀번호]\n비밀번호를 입력하세요");
		passwd.focus();
		return false;
	}
	
	// check_passwd
	if(!(passwd.value == check_passwd.value)){
		alert("[비밀번호 확인]\n 비밀번호를 확인해주세요" + passwd.value + " : " + check_passwd.value);
		check_passwd.focus();
		return false;
	}
	
	// name_check
	if(name.value.length < 1) {
		alert("[이름]\n1자 이상 입력하세요");
		name.focus();
		return false;
	}
	
	// email check
	if(!check(regEmail, email, "이메일 형식에 맞게 작성해주세요")){
		return false;
	}
	
	// phoneNumber check
	if(phoneNumber.value.length < 1 || isNaN(phoneNumber.value)){
		alert("[휴대폰 번호]]\n휴대폰 번호(숫자)를 입력하세요");
		phoneNumber.focus();
		return false;
	}
	
	if(!regDate.test(birthDate.value)){
		alert("[생일]\n생일 형식(yyyy-mm-dd)에 맞게 입력하세요!");
		birthDate.focus();
		return false;
	}
	
	
	// role 선택 확인
	for(var i = 0; i < role.length; i++){
		if(role[i].checked){
			roleValue = true;
			break;
		}
	}
	
	if(!roleValue){
		alert("[역할]\n 역할을 선택해주세요");
		return false;
	}
	
	function check(reg, e, msg){
		if(reg.test(e.value)){
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.updateInfo.submit();
}