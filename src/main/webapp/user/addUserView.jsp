<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "가입"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {
			fncAddUser();
		});
	});

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a#cancel").on("click", function() {
			$("form")[0].reset();
		});
		
		$("a#back").on("click", function() {
			history.back();
		});
	});

	function fncAddUser() {

		var id = $("input[name='userId']").val();
		var pw = $("input[name='password']").val();
		var pw_confirm = $("input[name='password2']").val();
		var name = $("input[name='userName']").val();

		if (id == null || id.length < 1) {
			alert("아이디는 반드시 입력하셔야 합니다.");
			return;
		}
		if (pw == null || pw.length < 1) {
			alert("패스워드는  반드시 입력하셔야 합니다.");
			return;
		}
		if (pw_confirm == null || pw_confirm.length < 1) {
			alert("패스워드 확인은  반드시 입력하셔야 합니다.");
			return;
		}
		if (name == null || name.length < 1) {
			alert("이름은  반드시 입력하셔야 합니다.");
			return;
		}

		if (pw != pw_confirm) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			$("input:text[name='password2']").focus();
			return;
		}

		var value = "";
		if ($("input:text[name='phone2']").val() != ""
				&& $("input:text[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-"
					+ $("input[name='phone2']").val() + "-"
					+ $("input[name='phone3']").val();
		}

		$("input:hidden[name='phone']").val(value);

		$("form").attr("method", "POST").attr("action", "/user/addUser")
				.submit();
	}

	//==>"이메일" 유효성Check  Event 처리 및 연결
	$(function() {

		$("input[name='email']")
				.on(
						"change",
						function() {

							var email = $("input[name='email']").val();

							if (email != ""
									&& (email.indexOf('@') < 1 || email
											.indexOf('.') == -1)) {
								alert("이메일 형식이 아닙니다.");
							}
						});

	});

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//==> 주민번호 유효성 check 는 이해정도로....
	function checkSsn() {
		var ssn1, ssn2;
		var nByear, nTyear;
		var today;

		ssn = document.detailForm.ssn.value;
		// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
		if (!PortalJuminCheck(ssn)) {
			alert("잘못된 주민번호입니다.");
			return false;
		}
	}

	function PortalJuminCheck(fieldValue) {
		var pattern = /^([0-9]{6})-?([0-9]{7})$/;
		var num = fieldValue;
		if (!pattern.test(num))
			return false;
		num = RegExp.$1 + RegExp.$2;

		var sum = 0;
		var last = num.charCodeAt(12) - 0x30;
		var bases = "234567892345";
		for (var i = 0; i < 12; i++) {
			if (isNaN(num.substring(i, i + 1)))
				return false;
			sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
		}
		var mod = sum % 11;
		return ((11 - mod) % 10 == last) ? true : false;
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//==>"ID중복확인" Event 처리 및 연결
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-info")
				.on(
						"click",
						function() {
							popWin = window
									.open(
											"/user/checkDuplication.jsp",
											"popWin",
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"
													+ "scrollbars=no,scrolling=no,menubar=no,resizable=no");
						});
	});

	// check 색상
	$(function() {

		$("input[name='password']").on('input', function() {
	        var pw = $(this).val();
	        
	        if (pw.length >= 6) {
	            $("div#passwordCheck").attr("class", "form-group has-success has-feedback");
	            $("span#passwordCheckFeedback").attr("class", "glyphicon glyphicon-ok form-control-feedback");
	        } else {
	            $("div#passwordCheck").attr("class", "form-group has-error has-feedback");
	            $("span#passwordCheckFeedback").attr("class", "glyphicon glyphicon-minus form-control-feedback");
	        }
	    });

	    // password2 input 처리
	    $("input[name='password2']").on('input', function() {
	        var pw1 = $("input[name='password']").val();
	        var pw_confirm = $(this).val();
	        
	        if (pw1 === pw_confirm) {
	            $("div#password2Check").attr("class", "form-group has-success has-feedback");
	            $("span#password2CheckFeedback").attr("class", "glyphicon glyphicon-ok form-control-feedback");
	        } else {
	            $("div#password2Check").attr("class", "form-group has-error has-feedback");
	            $("span#password2CheckFeedback").attr("class", "glyphicon glyphicon-minus form-control-feedback");
	        }
	    });

		$("input[name='userName']")
				.on(
						'input',
						function() {
							var name = $("input[name='userName']").val();

							if (name.length > 0) {
								$("div#userNameCheck").attr("class",
										"form-group has-success has-feedback");
								$("span#userNameCheck")
										.attr("class",
												"glyphicon glyphicon-ok form-control-feedback");
							} else {
								$("div#userNameCheck").attr("class",
										"form-group has-error has-feedback");
								$("span#userNameCheck")
										.attr("class",
												"glyphicon glyphicon glyphicon-minus form-control-feedback");
							}
						});

	});

</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->

	<jsp:include page="/layout/toolbar.jsp" />

	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">회 원 가 입</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group has-feedback has-error" id="userIdCheck">

				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아
					이 디 *</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="중복확인하세요" readonly> <span
						class="glyphicon form-control-feedback glyphicon glyphicon-minus"
						id="userIdCheck" aria-hidden="true"></span> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">입력전
							중복확인 부터..</strong>
					</span>
				</div>

				<div class="col-sm-3">
					<button type="button" class="btn btn-info">중복확인</button>
				</div>
			</div>

			<div class="form-group has-feedback has-error" id="passwordCheck">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 *</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호"> 
					<span class="glyphicon form-control-feedback glyphicon glyphicon-minus" id="passwordCheckFeedback" aria-hidden="true"></span> 
					<span id="helpBlock" class="help-block"> 
						<strong class="text-danger">6글자 이상 입력해주세요.</strong>
					</span>
				</div>
			</div>

			<div class="form-group has-feedback has-error" id="password2Check">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인"> 
					<span class="glyphicon form-control-feedback glyphicon glyphicon-minus" id="password2CheckFeedback" aria-hidden="true"></span>
				</div>
			</div>


			<div class="form-group has-feedback has-error" id="userNameCheck">

				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름
					*</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userName"
						name="userName" placeholder="회원이름"> <span
						class="glyphicon form-control-feedback glyphicon glyphicon-minus"
						id="userNameCheck" aria-hidden="true"></span>
				</div>

			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주민번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="ssn" name="ssn"
						placeholder="주민번호"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">"
							- " 제외 13자리입력하세요</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="addr" name="addr"
						placeholder="주소">
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
				<div class="col-sm-2">
					<select class="form-control" name="phone1" id="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone2" name="phone2"
						placeholder="번호">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone3" name="phone3"
						placeholder="번호">
				</div>
				<input type="hidden" name="phone" />
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a class="btn btn-primary btn" id="cancel" role="button">초기화</a>
					<button type="button" class="btn btn-primary">가 &nbsp;입</button>
					<a class="btn btn-primary btn" id="back" role="button">이&nbsp;전</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>