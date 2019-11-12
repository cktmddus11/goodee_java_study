// 자바스크립트에서 객체를 생성
// 콜백함수에서 ajax 객체를 매개변수로 전달방법.

var ajax = {} // 객체
ajax.xhr = {} // 객체
ajax.xhr.Request = function(url, params, callback, method){ // ajax.xhr.Request 객체의 생성자 구현
	// 멤버변수 : url, params, callback, method, req
	// 멤버 메서드 : send(), getXmlHttpRequest, onStateChange
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
// prototype : 멤버 구현 
ajax.xhr.Request.prototype = {
		getXmlHttpRequest : function(){ // ajax 객체 생성
			if(window.ActiveXObject){
				try{
					return new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					try{
						return new ActiveXObject("Microsoft.XMLHTTP");
					}catch(e2) {return null; }
				}
			}else if (window.XMLHttpRequest){
				return new XMLHttpRequest(); // 객체 리턴 
			}else{
				return null;
			}
		},
		send : function(){
			this.req = this.getXmlHttpRequest(); // this.req : ajax객체 저장 
			var httpMethod = this.method ? this.method : "GET";
			if(httpMethod != "GET" && httpMethod != "POST"){
				httpMethod = "GET"
			}
			var httpParams = (this.params == null || this.params == '')?null:this.params;
			var httpUrl = this.url;
			if(httpMethod == 'GET' && httpParams != null){
				httpUrl = httpUrl +"?" + httpParams;
			} 
			// ajax 준비
			this.req.open(httpMethod, httpUrl, true);
			// 전송을 위한 Header 정보 설정
			this.req.setRequestHeader("Content-Type", "application/x-www-from-urlencoded");
			var request = this; // this : ajax.xhr.Request객체
			// 콜백함수 등록 - 상태가 변경될떄마다 자동으로 호출됨
			this.req.onreadystatechange = function(){
				request.onStateChange.call(request); 
				// onStateChange() 메서드 호출.call은 메서드 호출시  매개변수를 설정할수 있음
			}
			this.req.send(httpMethod == "POST"?httpParams : null);
		},
		onStateChange : function(){
			this.callback(this.req); // 콜백함수 호출시 ajax객체 전달 
		}
		
}