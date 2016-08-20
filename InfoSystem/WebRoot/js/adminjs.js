function pwdView(){
	var pwd=document.getElementById('pwd');
	pwd.onclick=function(){
		var password=document.getElementById('password');
		
		var temp=password.value;
		if(password.type=="password"){
			var replace=document.getElementById('replace');
			replace.innerHTML='<input name="password" id="password" type="text"  value="" class="login-input"/>';
			document.getElementById('password').value=temp;
		}
		if(password.type=="text"){
			var replace=document.getElementById('replace');
			replace.innerHTML='<input name="password" id="password" type="password"  value="" class="login-input"/>';
			document.getElementById('password').value=temp;
		}
	}
}

function menuclick(){
	var ul=document.getElementById('nav_dot');
	var lis=ul.getElementsByTagName('li');

	var i=0;
	for(i=0;i<lis.length;i++){
		lis[i].onclick=function(){
			for(var j=0;j<lis.length;j++){
				lis[j].getElementsByTagName('div')[0].style.display="none";
			}
			var odiv=this.getElementsByTagName('div')[0];
			odiv.style.display="block";
		}
	}
}

function nullcheck(){
	var id=document.getElementById("id").value.replace(/(^\s*)|(\s*$)/g,"");
	var name=document.getElementById("name").value.replace(/(^\s*)|(\s*$)/g,"");
	var idcard=document.getElementById("idcard").value.replace(/(^\s*)|(\s*$)/g,"");
	var academy=document.getElementById("academy").value.replace(/(^\s*)|(\s*$)/g,"");
	var major=document.getElementById("major").value.replace(/(^\s*)|(\s*$)/g,"");
	var classes=document.getElementById("classes").value.replace(/(^\s*)|(\s*$)/g,"");
	
	
	if(id==null||id==""){
		alert('请输入学号');
		return false;
	}
	if(name==null||name==""){
		alert('请输入姓名');
		return false;
	}
	if(idcard==null||idcard==""){
		alert('请输入身份证号码');
		return false;
	}
	if(academy==null||academy==""){
		alert('请选择学院');
		return false;
	}
	if(major==null||major==""){
		alert('请选择专业');
		return false;
	}
	if(classes==null||classes==""){
		alert('请输入班级');
		return false;
	}
	
	return true;
}


var majorids=[
             ["080703","080701","080706","080707T"],
             ["080901","080904K","070504","080903","080907T"],
             ["080801","080601","080905","080602T","080301"],
             ["080705","080702","080712T","080704","080714T"],
             ["082601","081302","071002","071003"],
             ["070101","070102","070202"],
             ["120102","120801","120201K","120202","120203K","120103","020101","120601"],
             ["030101K","030102T"],
             ["130305","130310","130503","130502","130504"],
             ["050201","050261"],
             ["040203"],
             ["080902"],
             ["130000"],
             ["080202"]
           ];
var majornames=[
               	["通信工程","电子信息工程","信息工程","广播电视工程"],
               	["计算机科学与技术","信息安全","地理信息科学","网络工程","智能科学与技术"],
               	["自动化","电气工程及其自动化","物联网工程","智能电网信息工程","测控技术与仪器"],
               	["光电信息科学与工程","电子科学与技术","电磁场与无线技术","微电子科学与工程","电子信息科学与技术"],
               	["生物医学工程","制药工程","生物技术","生物信息学"],
               	["数学与应用数学","信息与计算科学","应用物理学"],
               	["信息管理与信息系统","电子商务","工商管理","市场营销","会计学","工程管理","经济学","物流管理"],
               	["法学","知识产权"],
               	["广播电视编导","动画","环境设计","视觉传达设计","产品设计"],
               	["英语","翻译"],
               	["社会体育指导与管理"],
               	["软件工程"],
               	["国际学院"],
               	["机械设计制造及其自动化"]
               ];


function getMajor(obj){
	var academy=document.getElementById("academy");
	var major=document.getElementById("major");
	major.length=0;
	var majorid=majorids[academy.selectedIndex];
	var majorname=majornames[academy.selectedIndex];
	
	
	for(var j=0;j<majorid.length;j++){
		major.options.add(new Option(majorname[j],majorid[j]));
	}
}


function detailChg(){
	var result=document.getElementById("result");
	
	var lis=result.getElementsByTagName("li");
	for(var i=0;i<lis.length;i++){
		lis[i].index=i;
		lis[i].onclick=function(){
			var detail=document.getElementById("detail");
			var divs=detail.getElementsByTagName("div");
			for(var j=0;j<divs.length;j++){
				divs[j].style.display="none";
			}
			divs[this.index].style.display="block";
		}
	}
}

function getvalue(){
	var s=editor.document.getBody().getHtml();
	var input=document.getElementById("contents");
	
	input.value=s;
	return true;
}