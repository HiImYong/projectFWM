<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/navi.jspf"%>

<script>


function historyCheckBtn(form){
  form.action="/user/item/main";
  form.submit();
  return true;
}

  $(function() {
    $("#tableitem tr").click(function(){
      
      var tr = $(this);
      var td = tr.children();
      
      //console.log("클릭됨 : " + tr.text());
      
      	var id = td.eq(0).text();
		var name = td.eq(1).text();
		var quantity = td.eq(4).text();

		//console.log(name);
		
		$.ajax({
		  type:'get',
		  url:'/user/item/itemHistory',
		  data : {change_id : id },
		  
		  success : function(response){
		    document.getElementById("inputName").value=name;
		    document.getElementById("inputQuentity").value=quantity;
		    document.getElementById("change_historyId").value=id;

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
          <th class="hidden">코드</th>
          <th>변동자재</th>
          <th>대상위치</th>
          <th>상태이력</th>
          <th>변동대상</th>
          <th>변동수량</th>          
          <th>변동날짜</th>
          <th>자재단가</th>


        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${items}">
          <tr class="cursor-pointer hover:underline" id="hi">
            <td class="hidden">${item.id}</td>
            <th>${item.name}</th>
            <td>${item.placeName}</td>
            <td>${item.change_state}</td>
            <td>${item.change_quantity}</td>
            <td>${item.change_date}</td>
            <td><fmt:formatNumber value="${item.price}" pattern="#,###"></fmt:formatNumber></td>

          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>


  <div class="bg-blue-100 flex-col ml-2 w-full container rounded-md">
    <div class="mb-2 flex justify-center bg-red-500 font-bold text-white py-3 rounded-md">변동이력 / 이력삭제(개발중)</div>

    <form action="/user/item/updateItemHistory" class="px-2 flex flex-col">


      <div>


        수정자재:<input id="inputName" required="required" type="text" class="input mb-2 w-full" placeholder="수정 대상 선택"  />

        기존변동수량:<input name="original_quantity" id="inputQuentity" required="required" type="text" class="input mb-2 w-full" placeholder="수정 대상 선택"
           />

        수정변동수량:<input name="change_quantity" id="inputQuentity" required="required" type="text" class="input mb-2 w-full" placeholder="수정 대상 선택"
           />

        히스토리코드:<input name="change_historyId" id="change_historyId" required="required" type="text" class="input selectedId mb-2 w-full" placeholder="수정 대상 선택" readonly />
        
        메인코드:<input name="change_id" id="" required="required" type="text" class="input selectedId mb-2 w-full" placeholder="수정 대상 선택" value="${param.change_id}" readonly />
        
        기존변동작업:<input name="original_state" id="" required="required" type="text" class="input selectedId mb-2 w-full" placeholder="수정 대상 선택" value="${param.change_state}" readonly />


      </div>

      대상 [~(으)로 / ~(으)로부터]:
      <select id="" name="place" class="select mb-2 w-full">
        <option value="1">대덕창고</option>
        <option value="2">남부국사</option>
        <option value="3">북부센터</option>
      </select>


      <div class="mb-2">

        변동작업 :
        <label>
          입고
          <input name="change_state" type="radio" name="radio-1" class="radio" checked value="입고" style="width:30px;height:15px">
        </label>
        <label>
          출고
          <input name="change_state" type="radio" name="radio-1" class="radio" value="출고" style="width:30px;height:15px">
        </label>

      </div>


     
      수정 변동일자 :
      <input name="change_date" required="required" type="date" class="input mb-2" />




      <div class="flex justify-center ">

        <button class="btn mr-2 btn-primary" type="submit">수정하기(개발중)</button>
        


      </div>



    </form>
  </div>

</div>

<%@ include file="../common/foot.jspf"%>
