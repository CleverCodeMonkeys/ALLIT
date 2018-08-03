/* 회원가입 취소 버튼 시 [START]*/
function cancelJoin(){
	var answer = confirm('회원정보 등록을 취소하겠습니까?');
	if(answer){
		document.getElementById('join').style.display='none';
		joinInit();
	}
}

function joinInit(){
	$('#userId').val("");
	$('.guide').css('display','none');
	$('#password').val("");
	$('#password2').val("");
	$('#email').prop('disabled', false);
	$('#email').val("");
	$('#okBtn').css('display','none');
	$('#sendingBtn').css('display','block');
	$('#hideAuthorized').css('display', 'none');
	$('#confirm').val("");
}
/* 회원가입 취소 버튼 시 [END]*/

/* Duplicate Check Function */
var maximum_id = 20;

/* Password Value */
var maximum_pwd = 15;
var minimum_pwd = 8;

/* E-mail Value */
var maximum_email = 25;

/* Confirm Email Value */
var confirmEmail = false;

/* MODAL 창 처음 클릭될 TAB 설정*/
document.getElementsByClassName("tablink")[0].click();
document.getElementsByClassName("tablink2")[0].click();

/* 패스워드 불일치 할시 알림창 로직*/
$(function(){
	$("#password2").blur(function(){
		var p1=$("#password").val(), p2=$("#password2").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#password").focus();
		}
	});
});

/* 회원가입시 유효성 검사 [START]*/
function validate(){
	
	var id = $('#userId')	.val();
	var password = $('#password').val();
	var dup = $("#idDuplicateCheck").val();
	
	if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(id)){
		alert('한글 아이디 불가합니다.');
		return false;
	}
	
	if(dup != 1){
		alert('중복된 아이디 입니다.');
		return false;
	}
	
	if(!checkPassword(id, password)){
		return false;
	}
	
	if(!confirmEmail){
		alert("이메일 인증이 확인 되지 않았습니다.");
		return false;
	}
	
	if($('#password').val() != $('#password2').val()){
		alert('비밀번호가 일치 하지 않습니다.');
		return false;
	}
	
	return true;
}
/* 회원가입시 유효성 검사 [END]*/

/* 패스워드 유효성 검사 [START]*/
function checkPassword(id, password){
	if(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(password)){
		alert('비밀번호는 숫자와 영문자 특문 조합으로 8~15자리를 사용해야 합니다.');
		return false;
	}
	
	var checkNumber = password.search(/[0-9]/g);

	var checkEnglish = password.search(/[a-z]/ig);



	if(checkNumber <0 || checkEnglish <0){

	alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");

	return false;

	}

	if(/(\w)\1\1\1/.test(password)){

	alert('비밀번호는 같은 문자를 4번 이상 사용하실 수 없습니다.');

	return false;

	}

	if(password.search(id) > -1){

	alert("비밀번호에 아이디가 포함되었습니다.");

	return false;
	}
	
	return true;
}
/* 패스워드 유효성 검사 [END]*/


//Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

/* 일반회원 각 항목 제한 입력 수 [START]*/
$('#userId').keyup(function(event){
	var value = $(this).val().length;
	if(value >  maximum_id)
		$(this).val($(this).val().substring(0,maximum_id));
});

$('#password').keyup(function(event){
	var value = $(this).val().length;
	if(value >  maximum_pwd)
		$(this).val($(this).val().substring(0,maximum_pwd));
});

$('#password2').keyup(function(event){
	var value = $(this).val().length;
	if(value >  maximum_pwd)
		$(this).val($(this).val().substring(0,maximum_pwd));
});

$('#email').keyup(function(event){
	var value = $(this).val().length;
	if(value >  maximum_email)
		$(this).val($(this).val().substring(0,maximum_email));
});
/* 일반회원 각 항목 제한 입력 수 [END]*/

function openLogin(evt, member) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("member");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	    tablinks[i].classList.remove("w3-cyan");
	  }
	  document.getElementById(member).style.display = "block";
	  evt.currentTarget.classList.add("w3-cyan");
	}

	function openJoin(evt, memberjoin) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("memberjoin");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink2");
		  for (i = 0; i < x.length; i++) {
		    tablinks[i].classList.remove("w3-cyan");
		  }
		  document.getElementById(memberjoin).style.display = "block";
		  evt.currentTarget.classList.add("w3-cyan");
	}
	



