<%@page import="java.sql.Timestamp"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../main/head.jsp" />

<link rel="stylesheet" href="../css/item.css">
<script src="../js/jquery.number.min.js"></script>
	
<%
// 	전달받은 request 객체로부터 데이터 가져오기
// 	"pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
// 	"pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
ArrayList<ItemBean> articleList = (ArrayList<ItemBean>)request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");

int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();

ItemBean itemBean = new ItemBean();

String name = itemBean.getName();
Timestamp writeTime = itemBean.getWriteTime();
String endTime = itemBean.getEndTime();
int startPrice = itemBean.getStartPrice();
int maxPrice = itemBean.getMaxPrice();
int deliveryPrice = itemBean.getDeliveryPrice();
String content = itemBean.getContent();
String category = itemBean.getCategory();
String thumbnail = itemBean.getThumbnail();
%>  

<script type="text/javascript">
	/* UI Pattern Script */
	/* //UI Pattern Script */
</script>

<style>
.fixed_img_row {
	width: 550px;
	height: 200px;
	float:left;
}

.fixed_img_row ul {
	width:1115px;
}

.fixed_img_row .desc {
	width:550px;
	position: relative;
	margin: 0 0 -1px 0;
	padding: 15px 0;
	border: 1px solid #eee;
	float:left;
}

.fixed_img_row .desc .subject {
	font-size:16px;
	line-height:35px;
	letter-spacing:-0.4px;
	color:#333;
}

.fixed_img_row .desc .subject:hover {
	color:#0654ba;
}

.fixed_img_row .desc .member_info {
	position:absolute;
	top:0;
	right:0;
	width:150px;
	height:152px;
	padding:15px;
	border-left:1px solid #eee;
}

.fixed_img_row .desc:nth-child(odd) {
	margin-right:15px;
}

.fixed_img_row .desc:after {
	display: block;
	clear: both;
	content: ""
}

.fixed_img_row .thumb {
	display: inline;
	overflow: hidden;
	float: left;
	position: relative;
	width: 120px;
	margin:0 15px;
	background: #eee;
	color: #666;
	line-height: 80px;
	text-align: center;
}

.fixed_img_row .thumb img {
	display: block;
}

.fixed_img_row .thumb em {
	visibility: hidden;
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 1px;
	margin: -90px 0 0 0;
	background: #000;
	font-weight: bold;
	font-style: normal;
	color: #fff;
	text-align: center;
	opacity: .6;
	filter: alpha(opacity = 60)
}

.fixed_img_row .thumb em {
	_visibility: visible;
	_top: 0;
	_width: 100%;
	_height: auto;
	_margin: 0;
	_line-height: 20px
}

.fixed_img_row p {
	color: #767676;
}

.fixed_img_row a:hover .thumb em,
.fixed_img_row a:active .thumb em,
.fixed_img_row a:focus .thumb em {
	visibility: visible;
	width: 100%;
	height: auto;
	line-height: 180px
}

.list_side_tab {
	width: 150px;
	padding: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}
.list_side_tab ul:not(:first-child) {
	border-top:1px solid #eee;
	margin-top:15px;
	padding-top:15px;
}
.list_side_tab li {
	font-size:13px;
}
.list_side_tab .title {
	font-size:14px;
	font-weight:bold;
	color:#333;
	letter-spacing:-1px;
	margin-bottom:10px;
}
.list_side_tab a {
	display:block;
	line-height:25px;
}
.list_side_tab input[type=text] {
	padding:3px 5px;
	width:47px;
	display:inline-block;
}
.list_side_tab .search_price {
	background:#fc5230;
	border:1px solid #ec4524;
	color:#FFF;
	margin-top:5px;
	text-align:center;
}
</style>

<div class="item_list">
	<div class="title">실시간경매 목록</div>
	
	<div class="fixed_img_row">
		<ul>
			<% for(int i=0; i<articleList.size(); i++) { %>
			<li class="desc">
				<a href="view.it?no=<%=articleList.get(i).getNo() %>&page=<%=nowPage %>">
					<span class="thumb">
						<img src="../upload/<%=articleList.get(i).getThumbnail() %>" width="120">
						<em>상품 보기</em>
					</span>
					<span class="subject"><%=articleList.get(i).getName() %></span>
				</a>
				<p><%=articleList.get(i).getCategory() %></p>
				<p><%=articleList.get(i).getWriteTime() %></p>
				<p>시작가 : <span class="price_formatting"><%=articleList.get(i).getStartPrice() %></span></p>
				<span class="member_info"><a href="상점주소"><%=articleList.get(i).getMemberID() %></a></span>
			</li>
			<% } %>
		</ul>
		
		<div class="tail">
			<a href="write.it"><button>출품하기</button></a>
		</div>
	</div>
	
	<div class="list_side_tab">
		<ul>
			<li class="title">카테고리</li>
			<li><a href="">의류</a></li>
			<li><a href="">앤티크</a></li>
			<li><a href="">명품</a></li>
			<li><a href="">연예</a></li>
			<li><a href="">전자기기</a></li>
			<li><a href="">가전제품</a></li>
			<li><a href="">도서</a></li>
			<li><a href="">스포츠</a></li>
			<li><a href="">뷰티</a></li>
		</ul>
		<ul>
			<li><a href="">무료배송</a></li>
		</ul>
		<ul>
			<li class="title">가격대</li>
			<li>
				<input type="text" placeholder="최소가"> ~ <input type="text" placeholder="최대가">
				<a href="" class="search_price">검색</a>
			</li>
		</ul>
		<ul>
			<li><a href="">내 상품보기</a></li>
		</ul>
	</div>
	
	<!-- <div id="buttonArea"> -->
	<!-- 	<input type="button" value="글쓰기" onclick="location.href='write.it'" /> -->
	<!-- </div> -->
	
	<!-- <div id="pageList"> -->
	<%-- 	<% if(nowPage <= 1) { %> --%>
	<!-- 		<input type="button" value="이전">&nbsp; -->
	<%-- 	<% } else { %> --%>
	<%-- 		<input type="button" value="이전" onclick="location.href='list.it?page=<%=nowPage - 1 %>'">&nbsp; --%>
	<%-- 	<% } %> --%>
	<%-- 	<% for(int i=startPage; i<=endPage; i++) {  --%>
	<%-- 		if(i == nowPage) { %>  --%>
	<%-- 		[<%=i %>]&nbsp; --%>
	<%-- 		<% } else { %> --%>
	<%-- 			<a href="list.it?page=<%=i %>">[<%=i %>]</a>&nbsp; --%>
	<%-- 		<% } %> --%>
	<%-- 	<% } %> --%>
		
	<%-- 	<% if(nowPage >= maxPage) { %> --%>
	<!-- 		<input type="button" value="다음"> -->
	<%-- 	<% } else { %> --%>
	<%-- 		<input type="button" value="다음" onclick="location.href='list.it?page=<%=nowPage + 1 %>'"> --%>
	<%-- 	<% } %> --%>
	<!-- </div> -->
	
	<!--
	} else { 
	<div id="emptyArea">등록된 글이 없습니다</div>
	}
	-->
</div>

<script type="text/javascript">
$(function() {
	$('.price_formatting').number(true);
});
</script>

<jsp:include page="../main/tail.jsp" />
