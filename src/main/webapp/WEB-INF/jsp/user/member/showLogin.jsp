<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/navi.jspf"%>

<div class="container flex justify-center  py-3 mt-5">




<div class="card w-100 bg-base-100 shadow-xl">
  <figure class="px-10 pt-10">
    <img src="https://media.istockphoto.com/photos/3d-warehouse-building-picture-id1208067405?k=20&m=1208067405&s=612x612&w=0&h=ghH14JE-TZeQVCwvbN2L7IXIOL6osI-idy9bDzd3kZQ="
     alt="Shoes" class="rounded-xl w-full" />
  </figure>
  <div class="card-body items-center text-center">
<div class="container flex justify-center  py-1 mt-5 ">

  <div class="px-3">
    <form action="/user/member/sessionLogin" class="mt-3 ">
      <input name="loginId" type="text" placeholder="아이디" class="input input-bordered input-accent w-full max-w-xs" />
      <input name="loginPw" type="text" placeholder="비밀번호"  class="input input-bordered input-accent w-full max-w-xs mt-1"/>
      <br />
      <button type="submit" class="btn btn-success mt-1 ">로그인</button>
    </form>

    <div class="mt-5 mb-2">

      <div class="btn btn-primary">
        <a href="./showJoin">회원가입</a>
      </div>
      <div class="mx-1 btn btn-danger">
        <a href="">아이디찾기</a>
      </div>
      <div class="btn btn-danger">
        <a href="">비밀번호찾기</a>
      </div>
    </div>
  </div>

  <br>
    </div>
  </div>
</div>


</div>
<%@ include file="../common/foot.jspf"%>



