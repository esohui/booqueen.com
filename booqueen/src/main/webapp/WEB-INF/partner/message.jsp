<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/partner/css/message.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>${hotel.hotelname} · 예약 관련 메시지</title>
</head>
<body>
<div class="main-container">
        <div class="content">
            <div class="home">
            <jsp:include page="/WEB-INF/partner/header.jsp"/>
                <main class="container">
                    <div class="tab-top">
                        <div>
                            <ul class="tabs">
                                <li class="tab-link current" data-tab="tab-1" id="for_chat">고객</li>
                                <li class="tab-link" data-tab="tab-2">고객 서비스팀</li>
                            </ul>
                            <hr id="hr">
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {

                            $('ul.tabs li').click(function () {
                                var tab_id = $(this).attr('data-tab');

                                $('ul.tabs li').removeClass('current');
                                $('.tab-content').removeClass('current');

                                $(this).addClass('current');
                                $("#" + tab_id).addClass('current');
                            })

                        })
                    </script>
                    <div class="middle">
                        <div class="tab-content current" id="tab-1">
                            <div class="middle-left">
                                <div>
                                    <h4>메시지</h4>
                                        <a href="#">
                                            <button type="button" class="input_icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-search" viewbox="0 0 16 16">
                                                    <path
                                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                </svg>
                                            </button>
                                        </a>
                                        <br>
                                        <input type="text" id="left-text" placeholder="이름 또는 예약번호로 검색해보세요">
                                </div>
                                <div>
                                <table class="message_list">
                                <tr>
                                	<th>예약자 ID</th>
                                	<th>예약 번호
                                	<th>문의일</th>
                                </tr>
                                <c:forEach var="ChatVO" items="${messageList}">
                                <tr>
                                	<td><a onclick="reqList('${ChatVO.userid}', '${ChatVO.reservation_number}'), reqDetail();">${ChatVO.userid}</a></td>
                                	<td>${ChatVO.reservation_number}</td>
                                	<td>${ChatVO.send_date}</td>
                                </tr>	
                                </c:forEach>
                                </table>
                                </div>
                            </div>
                            <div class="middle-middle-1">
								<!-- message -->
                                <div class="message" id="message_wrapper">
                                    
                                </div>

                                <div class="msg-input">
                                    <div>
                                        <textarea class="text" autocomplete="off" placeholder="메시지를 입력해주세요." id="message_textarea"></textarea>
                                    </div>
                                    <div class="send">
                                        <input type="button" id="button" value="전송" onclick="insertChat()">
                                    </div>
                                </div>
                            </div>
                            <div class="middle-right">
                                <div class="right-top" id="reservation_wrapper">
                                	<div id="reservation_info"></div>
                                </div>
                                <div class="right-bottom">
                                    <span>Booqueen.com은 여기에 쓰인 모든 메시지를 받아볼 수 있으며 당사
                                        <a href="#">개인정보 보호정책 및 쿠키 정책</a>에 따라 처리하게 됩니다.</span>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="tab-2">
                            <div class="middle-left">
                                <div>
                                    <h4>메시지</h5>
                                        <a href="#">
                                            <button type="button" class="input_icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-search" viewbox="0 0 16 16">
                                                    <path
                                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                </svg>
                                            </button>
                                        </a>
                                        <br>
                                        <input type="text" id="left-text" placeholder="예약 번호로 검색">
                                </div>

                            </div>
                            <div class="middle-middle">
                                <img alt="" src="images/message.png">
                                <h2>메시지가 없습니다</h2>
                                고객 서비스팀과 예약에 관해 주고 받은 메시지 내용이 여기에 나타납니다<br>

                            </div>

                            <div class="middle-right">
                                <span>Booqueen.com은 여기에 쓰인 모든 메시지를 받아볼 수 있으며 당사
                                    <a href="#">개인정보 보호정책 및 쿠키 정책</a>에 따라 처리하게 됩니다.</span>
                            </div>
                        </div>
                    </div>
            </div>
            </main>
            <jsp:include page="/WEB-INF/partner/footer.jsp"/>
        </div>
        <input type="hidden" value="${hotel.serialnumber}" id="serialnumber">
    </div>
    </div>
	<script>  
	var userid_shared = '';
	var RSVN = '';
	
	var formatDate = function(value) {
		var d = new Date(value);
		var text = d.toLocaleDateString();
		return text;
	}
	
    function reqList(userid, reservation_number) {    
    	
    	userid_shared = userid;
    	RSVN = reservation_number;
    	var path = '${contextPath}';
    	
    	var sendReply = {"userid": userid, "serialnumber": ${hotel.serialnumber}, "reservation_number": RSVN}
    	
	    $.ajax({
	        url: path + '/chat.do'
	        , method : 'POST'
	        , data: JSON.stringify(sendReply)
	        , dataType: 'json'
	        , contentType: 'application/json'
	        , success : function(data) {
	        	$("#message_wrapper").empty();      	
	        
	        	var pre_date = 0;
	        	
	        	$.each(data, function(index, item){
	        
	        		if(index === 0){
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#message_wrapper").append(date_text);
		        		
	        		} else if(pre_date < item.send_date){
	        			
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#message_wrapper").append(date_text);
	        		}
	        		
	        		
	        		if(item.partner){
	        			var result = '';
	        			result += "<div class='presentation-message-right'><div class='msg-guest'><div class='msg-guest-inner'><p>";
	        			result += item.content;
	        			result += "</p></div></div><div class='msg-guest-status'>";
	        			result += item.send_time;
	        			result += "</div>";
	        		} else {
	        			var result = '';
	        			result += "<div class='presentation-message-left'><div class='msg-partner'><div class='msg-partner-inner'><p>";
	        			result += item.content
	        			result += "</p><div id='partner_chat'></div></div></div><div class='msg-partner-status'>"
	        			result += item.send_time;
	        			result += "</div></div></div>"
	        		}
	        		
	        		$("#message_wrapper").append(result);
	        		
	        		pre_date = item.send_date;
	        		
	           })
	        },
	       	error : function() {
				alert('error');			
			}
	   })
	}
    
    function insertChat(){
    	
    	var content_val = $('#message_textarea').val();
    	var chatVO = {"userid": userid_shared, "serialnumber": ${hotel.serialnumber}, "reservation_number": RSVN, "content": content_val, "partner": true }
    	var path = '${contextPath}';
    	
    	$.ajax({
    		url: path + "/insertChat.do"
   			, method : 'POST'
		    , data: JSON.stringify(chatVO)
		    , dataType: 'json'
		    , contentType: 'application/json'
		    , success : function(data) {
		    	$("#message_wrapper").empty();
		    	var pre_date = 0;
		    	
	        	$.each(data, function(index,item){
	        		
	        		if(index === 0){
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#message_wrapper").append(date_text);
		        		
	        		} else if(pre_date < item.send_date){
	        			
	        			const d = new Date(item.send_date);
		        		let text = d.toLocaleDateString();
		        		
		        		var date_text = '';
		        		date_text += "<div class='msg-separator'><div class='msg-separator-text'>";
		        		date_text += text;
		        		date_text += "</div></div>";
		        
		        		$("#message_wrapper").append(date_text);
	        		}
	        		
	        		if(item.partner){
	        			var result = '';
	        			result += "<div class='presentation-message-right'><div class='msg-guest'><div class='msg-guest-inner'><p>";
	        			result += item.content;
	        			result += "</p></div></div><div class='msg-guest-status'>";
	        			result += item.send_time;
	        			result += "</div>";
	        		} else {
	        			var result = '';
	        			result += "<div class='presentation-message-left'><div class='msg-partner'><div class='msg-partner-inner'><p>";
	        			result += item.content
	        			result += "</p><div id='partner_chat'></div></div></div><div class='msg-partner-status'>"
	        			result += item.send_time;
	        			result += "</div></div></div>"
	        		}
	        		$("#message_wrapper").append(result);
	        		$('#message_textarea').val('');
	        		$('#message_wrapper').scrollTop($('#message_wrapper').height());
	           
	        		pre_date = item.send_date;
	        	});
   	     	},
   	    	error : function() {
				alert('error');			
			}
    	});
    }
    
    function reqDetail(){
    	const serialnumber=$("#serialnumber").val()
    	const content_val = $('#reservation_info').val();
    	const chatVO = {
    			"userid": userid_shared, 
    			"serialnumber": serialnumber, 
    			"reservation_number": RSVN
    			}
       
    	var path = '${contextPath}';
    	
    	$.ajax({
    		url: path + "/selectReservationDetail.pdo"
	    	, method : 'POST'
	    	, data : JSON.stringify(chatVO)
	    	, dataType : 'json'
	    	, contentType : 'application/json'
	    	, success : function(resp){
		    		var result = '';
		        	result += "<div><p>예약 정보 확인</p></div>";
		        	result += "<div class='detail'>";
		        	result += "<div class='name'>투숙객명 : <br>";
		        	result += resp.lastname;
		        	result += resp.firstname;
		        	result += "</div><div class='number'>예약번호 : <br>";
		        	result += resp.reservation_number;
		        	result += "</div><div class='check-in'>체크인 : <br>";
		        	result += formatDate(resp.checkin_date);
		        	result += "</div><div class='check-out'>체크아웃 : <br>";
		        	result += formatDate(resp.checkout_date);
		        	result += "</div><div class='price'>총 요금 : <br>";
		        	result += resp.price;
		        	result += "</div><div class='lang'>사용 언어 : <br>";
		        	result += "한국어";	
		        	result += "</div><div class='member'>특별 요청 사항 : <br>";
		        	result += resp.special_request;
		        	result += "</div><div class='room'>객실 : ";
		        	result += resp.type;
		        	result += "</div><div class='arrival-time'>예상 도착 시간 : <br>";
		        	result += resp.time_arrival;
		        	result += "</div></div>";
		        	$('#reservation_info').html(result);
    	},
    	error:function(e){
    		console.log("통신실패 : " + e)
    	}
    }) //ajax close
        
  }
 
    </script>
</body>
</html>