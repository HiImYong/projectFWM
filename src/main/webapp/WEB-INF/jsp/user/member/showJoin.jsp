<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/navi.jspf"%>

<div>
회원가입
</div>

<form action="/user/member/insertMember" class="container">
<div>아이디 : <input name="loginId" type="text" placeholder="아이디를 입력해주세요"/>

</div>
<div>비밀번호 : <input name="loginPw" type="text" placeholder="비밀번호를 입력해주세요"/>
</div>

<div>이름 : <input name="name" type="text" placeholder="이름를 입력해주세요"/>
</div>

<div>별명 : <input name="nickname" type="text" placeholder="별명를 입력해주세요"/>
</div>

<div>이메일 : <input name="email" type="text" placeholder="이메일를 입력해주세요"/>
</div>

<button type="submit">가입하기</button>
<button type="">다시쓰기</button>

</form>


<%@ include file="../common/foot.jspf"%>
