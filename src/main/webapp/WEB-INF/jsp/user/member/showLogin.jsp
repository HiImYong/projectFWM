<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/navi.jspf"%>

<div class="container">

  <div>
    <form action="/user/member/sessionLogin">
      <input name="loginId" type="text" placeholder="아이디" />
      <input name="loginPw" type="text" placeholder="비밀번호" /><br />
      <button type="submit">로그인</button>
    </form>
  </div>

  <div>
    <a href="./showJoin">회원가입</a>
  </div>
  <div>
    <a href="">아이디찾기</a>
  </div>
  <div>
    <a href="">비밀번호찾기</a>
  </div>
</div>

<%@ include file="../common/foot.jspf"%>



