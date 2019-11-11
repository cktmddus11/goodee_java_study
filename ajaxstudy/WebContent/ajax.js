var ajax = null;
// getAjaxObject() : ajax 객체 생성 기능
// 표준 객체 이름 : XMLHttpRequest 객체임
function getAjaxObject(){
	if(window.ActiveObject){ // 브라우저가 익스플로러이면
		try{
			return new ActiveObject("Msxml2.XMLHTTP");
		}catch(e){ // 객체 생성시 에러발생 처리
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){ // 익스플로러 이외의 브라우저이면
		return new XMLHttpRequest(); // 보통 이거롤 만듦?
	}else{
		return null;
	}
}// getAjaxObject() 함수 끝
// url : "hello.jsp",
// params : "name="+차승연, 
// callback : helloFromServer
// method :  "POST"
function sendRequest(url, params, callback, method){	
	// ajax : XMLHttpRequest객체를 저장. ajax 실행하는 객체, 서버와 통신할 수 있는 객체
	ajax = getAjaxObject(); 
	// httpMethod : GET || POST  둘중 한개의 값 
	// httpMethod : POST 
	var httpMethod = method?method:"GET";
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	// httpParams : name = 차승연
	var httpParams = (params == null || params == '')?null:params;
	// httpUrl : hello.jsp
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" +httpParams;  // get방식이면 hello.jsp?name=차승연
		alert(httpUrl);
	} // post방식이면 hello.jsp로 보냄

	// ajax 실행 준비 -> ajax.readyState = 1
	//  true : 비동기 방식 => 요청한것이 올때까지 대기하지 않고 다른일 하다가? (대부분 비동기방식 이용)
	ajax.open(httpMethod, httpUrl, true);
	// 환경설정 헤더값 설정
	//   application/x-www-form-urlencoded : mutipart아니고 그냥 파라미터 전송용, 기본방식임 
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	// 콜백함수 등록 
	// 콜백함수는 ajax 객체의 상태가 변경될때 마다 호출되는 함수
	//  콜백함수 : 호출을 시스템이 자동으로 하게 함
	ajax.onreadystatechange = callback; // helloFromServer
	// 서버에 요청. get 방식 : send일때 넘어가지 않고 null로 
	//                		post 방식 : send할때 넘어감 
	ajax.send(httpMethod == "POST"?httpParams:null);	
}