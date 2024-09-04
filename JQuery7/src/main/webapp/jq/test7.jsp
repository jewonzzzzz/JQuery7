<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 반드시 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("aaaa");

		// 동기방식 : 서버의 정보와 동일한 형태로 처리되는 방식
		//         => 사용자의 요청이 처리가 완료될 때까지 코드 실행이 멈춤(대기)
		//         => 페이지 이동하는 형태(주로 발생)
		
		// 비동기방식 (AJAX) : 서버의 정보와 다른 형태로 처리되는 방식
		//         => 사용자의 요청이 처리 완료될 때 기다지않고 바로 처리
		//         => 페이지 이동 X (한 페이지에서 처리), 정보 불러오기(파일업로드/다운로드, 이메일 전송)
		//         => 페이지 전환 없이 데이터를 처리
		
		// AJAX(Ansyncronous JavaScript And XML) : 비동기 방식의 JavaScript, XML
		
		// $.ajax() : 데이터를 서버에 HTTP통신방식(GET/POST)으로 정보 전달(비동기 방식)
		
// 		$.ajax({
// 			url : "전송 페이지(액션페이지)",
// 			type : "전송 방식(get(기본),post)",
// 			data : "전송할 데이터(파라메터)",
// 			dataType : "요청한(받을) 데이터 타입(html(기본),xml,text,json)",
// 			success : function(data){ data : 전달받은 정보
// 				성공 시 수행할 동작
// 			},
// 			error : function(data){ data : 실패정보
// 				실패 시 수행할 동작
// 			},
// 			complete : function(){
// 				ajax 동작이 완료 시 수행하는 동작
// 			}
// 		});
		
		$("body").css("background", "grey");
		
		
		// 동기 방식으로 sting1.jsp 조회
		//location.href="string1.jsp";
		
		// 비동기 방식으로 string1.jsp 조회
		$.ajax({
			url : "string1.jsp",
			type : "get",
			dataType : "html",
			success : function(data){
				alert(" 비동기방식으로 string1.jsp 갔다옴 ");
				//alert(data);
				$('body').append(data);
			},
			error : function(data){
				alert(" 비동기방식 실행에 문제가 있음 ");
				//alert(data);
				console.log(data);
			}
		});
		
		// string2.jsp 비동기방식 데이터처리
		// 정보 전달 + 처리된 결과 가져오기
		$.ajax({
			url : "string2.jsp",
			type : "get",
			//data : name="itwill", (x)  { 속성:값 } 사용해서 객체 형태로 전달
			data : {name:"itwill", age:34},
			success : function(data){
				alert("string2.jsp 페이지 다녀옴");
				$('body').append("정보 전달 + 처리된 결과 가져오기");
				$('body').append(data);
			}
			
		});

		// XML(eXtensible Markup language) : 확장 가능한 마크업 언어
		//  => HTML형태 처럼 태그를 사용해서 데이터를 저장하는 언어
		//  => 다양한 플랫폼에서 사용가능한 타입(복잡한 데이터구조 표현 가능)
		
		
		// xml1.jsp or xml2.xml를 비동기방식으로 데이터 처리
		$.ajax({
			//url: "xml1.jsp",
			url: "xml2.xml",
			type: "get",
			success: function(data){
				alert("xml2.xml 비동기 방식으로 페이지 다녀옴");
				$('body').append(" <hr> xml 비동기 방식 처리");
				//alert(data);
				console.log(data);
				//$('body').append(data);
				$(data).find("person").each(function(){
					var name = $(this).find("name").text();
					var gender = $(this).find("gender").text();
					var tel = $(this).find("tel").text();
					//alert(name);
					$('body').append("<hr> 이름 : " +name+", 성별 : " +gender+", 전화번호 : " +tel);
				});
			}
		});
		
		
		// jtbc RSS 서비스정보를 비동기 방식으로 처리
		$.ajax({
			url: "https://fs.jtbc.co.kr/RSS/economy.xml",
			success: function(data){
				alert(" JTBC RSS 뉴스 정보에 접근 성공");
				console.log(data);
				// id = news에 출력
				$(data).find("item").each(function(){
					var title = $(this).find("title").text();
					var link = $(this).find("link").text();
					//$('#news').append("<hr>"+title+"<br><a href="+link+">"+link+"</a>");
					
					//var tag = "<a href='"+link+"'>"+title+"</a>";
					
					var tag = "";
						tag += "<a href='"+link+"'>"
						tag += title
						tag += "</a>";
					
					// ``(백틱)
// 					var tag = `
// 						<a href="link"> ${title} </a>
// 					`;
					$('#news').append(tag+"<hr>");
				})
			}
		});
		
		
		// ajax()의 대표적인 리턴타입 : html, xml, JSON
		// JSON 데이터 타입
		// JSON(JavaScript Object Notaion) : 자바스크립트 객체 표기법
		// => 개방형 표준 데이터 포맷의 일부(ex. xml, csv)
		// 장점
		//   1) 단순 텍스트형태, 속성-값 쌍으로 구성 ("속성":값)
	    //   2) 데이터 크기가 작음 => 전송속도 빠름
	    //   3) 특정 언어, 플랫폼에 독립적
	    //   4) 대부분의 언어, 플랫폼, 브라우저에는 JSON 파서가 포함
		// 단점
		//   1) 문법에 예민함 ("" '' , 등 문법체크 필요)
		//   2) 자바스크립트 기반이기 때문에 JS코드가 포함될 수 있음(취약점)
		
		// JSON 문법
		// - 데이터 표현
		//    "속성(key)" : 값(value)
		// - 객체 표현 : { }
		//    { "속성(key)" : 값(value), "속성(key)" : 값(value),... }
// 			{ 
// 			"속성(key)" : 값(value),
// 			"속성(key)" : 값(value),
// 			... 
// 			}
		// - 배열 표현 => [ ] 
		//  ["속성(key)" : 값(value), {"속성(key)" : 값(value)}, [], ...]
		
		// * 속성은 ""으로 묶어서 선언, 값은 타입에 따라서 변경
		// * JSON 타입의 자료형
		//  - 정수 : 단순한 숫자표현 가능(10진수만 가능, 2,8,16진수는 불가능)
		//  - 실수 : 소수점 이하 자리수를 포함하는 숫자 표현
		//           (고정소수점 1.001, 부동소수점 2.5e-5)
		//  - 논리형boolean : true, false
		//  - Null
		//  - 문자열 : String 타입데이터 저장 ""를 사용해서 저장한 타입
		//  - 배열
		
		// * 날짜 정보(Date)타입 지원 X => 문자형태 ("2024-09-04"), 숫자형태(밀리세컨 56156421)
		
		
		
		
		
		
		
		
		
		
		
		
		
	});// jquery
</script>
</head>
<body>
	<h1>test7.jsp</h1>
	
	<h1> 비동기방식(AJAX) </h1>
	
	<hr>
	
	<div id="news"></div>
	
	
</body>
</html>