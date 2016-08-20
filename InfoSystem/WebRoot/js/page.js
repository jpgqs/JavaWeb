



function menufocus(){
	var menu=document.getElementById("nav");
	var lists=menu.getElementsByTagName("li");

	var i=0;
	//var j=0;
	for(i=0;i<lists.length;i++){
		lists[i].onmouseover=function(){
			this.className="active";
			var inner=this.getElementsByTagName("ul")[0];
			if(inner!=null)
				inner.style.display="block";
		}
		lists[i].onmouseout=function(){
			this.className="";
			var inner=this.getElementsByTagName("ul")[0];
			if(inner!=null)
				inner.style.display="none";
		}
	}
}

function fadeOut(node){

	var op=node.style.opacity;
	if(op==0){
		return false;
	}
	
	var value=100;
	clearInterval(node.timer);
	node.timer=setInterval(function(){
		var speed=-1;
		if(value==0){
			//node.style.display="none";
			clearInterval(node.timer);
		}else {
			value+=speed;
			node.style.opacity=value/100;
			node.style.filter="alpha(opacity="+value+")";
		}
	}, 10);
}

function fadeIn(node){
	
	var op=node.style.opacity;
	if(op==1){
		return false;
	}
	
	var value=0;
	clearInterval(node.timer);
	node.timer=setInterval(function(){
		var speed=1;
		if(value==100){
			//node.style.display="block";
			clearInterval(node.timer);
		}else {
			value+=speed;
			node.style.opacity=value/100;
			node.style.filter="alpha(opacity="+value+")";
		}
	}, 10);
}

function chg() {
	var pic=document.getElementById("pic");
	var imgs=pic.getElementsByTagName("img");

	var count=0;

	setInterval(auto, 5000);

	function auto(){
		if(count==imgs.length-1){
			count=0;
		}else{
			count++;
		}

		for(var i=0;i<imgs.length;i++){
			//alert(i);
			fadeOut(imgs[i]);
		}
		fadeIn(imgs[count]);
		//imgs[count].style.display="block";
	}
}

function logincheck(){
	
	var username=document.getElementById("username");
	var password=document.getElementById("password");
	
	if(username!=null&&password!=null){
		if(!usercheck(username.value)){
			username.focus();
			return false;
		}
		if(!pwdcheck(password.value)){
			password.focus();
			return false;
		}
		
	}else{
		alert('error');
		return false;
	}
	
}

function usercheck(value){
	value=value.replace(/(^\s*)|(\s*$)/g,"");//去除空格
	re=new RegExp("[^0-9]");
	if(value==null||value==""){
		alert('请输入学号');
		return false;
		
	}else if(value.length<10){
		alert('学号输入有误');
		return false;
	}
	var s=value.match(re);
	if(s!=null){
		alert('学号中含有非法字符');
		return false
	}
	return true;
}

function pwdcheck(value){
	value=value.replace(/(^\s*)|(\s*$)/g,"");
	if(value==null||value==""){
		alert('请输入密码');
		return false;
		
	}
	return true;
}

function onfocus(){
	var username=document.getElementById("username");
	var password=document.getElementById("password");
	
	username.onfocus=password.onfocus =function(){
		this.className="onfocus";
	}
	
	username.onblur=password.onblur = function(){
		this.className="";
	}
}

function pwdCheck(){
	var oldpassword=document.getElementById("oldpassword");
	var newpassword=document.getElementById("newpassword");
	var newpassword2=document.getElementById("newpassword2");
	
	
	
	if(oldpassword!=null&&newpassword!=null&&newpassword2!=null){
		
		var oldpwd=oldpassword.value;
		var newpwd=newpassword.value;
		var newpwd2=newpassword2.value;
		
		if(!pwdcheck(oldpwd)||!isNumOrChar(oldpwd)){
			oldpassword.focus();
			return false;
		}
		if(!pwdcheck(newpwd)||!isNumOrChar(newpwd)){
			newpassword.focus();
			return false;
		}
		if(!pwdcheck(newpwd2)||!isNumOrChar(newpwd2)){
			newpassword2.focus();
			return false;
		}
		
		if(oldpwd==newpwd){
			alert('新密码与旧密码一致，无需修改！');
			newpassword.focus();
			return false;
		}
		if(newpwd!=newpwd2){
			alert('两次输入密码不一致，请检查');
			newpassword.focus();
			return false;
		}
		
		return true;
		
	}else{
		alert('error');
		return false;
	}
}

function isNumOrChar(value){
	var str1="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var i=0;
    for (i=0; i<value.length;i++) {
    	var onechar=value.substring(i,i+1);
        if (!(str1.indexOf(onechar)!= -1)){
        	alert("必须是数字[0-9]、字母[a-z、A-Z]或组合!");
        	return false;
        }
    }
    return true;
}

function confirm(){
	var btnid=clickButton.id;
	var content=document.getElementById("content"+btnid);
	if(content.className==""){
		return false;
	}
	
	var pmid=document.getElementById("pmid");
	var id=document.getElementById("id"+btnid);
	
	pmid.value=id.innerHTML;
	
	return true;
}

function books(){
	var btnid=clickButton.id;
	var btn=document.getElementById(btnid);
	if(btn.className=="unbtn"){
		return false;
	}
	var bookid=document.getElementById("bookid");
	var id=document.getElementById("id"+btnid);
	
	bookid.value=id.innerHTML;
	if(btn.className=="btn"){
		btn.className="unbtn";
	}
	return true;
}