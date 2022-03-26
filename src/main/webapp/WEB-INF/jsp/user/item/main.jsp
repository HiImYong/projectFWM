<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/navi.jspf"%>
<div class="flex">
  <div class="">
    <table class="table table-compact ">
      <thead>
        <tr>

          <th>카테고리</th>
          <th>이름</th>
          <th>대규격</th>
          <th>소규격</th>
          <th>계약단가</th>
          <th>계약일자</th>
          <th>제품상태</th>
          <th>최초수량</th>          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${items}">
          <tr>

            <td>${item.category}</td>
            <td>${item.name}</td>
            <td>${item.firstAttr}</td>
            <td>${item.secondAttr}</td>
            <td>${item.price}</td>
            <td>${item.contractDate}</td>
            <td>${item.used}</td>
            <td>${item.quentity}</td>
            
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>


  <div class="bg-blue-100 flex-col ml-2 w-full container rounded-md">
    <div class="mb-2 flex justify-center bg-white font-bold text-blue-600 border border-blue-500 rounded-md">자재 신규 등록</div>

    <form action="/user/item/doSetItem" class="px-2 flex flex-col">
      <select name="category" class="select mb-2 w-full">
        <option value="1">광장비</option>
        <option value="2">유선기자재</option>
        <option value="3">광케이블</option>
      </select>
      <input name="name" required="required" type="text" class="input mb-2" placeholder="이름을 입력하세요" />
      <input name="firstAttr" required="required" type="text" class="input mb-2" placeholder="대규격을 입력하세요" />
      <input name="secondAttr" required="required" type="text" class="input mb-2" placeholder="소규격을 입력하세요" />
      <input name="price" required="required" type="text" class="input mb-2" placeholder="계약단가를 입력하세요" />
      <input name="contractDate" required="required" type="date" class="input mb-2" placeholder="계약일자를 입력하세요" />
      <input name="quantity" required="required" type="text" class="input mb-2" placeholder="최초수량을 입력하세요" />
      <div class="mb-2">
        <label>
          신품
          <input name="used" type="radio" name="radio-1" class="radio" checked value="1">
        </label>
        <label>
          중고
          <input name="used" type="radio" name="radio-1" class="radio" value2="2">
        </label>

      </div>



      <div class="flex justify-center">

        <button class="btn mr-2 btn-primary" type="submit">신규자재 등록</button>
        <button class="btn btn-error">뒤로가기</button>


      </div>



    </form>
  </div>

</div>

<%@ include file="../common/foot.jspf"%>
