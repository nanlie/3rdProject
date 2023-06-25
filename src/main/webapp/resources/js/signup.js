    var idChkCnt = 0;
    var idChkbool = false;
    
    // 생년월일 시작
    $(document).ready(function(){            
	    var now = new Date();
	    var year = now.getFullYear();
	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
	    //년도 selectbox만들기               
	    for(var i = 1900 ; i <= year ; i++) {
	        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
	    }
	    // 월별 selectbox 만들기            
	    for(var i=1; i <= 12; i++) {
	        var mm = i > 9 ? i : "0"+i ;            
	        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
	    }
	    // 일별 selectbox 만들기
	    for(var i=1; i <= 31; i++) {
	        var dd = i > 9 ? i : "0"+i ;            
	        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
	    }
	})
	//생년월일 끝
	
    //form 데이터 전송 함수 시작

    //form 데이터 전송 함수 끝 	
    
    //휴대폰번호 정규식 시작
    	const autoHyphen2 = (target) => {
    		 target.value = target.value
    		   .replace(/[^0-9]/g, '')
    		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
    		}
    //휴대폰번호 정규식 끝
    
    //메일 입력창 시작
        $(function() {
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#select').val());
                $('#textEmail').attr("disabled", true);
            }
        })
    });
    //메일 입력창 끝
    
    //패스워드 체크 시작
    $(document).ready(function(){
	    $("#pwd1").keyup(function(){
	    	let pwd1 = $("#pwd1").val();
	    	let pwd2 = $("#pwd2").val();
	    	let reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/
	    	if(!reg.test(pwd1)){
		    	document.getElementById("pwdChk1").value = "영문,숫자혼합 6~12자리를 입력";
		    	document.getElementById("pwdChk1").style.color = "red";
	    	}
	    	if(reg.test(pwd1)){
		    	document.getElementById("pwdChk1").value = "사용 가능한 비밀번호입니다.";
		    	document.getElementById("pwdChk1").style.color = "blue";
	    	}
	    	if(pwd1 == "") {
	    		document.getElementById("pwdChk2").value = "";
	    	}
	    	if(pwd1 == pwd2 && pwd2 == ""){
	    		document.getElementById("pwdChk2").value = "";
	    	}
	    	if(pwd1 != pwd2){
	    		document.getElementById("pwdChk2").value = "불일치";
	    		document.getElementById("pwdChk2").style.color = "red";
	    	}
	    	if(pwd1 == pwd2 && pwd1 != ""){
		    	document.getElementById("pwdChk2").value = "일치";
	    		document.getElementById("pwdChk2").style.color = "blue";
	    	}
	    });
	    $("#pwd2").keyup(function(){
	    	let pwd1 = $("#pwd1").val();
	    	let pwd2 = $("#pwd2").val();
	    	
	    	if(pwd2 == ""){
	    		document.getElementById("pwdChk2").value = "";
	    	}
	    	if(pwd1 == pwd2 && pwd2 == ""){
	    		document.getElementById("pwdChk2").value = "";
	    	}
	    	if(pwd1 == pwd2 && pwd1 == ""){
	    		document.getElementById("pwdChk2").value = "";
	    	}
	    	if(pwd1 == pwd2){
		    	document.getElementById("pwdChk2").value = "일치";
	    		document.getElementById("pwdChk2").style.color = "blue";
	    	} else {
	    		document.getElementById("pwdChk2").value = "불일치";
	    		document.getElementById("pwdChk2").style.color = "red";
	    	}
	    });
    });
    function chkSpace(){
    	var kcode = event.keyCode;
    	if(kcode == 32) {
    		event.returnValue = false;
    	}
    }
    //패스워드 체크 끝
    //아이디 중복 체크 시작
    function idChkGo(){
    	let idChk = document.getElementById("id").value;
		let url = "idChk.do";
		let vo = { id: idChk};
		let reg = /^(?=.*[a-zA-Z]).{6,12}$/
		$.ajax(url,{
			type: "post",
			data: JSON.stringify(vo), // 서버쪽 전달 데이터(JSON 문자열)
			contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
			dataType: "json", // 응답받을 데이터 타입
			success: function(respData){
				console.log(respData);
				if (respData == false) {
					alert("이미 사용중인 아이디 입니다.");
					idChkbool = false;
					idChkCnt = 0;
					return;
				} 
				if (respData == true && idChk.length > 5 && reg.test(idChk)) {
					//alert("사용 가능한 아이디 입니다.");
					let answer = confirm("사용 가능한 아이디 입니다. 이 아이디를 사용하시겠습니까?");
					if(answer){
						document.getElementById("id").setAttribute('disabled', true);
						idChkbool = true;
						idChkCnt = 1;
					} else if(!answer) {
						document.getElementById("id").removeAttribute('disabled');
						idChkbool = false;
						idChkCnt = 0;
					}
					
				}
				if (idChk.length < 6 || !reg.test(idChk)) {
					alert("아이디는 6~12자로 입력해주세요.");
					return;
				}
			},
			error: function(){}
		}); 
    }
    //아이디 중복 체크 끝