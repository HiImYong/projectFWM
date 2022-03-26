<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/navi.jspf"%>

<script>

  $(function() {
    $("#tableitem tr").click(function(){
      
      var tr = $(this);
      var td = tr.children();
      
      //console.log("클릭됨 : " + tr.text());
      
      	var id = td.eq(0).text();
		var name = td.eq(2).text();
		var quentity = td.eq(8).text();

		//console.log(name);
		
		$.ajax({
		  type:'get',
		  url:'/user/item/itemHandling',
		  data : {change_id : id },
		  
		  success : function(response){
		    document.getElementById("inputName").value=name;
		    document.getElementById("inputQuentity").value=quentity;
		    document.getElementById("change_id").value=id;

		  }
		})

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
          <th>현재수량</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${items}">
          <tr class="cursor-pointer hover:underline" id="hi">
            <td class="hidden">${item.id}</td>
            <th>${item.category}</th>
            <td>${item.name}</td>
            <td>${item.firstAttr}</td>
            <td>${item.secondAttr}</td>
            <td>${item.price}</td>
            <td>${item.contractDate}</td>
            <td>${item.used}</td>
            <td>${item.quantity}</td>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>


  <div class="bg-blue-100 flex-col ml-2 w-full container rounded-md">
    <div class="mb-2 flex justify-center bg-white font-bold text-blue-600 border border-blue-500 rounded-md">자재 변동
      기입</div>

    <form action="/user/item/doitemHandling" class="px-2 flex flex-col">


      <div>


        <input id="inputName" required="required" type="text" class="input mb-2 " placeholder="변동 자재를 선택해주세요" readonly />

        <input id="inputQuentity" required="required" type="text" class="input mb-2 min-w-3" placeholder="현재 수량"
          readonly />

        <input name="change_id" id="change_id" required="required" type="text" class="input selectedId mb-2 min-w-3" placeholder="선택 자재" readonly />


      </div>

      대상 [~(으)로 / ~(으)로부터]:
      <select name="place" class="select mb-2 w-full">
        <option value="1">대덕창고</option>
        <option value="2">남부국사</option>
        <option value="3">북부센터</option>
      </select>


      <div class="mb-2">

        변동작업 :
        <label>
          입고
          <input name="change_state" type="radio" name="radio-1" class="radio" checked value="1">
        </label>
        <label>
          출고
          <input name="change_state" type="radio" name="radio-1" class="radio" value="2">
        </label>

      </div>


      변동수량 :
      <input name="change_quantity" required="required" type="text" class="input mb-2" placeholder="변동수량을 입력하세요" />
      변동일자 :
      <input name="change_date" required="required" type="date" class="input mb-2" />




      <div class="flex justify-center ">

        <button class="btn mr-2 btn-primary" type="submit">변동자재 등록</button>
        <button class="btn btn-error">뒤로가기</button>


      </div>



    </form>
  </div>

</div>

<%@ include file="../common/foot.jspf"%>
