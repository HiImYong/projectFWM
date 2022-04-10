<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/navi.jspf"%>

<script>
  $(function() {
    $("#tableitem tr").click(function() {

      var tr = $(this);
      var td = tr.children();

      var category = td.eq(0).attr('data-value');
      //var category = td.eq(0).text();
      var name = td.eq(1).text();
      var firstAttr = td.eq(2).text();
      var secondAttr = td.eq(3).text();
      var price = td.eq(4).text();
      var contractDate = td.eq(5).text();
      var used = td.eq(6).text();
      console.log(used);
      var quantity = td.eq(7).text();

      document.getElementById("inputCategory").value = category; //option value로 구분됨
      $("#inputCategory").find('option[value='+category+']').prop("selected", true); //attr을 쓰면 콘솔상에 selected가 추가된다. prop는 추가 안됨.
      document.getElementById("inputName").value = category;
      document.getElementById("inputFirstAttr").value = firstAttr;
      document.getElementById("inputSecondAttr").value = secondAttr;
      document.getElementById("inputPrice").value = price.trim(); 
      document.getElementById("inputContractDate").value = contractDate;
      $('input[id="inputUsed"]').val([used]);
      document.getElementById("inputQuantity").value = quantity; 

    })

  })
</script>


<div class="flex">
  <div class="">
    <table class="table table-compact" id="tableitem">
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
      <tbody class="mb-5">
        <c:forEach var="item" items="${items}">
          <tr class="cursor-pointer hover:underline" id="hi">
            <td data-value="${item.category}">${item.category}</td>
            <td>${item.name}</td>
            <td>${item.firstAttr}</td>
            <td>${item.secondAttr}</td>
            <td>
              <fmt:formatNumber value="${item.price}" pattern="#,###"></fmt:formatNumber>
            </td>
            <td>${item.contractDate}</td>
            <td>${item.used}</td>
            <td>${item.quantity}</td>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>


  <div class="mb-5 bg-blue-100 flex-col ml-2 w-full container rounded-md">
    <div class="mb-2 flex justify-center bg-white font-bold text-blue-600 border border-blue-500 py-3 rounded-md">자재
      신규 등록</div>

    <form action="/user/item/doSetItem" class="px-2 flex flex-col">
    <div id="inputCategory">
      <select id="inputCategory" name="category" class="select mb-2 w-full">
        <option value="1">광장비</option>
        <option value="2">유선기자재</option>
        <option value="3">광케이블</option>
      </select>
      </div>
      <input id="inputName" name="name" required="required" type="text" class="input mb-2" placeholder="이름을 입력하세요" />
      <input id="inputFirstAttr" name="firstAttr" required="required" type="text" class="input mb-2" placeholder="대규격을 입력하세요" />
      <input id="inputSecondAttr" name="secondAttr" required="required" type="text" class="input mb-2" placeholder="소규격을 입력하세요" />
      <input id="inputPrice" name="price" required="required" type="text" class="input mb-2" placeholder="계약단가를 입력하세요" />
      <input id="inputContractDate" name="contractDate" required="required" type="date" class="input mb-2" placeholder="계약일자를 입력하세요" />
      <input id="inputQuantity" name="quantity" required="required" type="text" class="input mb-2"
        placeholder="최초수량을 입력하세요" />
      <div class="mb-2">
        <label>
          신품
          <input id="inputUsed" name="used" type="radio" class="radio" checked value="1">
        </label>
        <label>
          중고
          <input id="inputUsed" name="used" type="radio"  class="radio" value="2">
        </label>

      </div>



      <div class="flex justify-center">

        <button class="btn mr-2 btn-primary" type="submit">신규자재 등록</button>
        <button class="btn btn-error">선택 자재 수정(개발중)</button>


      </div>



    </form>
  </div>

</div>

<%@ include file="../common/foot.jspf"%>
