<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    


    <section>
        <article class="main-container">
            <div class="wrap title">
                <h2>주문하기</h2>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap orderPage">
                <h3>구매자정보</h3>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">이름</td>
                        <td>${users.name}</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">이메일</td>
                        <td>${users.email}</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">휴대폰 번호</td>
                        <td id="ph">${users.phone}</td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPage">
                <h3 class="deliverytitle">받는사람정보</h3>
                <a href="#" class="deliverybtn" onclick="goPopup();"> 배송지변경</a>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">이름</td>
                        <td>${users.name} <span class="order-basic">기본배송지</span></td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">배송주소</td>
                        <td id="addr"> ${users.addrBasic} ${users.addrDetail} </td> <!-- ${user.addrBasic + user.addrDetail} -->
                    </tr>
                    <tr>
                        <td class="orderPagetd">연락처</td>
                        <td id="pho">${users.phone}</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">배송 요청사항</td>
                        <td>
                            <select name="orderPage-require" required>
	                            <option value="orderPage-select1">배송시 요청사항 선택하기</option>
	                            <option value="orderPage-select2">직접 수령하겠습니다.</option>
	                            <option value="orderPage-select3">문 앞에 놓아주세요.</option>
	                            <option value="orderPage-select4">경비실에 맡겨주세요.</option>
	                            <option value="orderPage-select5">배송 전 휴대폰으로 연락주세요.</option>
	                            <option value="orderPage-select6">파손위험이 있는 상품이니 조심히 다뤄주세요.</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPage">
                <h3>상품정보</h3>
                <table class="productinfor">
                    <tr class="orderPagetrtop">
                        <td class="order_img">상품 이미지</td>
                        <td>상품 이름</td>
                        <td>색상</td>
                        <td>수량</td>
                    </tr>
                    
                    
                    
                    
                    <c:forEach var = "vo" items="${orderList}" varStatus="st">
	                    <tr class="orderPagetrbottom">
	                        <td class="order_img"><img src="../img/snack1.jpg" alt="#"></td>
	                        <td class="items">${vo.pname}</td>
	                        <td>${vo.amount}개</td>
	                        <td>${vo.price}원</td>
	                    </tr>
	                        <input type="hidden" id="part_sum${st.count}" name="part_sum" value="${vo.amount * vo.price}">
	                        
					</c:forEach>
                </table>
              	<input type="hidden" id="length" value="${fn:length(orderList)}">
                
            </div>
            <div class="wrap orderPage">
                <h3>결제정보</h3>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">총상품가격</td>
                        <td class = "total_price">45,000원</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">배송비</td>
                        <td>2,500원</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">총결제가격</td>
                        <td class="final_price" >47,500원</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">결제 방법</td>
                        <td>
                            <input type="radio" name="size"> 신용카드
                            <input type="radio" name="size"> 계좌이체
                            <input type="radio" name="size"> 휴대폰결제
                            <input type="radio" name="size"> 무통장입금(가상계좌)
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPagebtn">
            <a href="#">결제하기</a>
            </div>
        </article>

    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    //금액 세자리씩 콤마로 구분하는 함수
    function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
    
        
    $(document).ready(function(){
    	var totalPrice = 0;
        var i = 1;
        while(i <= parseInt($('#length').val())){
	        totalPrice += parseInt($('#part_sum'+i).val());
	        console.log(totalPrice);
	        i++;
        	
        }     
        document.querySelector('.total_price').textContent = numberWithCommas(totalPrice) + '원';
        document.querySelector('.final_price').textContent = numberWithCommas(totalPrice + 2500) + '원';
        
        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
        	document.getElementById("addr").value = roadAddrPart1 + addrDetail;
        	//document.getElementById("addr").innerHTML = roadAddrPart1 + addrDetail;
        };
        
        
        var test = "<c:out value='${users.phone}' />";
        console.log(test);
        var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
        console.log(testDate);
        document.getElementById("ph").innerHTML = testDate;
        document.getElementById("pho").innerHTML = testDate;
        
        //document.querySelectorAll('#ph, #phone').textContent = testDate;
        
        //$("#ph").textContent = testDate;
        
        //var phone_before = "<c:out value='${users.phone}' />";
        	
        	
        /*
        console.log(phone_before);
        var phone_after = phone_before.substr(0,3) + '-' + phone_before.substr(3,7) + '-' + phone_before.substr(7,11);
        console.log('hey: '+phone_after);
        document.querySelector('#phone').textContent = phone_after;
        */
    });
    

    </script>
