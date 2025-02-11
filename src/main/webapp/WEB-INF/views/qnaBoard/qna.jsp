<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <%@ include file="../include/header.jsp" %>

   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>

<style>
	.myQnA-list {
    margin-top: 3em;
    margin-bottom: 3em;
    margin: 0 auto;
    width: 80%;
}

	.myQnA-list .question-title {
	font-size: 18px;
	height: 50px;
	border-bottom: #996633 1px solid;
	padding: 14px 5px;
	margin: 20px 0;
}

	.myQnA-list .answer {
	display: none;
	background-color: #fafafa;
	font-size: 18px;
	height: auto;
	padding: 14px 20px;
}

	.myQnA h3{
	padding-top: 20px;
	padding-bottom: 40px;
	font-size: 25px;
}
	
</style>


    <section>
        <article class = "QNA main-container">
            
            <h2>Q&A</h2>

            <!--자주하는 질문-->
            <div class="FAQ wrap">
                <h3>자주하는 질문</h3>
                <div class="list">
                    <ul>
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    </ul>
                </div>

            </div>

            <!--1대1 문의-->
            <div class="personal wrap">
            	<form action="<c:url value='/qnaBoard/registForm' />" name="registForm" method="post">
	                <h3>1대1 문의</h3>
	                <p>
	                   온라인 상담에 대한 답변은 보통 1-2일 정도 시간이 소요되며,
	                   유치원 일정에 따라 조금 늦어질 수 있습니다.
	                </p>
	                <p style="margin-bottom: 30px;">
	                   최대한 빠른 시일 내에 정성껏 답변 드리도록 노력하겠습니다. 
	                </p>
	
	                <div class="personal-txt">       
	                	<input type="hidden" name="writer" value="${login.id}">    
	                    <input type="text" class="input" id="qnaTitle" name="title" placeholder="제목">
	                    <textarea class="personal-area" id="" rows="7" name="content" placeholder="내용"></textarea>
	                </div>
				</form>
				
                <button id="counsel">상담하기</button>
            </div>

            

        </article>
    
    
        <article>
            <!-- <h2 style="text-align:center;">문의내역</h2>  -->
            <div class="myQnA wrap" id="myqna">
                <div class="myQnA-minititle">
                    <h3>문의내역</h3>
                </div>
                <div class="myQnA-list"> 
                    	<div class="list">
		                    <ul>
                    <c:forEach var="vo" items="${qnaList}">
                    	<c:if test="${login.id == vo.writer }">
		                        <li class="question-title">
		                        	${vo.title}<span style="float:right; margin-right:15px;"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></span>
		                        </li>
		                        <li class="answer">
		                        
		                        	<h4>질문</h4>
		                        	<br><br>
		                        	${vo.content}
		                        	<br><hr><br>
		                        	<h4>답변</h4>
		                        	<br><br>
		                        	답변 영역이다!
		                        </li>
		                </c:if>
                    </c:forEach>

		                    </ul>
                		</div>     
                </div>
            </div>
            
            <form action="<c:url value='/qnaBoard/qna#myqna' />" name="pageForm">
                    <div class="text-center">
                    
                    
                    <!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
                    
                    <ul class="pagination" id="pagination">
                       <c:if test="${pc.prev}"> <!-- 이전  -->
                       		<a href="#" data-pageNum="${pc.beginPage-1}">&lt;</a>
                       </c:if>
                       
                       <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                       		<a href="#" data-pageNum="${num}" class="${pc.paging.pageNum == num ? 'active' : ''}">${num}</a>
                       </c:forEach>
                       
                        <c:if test="${pc.next}"> <!-- 다음  -->
                        	<a href="#" data-pageNum="${pc.endPage+1}">&gt;</a>
                        </c:if>                    
                    </ul>
                    
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                    
                    </div>
         </form>
            
            
        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

    <script>
    const registBtn = document.getElementById('counsel');
		registBtn.onclick = function() {
			document.registForm.submit();
		//form태그는 document.폼 네임으로 바로 접근이 가능.
		/*
			if(document.registForm.writer.value === '') {
				alert('작성자는 필수 항목 입니다.');
				document.registForm.writer.focus();
				return; //이벤트 함수 강제 종료
			} else if(document.registForm.title.value === '') {
				alert('제목은 필수 항목 입니다.');
				document.registForm.title.focus();
				return;
			} else if(document.registForm.content.value === '') {
				alert('내용은 필수 항목 입니다.');
				document.registForm.content.focus();
				return;
			} else {
				document.registForm.submit();
			}
			*/
	}
    

		$(document).ready(function(){
		    $("li.question").click(function(){
		        $(this).next().toggle("fast");
	        });
        });
	
		$(document).ready(function(){
		    $("li.question-title").click(function(){
		        $(this).next().toggle("fast");
	        });
        });
		
		
		const pagination = document.getElementById('pagination');
		pagination.onclick = function(e) {
			e.preventDefault(); 
			const value = e.target.dataset.pagenum;
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		}
    </script>
    