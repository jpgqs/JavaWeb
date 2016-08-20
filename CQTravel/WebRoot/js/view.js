
function lineslide(){

	var as=$('.tiles-item a');
	$.each(as,function(){
		$(this).mouseenter(function(){
			var info=$(this).children('.info-line');
			$(info).animate({top:'0'},0);
			
			$(info).mouseover(function(){
				var title=$(this).prev('.title-line');
				title.fadeOut(100);
			});
		});
		$(this).mouseleave(function(){
			var title=$(this).children('.title-line');
			var info=$(this).children('.info-line');
			$(info).animate({top:'290px'},0,title.fadeIn(100));
			
		});
	});
}

function bookdate(){
	$('#_j_datepicker_1').bind('blur',function(){
		
		$('#laydate_box').bind('mouseout',function(){
			var selectdate=$('#_j_datepicker_1').val();
			var array=selectdate.split('-');
			var selectyear=parseInt(array[0]);
			var selectmonth=parseInt(array[1]);
			var selectday=parseInt(array[2]);
			
			var date=new Date();
			var nowyear=date.getFullYear();
			var nowmonth=date.getMonth()+1;
			var nowday=date.getDate();
			
			
			
			if(selectyear<=nowyear&&selectmonth<=nowmonth&&selectday<nowday){
				var nextdate=new Date(nowyear,nowmonth-1,nowday+1);
				var nextyear=nextdate.getFullYear();
				var nextmonth=nextdate.getMonth()+1;
				var nextday=nextdate.getDate();
				alert('选择的日期不能小于当前日期！');
				var monstr=nowmonth<10?('0'+nowmonth):nowmonth;
				var daystr=nowday<10?('0'+nowday):nowday;
				var nextstr=nextmonth<10?('0'+nextmonth):nextmonth;
				var nextdays=nextday<10?('0'+nextday):nextday;
				$('#_j_datepicker_1').val(nowyear+'-'+monstr+'-'+nowday);
				$('#_j_datepicker_2').val(nextyear+'-'+nextstr+'-'+nextdays);
				$('#_j_nightnum').html(1);
				$('.d-total').css('display','block');
				$('.d-add').css('display','block');
				return;
			}
			
			var nextdate=new Date(selectyear,selectmonth-1,selectday+1);
			var nextyear=nextdate.getFullYear();
			var nextmonth=nextdate.getMonth()+1;
			var nextday=nextdate.getDate();
			
			var nextstr=nextmonth<10?('0'+nextmonth):nextmonth;
			var nextdays=nextday<10?('0'+nextday):nextday;
			$('#_j_datepicker_2').val(nextyear+'-'+nextstr+'-'+nextdays);
			$('#_j_nightnum').html(1);
			$('.d-total').css('display','block');
			$('.d-add').css('display','block');
			$('.hotelpay').css('display','block');
			
		});
	});
	$('#_j_adddate').bind('click',function(){
		var out=$('#_j_datepicker_2').val();
		var array=out.split('-');
		var outyear=parseInt(array[0]);
		var outmonth=parseInt(array[1]);
		var outday=parseInt(array[2]);
		
		var newdate=new Date(outyear,outmonth-1,outday+1);
		var newyear=newdate.getFullYear();
		var newmonth=newdate.getMonth()+1;
		var newday=newdate.getDate();
		var newstr=newmonth<10?('0'+newmonth):newmonth;
		var newdays=newday<10?('0'+newday):newday;
		$('#_j_datepicker_2').val(newyear+'-'+newstr+'-'+newdays);
		var newCount=parseInt($('#_j_nightnum').html())+1;
		$('#_j_nightnum').html(newCount);
		if(newCount>=2){
			$('.d-sub').css('display','block');
		}
		
		var price=parseInt($('.hotelprice').html());
		$('.totalcost').html(price*newCount);
		
	});
	$('.d-sub').bind('click',function(){
		var out=$('#_j_datepicker_2').val();
		var array=out.split('-');
		var outyear=parseInt(array[0]);
		var outmonth=parseInt(array[1]);
		var outday=parseInt(array[2]);
		
		var newdate=new Date(outyear,outmonth-1,outday-1);
		var newyear=newdate.getFullYear();
		var newmonth=newdate.getMonth()+1;
		var newday=newdate.getDate();
		var newstr=newmonth<10?('0'+newmonth):newmonth;
		var newdays=newday<10?('0'+newday):newday;
		$('#_j_datepicker_2').val(newyear+'-'+newstr+'-'+newdays);
		var newCount=parseInt($('#_j_nightnum').html())-1;
		$('#_j_nightnum').html(newCount);
		if(newCount<2){
			$('.d-sub').css('display','none');
		}
		var price=parseInt($('.hotelprice').html());
		$('.totalcost').html(price*newCount);
	});
}
