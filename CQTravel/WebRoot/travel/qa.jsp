<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="com.bean.Question" %>
<%
	User user=(User)session.getAttribute("user");
	UserInfo us=null;
	String nickname=null;
	String headpic=null;
	if(user!=null){
		us=user.getProperty();
		nickname=us.getNickname();
		headpic=us.getHeadpicture();
	}
	
	ArrayList<Question> hot=Question.getHotQuestionList();
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>旅游问答，解决旅行问题，旅游信息的分享平台</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../js/question.js" ></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			stylejs();
			login();
			loginsubmit();
			dropmenu();
			hotquestion();
			groupquestion();
			loadmore();
		});
	</script>
	
</head>
<body>
	<div class="loginbg" style="display:none;"></div>
	<div class="loginbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>登录</h3>
     	</div>

     	<div class="loginnav">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>在这里你可以查找攻略，分享旅行，结识朋友</p>
	            <div class="login-input">
	                <input id="lpassport" name="passport" placeholder="您的邮箱/手机号" autocomplete="off" class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input id="lpassword" name="password" placeholder="您的密码" autocomplete="off" class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="loginsubmit" value="登录" type="button">
	                <span><a href="/forget">忘记密码?</a></span>
	            </div>

	     	</form>
     	</div>
     	<div class="regist-link">还没有注册？<a href="/regist.html">立即注册&gt;&gt;</a></div>
	</div>
	<div id="header">
		<div class="myheader">
			
			<div class="header-wrap clearfix">
				<div class="logo">
					<a title="重庆旅游" href="../index.jsp"><img class="logo-l" src="../images/logo.jpg"></a>
				</div>
				
				<ul id="head-nav" class="head-nav">
					
					
                	<li class="head-nav-index "><a href="../index.jsp">首页</a></li>
               		<li class="head-nav-place"><a href="destination.jsp" title="目的地">目的地</a></li>
                	<li class="head-nav-gonglve"><a href="hotel.jsp" title="酒店推荐">酒店推荐</a></li>
                	<li class="head-nav-sales head-nav-dropdown _j_sales_nav_show" id="_j_nav_sales">
                    	<a class="drop-toggle" href="view.jsp"title="旅游景点">
                        	旅游景点
                    	</a>
                	</li>
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show head-nav-active" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

				</ul>
				
				<% if(user==null){ %>
				<div class="login-out">
					<a id="_j_showlogin" title="登录蚂蜂窝" href="javascript:;" rel="nofollow">登录</a>
					<span class="split">|</span>
					<a href="register.jsp" title="注册帐号" rel="nofollow">注册</a>
				</div>
					<% } else { %>
				<div class="login-info">
					<div class="head-user" id="_j_head_user">
                        <a class="drop-trigger" href="personalinfo.jsp" title="<%=nickname %>的窝" rel="nofollow">
                            <div class="user-image">
                            	<img src="../<%=headpic %>" alt="<%=nickname %>的窝" height="32" width="32">
                            </div>
                            
                            <i class="icon-caret-down"></i>
                        </a>
                    </div>
                    
                    <div class="head-msg" id="_j_head_msg">
                        <a class="drop-trigger" href="javascript:" rel="nofollow">
                            <i class="icon-msg"></i>
                           		 消息
                            <i class="icon-caret-down"></i>
                            <span style="display: none;" class="head-msg-new hide"></span>
                        </a>
                    </div>
				</div>
					<% } %>
			
			</div>

			<div class="dropdown-group">
				<div class="dropdown-menu dropdown-msg hide" id="_j_msg_panel" style="z-index: 10; display: none;">
	                <ul>
	                    
						<li><a href="personalmsg.jsp" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="sysmsg.jsp" target="_blank" rel="nofollow">系统通知</a></li>
						<li><a href="" target="_blank" rel="nofollow">问答消息</a></li>
	
	                </ul>
	            </div>
	            
	            <div style="display: none;" class="dropdown-menu dropdown-user hide" id="_j_user_panel" data-cs-t="user_nav">
	                <ul>
	                    <li><a href="personalinfo.jsp" target="_blank" title="我的窝" rel="nofollow" data-cs-p="wo"><i class="icon-wo"></i>我的窝<span class="level">LV.1</span> </a></li>
	                    <li><a href="writenote.jsp" target="_blank" class="drop-write" title="写游记" rel="nofollow" data-cs-p="writenotes"><i class="icon-writenotes"></i>写游记</a></li>
	                    <li><a href="myqa.jsp" target="_blank" title="我的问答" rel="nofollow" data-cs-p="wenda"><i class="icon-wenda"></i>我的问答</a></li>
	                    <li><a href="myfriend.jsp" target="_blank" title="我的好友" rel="nofollow" data-cs-p="friend"><i class="icon-friend"></i>我的好友</a></li>
	                    <li><a href="myorder.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>

	</div>


	<div class="wrap">
		
		<div class="col-main">
			<div class="i-main">

				<div class="search">
				
					<div class="search-panel">
					    <div class="hd clearfix _j_suggest_hd">
					        <div class="sp-input">
					            <input class="_j_suggest" placeholder="提问前请先搜索，看看你的问题其他蜂蜂是否已经问过" type="text">
					        </div>
					        <div class="sp-button">
					            <input class="_j_search clickstat" data-cs-p="suggest_goto_search" type="button">
					        </div>
					    </div>
					    <div class="bd _j_suggest_box" style="display: none;"></div>
					</div>
				</div>

				<div class="i-tj">
					<h2><span>每个人的旅行都是独1无2的，让靠谱又有爱的蚂蜂窝帮助你</span>热门问题</h2>

					<ul class="_j_elite">
						<% for(Question q:hot){
						 %>
						 	 <li class="">
	                  			<a href="qadetail.jsp?qid=<%=q.getId() %>" target="_blank">
		                        	<div class="i_tj_tit"><%=q.getTitle() %></div>
		            				<dl class="i_tj_js">
							            <dt>
							                <strong><%=q.getReply() %></strong><span>回答</span>
							            </dt>
							            <dd>
							                <p><%=q.getTitle() %></p>
							                <div class="i_tj_con"><%=q.getContent()%></div>
							            </dd>
							        </dl>
	            				</a>
	            			</li>
						 <% } %>
                        <li class="on">
                  			<a href="qadetail.jsp" target="_blank" data-cs-p="hot_question">
	                        	<div class="i_tj_tit">TVB粉求问，如何拍到与香港警察蜀黍的合影照？</div>
	            				<dl class="i_tj_js">
						            <dt>
						                <strong>442</strong><span>回答</span>
						            </dt>
						            <dd>
						                <p>TVB粉求问，如何拍到与香港警察蜀黍的合影照？</p>
						                <div class="i_tj_con">我暑假想去香港，去香港能和警察合影吗？</div>
						            </dd>
						        </dl>
            				</a>
            			</li>

                        <li class="">
                  			<a href="/wenda/detail-3044257.html" target="_blank" data-cs-p="hot_question">
	                        	<div class="i_tj_tit">TVB粉求问，如何拍到与香港警察蜀黍的合影照？</div>
	            				<dl class="i_tj_js">
						            <dt>
						                <strong>442</strong><span>回答</span>
						            </dt>
						            <dd>
						                <p>TVB粉求问，如何拍到与香港警察蜀黍的合影照？</p>
						                <div class="i_tj_con">我暑假想去香港，去香港能和警察合影吗？</div>
						            </dd>
						        </dl>
            				</a>
            			</li>
            			<li class="">
                  			<a href="/wenda/detail-3044257.html" target="_blank" data-cs-p="hot_question">
	                        	<div class="i_tj_tit">TVB粉求问，如何拍到与香港警察蜀黍的合影照？</div>
	            				<dl class="i_tj_js">
						            <dt>
						                <strong>442</strong><span>回答</span>
						            </dt>
						            <dd>
						                <p>TVB粉求问，如何拍到与香港警察蜀黍的合影照？</p>
						                <div class="i_tj_con">我暑假想去香港，去香港能和警察合影吗？</div>
						            </dd>
						        </dl>
            				</a>
            			</li>
                    </ul>
				</div>


			</div>	


			<div class="cate-wrap">
				
				<div class="hd">
            		<ul class="cate-tab">
                        <li class="on">
                        	<a href="###" class="_j_change_list _j_type i_wt1" href="" data-type="0" data-mddid="0" data-tid="0" data-cs-p="index_type_hot" data-cs-l="index">所有问题</a>
                        </li>

                        <li class="">
                        	<a href="###" class="_j_change_list _j_type i_wt6" href="" data-type="5" data-mddid="0" data-tid="0" data-cs-p="index_type_goldanswer" data-cs-l="index">金牌回答</a>
                        </li>

                        <li class="">
                			<a href="###" class="_j_change_list _j_type i_wt5" href="" data-type="4" data-mddid="0" data-tid="0" data-cs-p="index_type_useful" data-cs-l="index">最多有用</a>
                		</li>
                        <li class="">
                			<a href="###" class="_j_change_list _j_type i_wt2" href="" data-type="1" data-mddid="0" data-tid="0" data-cs-p="index_type_new" data-cs-l="index">最新问题</a>
                		</li>
                        <li class="">
                			<a href="###" class="_j_change_list _j_type i_wt3" href="" data-type="2" data-mddid="0" data-tid="0" data-cs-p="index_type_noanswer" data-cs-l="index">待回答问题</a>
                		</li>
                    </ul>
        		</div>

				<div class="bd">
					<ul class="_j_pager_box">
						
						<li class="item clearfix _j_question_item">
    						<div class="wen">
						        <div class="label">
						            <span class="avatar avatar32">
						            	<a href="/wenda/u/88971262.html" class="_j_filter_click" target="_blank">
						                	<img class="_j_filter_click" src="http://file27.mafengwo.net/M00/28/A0/wKgB6lOxZpqAXwHBAAAPu_G3RtM11.head.w48.jpeg" height="32" width="32">
						                </a>
						            </span>
						            <span class="icon icon-gl"></span>
						        </div>
						        <div class="title">
						            <a href="/wenda/detail-6491062.html" class="_j_filter_click" target="_blank">#香港#荃湾的如心如何去海洋公园。</a>
						        </div>
						    </div>

    						<div class="da">
                				<div class="label">
						            <span class="avatar avatar48">
						            	<a href="/wenda/u/92597770.html" target="_blank" class="_j_filter_click">
						            		<img class="_j_filter_click" src="http://file32.mafengwo.net/M00/17/7F/wKgBs1cWI92AARW6AABYqWQkK_860.head.w48.jpeg" height="48" width="48">
						            	</a>
						            </span>
						            <span class="icon icon-da"></span>
						        </div>
        						<div class="user">
						            <a class="name _j_filter_click" href="/wenda/u/92597770.html" target="_blank">阿茜麦</a>
						            <a class="level _j_filter_click" href="/rank/lv.php?uid=92597770" target="_blank">LV.13</a>
						            <div class="usertitle"></div>
						        </div>
                				<div class="desc">
                                    <p>有以下两种方案：路线1：从如心海景酒店步行至港铁荃湾西站，乘坐地铁到美孚站换乘至金钟站，出闸后往B出口转乘香港海洋公园的专车巴士629线。线路2： 从酒店步行到荃湾公园，乘巴士930直接...</p>
                    			</div>
    						</div>
						    <div class="tags">
						        <a class="a-tag _j_filter_click" href="/wenda/area-10189.html" target="_blank">香港</a>
						        <a class="a-tag _j_filter_click" href="/wenda/tag-1310.html" target="_blank">海洋公园</a>
						        <a class="a-tag _j_filter_click" href="/wenda/tag-1298.html" target="_blank">交通</a>
						    </div>

    						<div class="info clearfix">
						        <ul class="">
						            <li>
						                <span class="time">42分钟前</span>
						            </li>
						            <li><a>有用 (2)</a></li>
						            <li><a>同问 (0)</a></li>
						            <li>回答 (4)</li>
						            <li>
						                <a>浏览 (60)</a>
						            </li>
						        </ul>
             					
    						</div>
						</li>


						<li class="item clearfix _j_question_item">
    						<div class="wen">
						        <div class="label">
						            <span class="avatar avatar32">
						            	<a href="/wenda/u/88971262.html" class="_j_filter_click" target="_blank">
						                	<img class="_j_filter_click" src="http://file27.mafengwo.net/M00/28/A0/wKgB6lOxZpqAXwHBAAAPu_G3RtM11.head.w48.jpeg" height="32" width="32">
						                </a>
						            </span>
						            <span class="icon icon-gl"></span>
						        </div>
						        <div class="title">
						            <a href="/wenda/detail-6491062.html" class="_j_filter_click" target="_blank">#香港#荃湾的如心如何去海洋公园。</a>
						        </div>
						    </div>

    						<div class="da">
                				<div class="label">
						            <span class="avatar avatar48">
						            	<a href="/wenda/u/92597770.html" target="_blank" class="_j_filter_click">
						            		<img class="_j_filter_click" src="http://file32.mafengwo.net/M00/17/7F/wKgBs1cWI92AARW6AABYqWQkK_860.head.w48.jpeg" height="48" width="48">
						            	</a>
						            </span>
						            <span class="icon icon-da"></span>
						        </div>
        						<div class="user">
						            <a class="name _j_filter_click" href="/wenda/u/92597770.html" target="_blank">阿茜麦</a>
						            <a class="level _j_filter_click" href="/rank/lv.php?uid=92597770" target="_blank">LV.13</a>
						            <div class="usertitle"></div>
						        </div>
                				<div class="desc">
                                    <p>有以下两种方案：路线1：从如心海景酒店步行至港铁荃湾西站，乘坐地铁到美孚站换乘至金钟站，出闸后往B出口转乘香港海洋公园的专车巴士629线。线路2： 从酒店步行到荃湾公园，乘巴士930直接...</p>
                    			</div>
    						</div>
						    <div class="tags">
						        <a class="a-tag _j_filter_click" href="/wenda/area-10189.html" target="_blank">香港</a>
						        <a class="a-tag _j_filter_click" href="/wenda/tag-1310.html" target="_blank">海洋公园</a>
						        <a class="a-tag _j_filter_click" href="/wenda/tag-1298.html" target="_blank">交通</a>
						    </div>

    						<div class="info clearfix">
						        <ul class="">
						            <li>
						                <span class="time">42分钟前</span>
						            </li>
						            <li><a>有用 (2)</a></li>
						            <li><a>同问 (0)</a></li>
						            <li>回答 (4)</li>
						            <li>
						                <a>浏览 (60)</a>
						            </li>
						        </ul>
             					
    						</div>
						</li>



					</ul>
				</div>

				<div class="_j_pager">
					<div class="ft ft_load_btn">
						<div class="answer-more">
							<a rel="nofollow" class="_j_page_loader _j_loading_elem" href="javascript:void(0);" data-index="1" >加载更多<i></i>
							</a>
						</div>
					</div>

					<div class="ft hide ft_loading">
						<div class="answer-loading">正在加载<i></i>
						</div>
					</div>
				</div>



			</div>		
			
		</div>

		<div class="col-side">
			
			<div class="i-ask">
		        <a href="writequestion.jsp" class="btn-ask btn-ask2"><i></i>我要提问</a>
		    </div>

		    <dl class="i-tags tag-area">
		    	
		    	<dt>问答热门地区</dt>
				<dd class="clearfix">
            		<div class="label">境外</div>
            			<ul class="_j_open_mdd_list">
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                                
                            <li>
                            	<a href="javascript:void(0);" data-state="0" class="more_selector _j_mdd_see_more" >更多</a>
                            </li>

                        </ul>
        			</dd>

        			<dd class="clearfix">
            		<div class="label">境内</div>
            			<ul class="_j_open_mdd_list">
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href=""title="香港" >香港<em>22961</em></a>
                            </li>

                            <li class="_j_open_mdd_item">
                            	<a class="_j_change_list _j_change_mdd" href="" title="台湾">台湾<em>34687</em></a>
                            </li>
                                
                            <li>
                            	<a href="javascript:void(0);" data-state="0" class="more_selector _j_mdd_see_more" >更多</a>
                            </li>

                        </ul>
        			</dd>

		    </dl>
		</div>
	</div>	


	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>

</html>
