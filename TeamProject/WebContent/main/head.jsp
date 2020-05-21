<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>땅땅땅 - 신개념 쇼핑의 시작</title>
		<link rel="icon" type="image/png" sizes="32x32" href="../img/favicon.png">
		<link href="../css/default.css" rel="stylesheet" type="text/css">
		<link href="../css/font/NotoSansKR.css" rel="stylesheet" type="text/css">
		<script src="../js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('.btn_more').click(function(){
					var more_menu = $('.header_more_menu'),
						search_tab = $('.search_tab');
					
					if(!more_menu.hasClass('show') || search_tab.hasClass('show')) {
						search_tab.removeClass('show');
						more_menu.animate({top:59}, 300).addClass('show');
						$('.back_drop').css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 100);
					} else if(more_menu.hasClass('show')) {
						more_menu.animate({top:-350}, 300).removeClass('show');
						$('.back_drop').css('display', 'none');
					}
				});
				
				$('.txt_search').click(function(){
					var more_menu = $('.header_more_menu'),
						search_tab = $('.search_tab');

					if(!search_tab.hasClass('show')) {
						if(more_menu.hasClass('show')) {
							more_menu.animate({top:-350}, 300).removeClass('show');
							$('.back_drop').css('display', 'none');
						}
						
						search_tab.addClass('show');
						$('.back_drop').css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 100);
					}
				});
				
				// 어두운 영역 클릭 시 띄워져 있는 폼 닫기
				$('.back_drop').click(function(){
					var more_menu = $('.header_more_menu'),
						search_tab = $('.search_tab');

					if(more_menu.hasClass('show') === true) {
						more_menu.animate({top:-350}, 300).removeClass('show');
					} else if(search_tab.hasClass('show') === true) {
						search_tab.removeClass('show');
					}
					
					$('.back_drop').css('display', 'none');
				});
			});
		</script>
	</head>
	<body>
		<div class="back_drop"></div>
		<header>
			<div class="header_wrap">
				<div class="logo"><a href="../main/index.jsp"><img src="../img/logo.png"></a></div>
				<nav>
					<ul>
						<li><a href="#">실시간경매</a></li>
						<li><a href="#">베스트상점</a></li>
						<li><a href="#">땅땅샵</a></li>
						<li class="btn_more">더보기</li>
					</ul>
				</nav>
				<div class="btn_header">
					<!-- 비회원일 때 땅땅땅 이용방법 / 회원일 때 출품하기 -->
					<a href="#"><button>땅땅땅 이용방법</button></a>
				</div>
				<div class="member_section">
					<!-- 비회원일 때 로그인, 짧은회원가입 / 회원일 때 나의경매장 -->
					<span><a href="#">로그인</a></span>
					<span><a href="#">짧은회원가입</a></span>
				</div>
				<div class="search">
					<input type="text" class="txt_search" name="keyword" placeholder="어떤 상품을 찾고 계신가요?">
				</div>
				<div class="search_tab">
					<jsp:include page="../main/search_tab.jsp" />
				</div>
			</div>
		</header>
		<div class="more_wrap">
			<div class="header_more_menu">
				<div class="menu_list">
					<span class="menu_subject">바로가기</span>
					<a href="#">키워드알림</a>
					<a href="#">시세조회</a>
					<a href="#">땅땅톡</a>
					<a href="#">참여내역</a>
				</div>
				<div class="menu_list">	
					<span class="menu_subject">안전거래</span>
					<a href="#">출품하기</a>
					<a href="#">신고하기</a>
					<a href="#">신고조회</a>
					<a href="#">주문내역</a>
				</div>
				<div class="menu_list">
					<span class="menu_subject">고객센터</span>
					<a href="#">공지사항</a>
					<a href="https://pf.kakao.com/_PPxoNxb" target="_blank">문의하기</a>
					<a href="#">자주묻는질문</a>
					<a href="#">마이페이지</a>
				</div>
				<div id="category">
					<span><a href="#">의류</a></span>
					<span><a href="#">앤티크</a></span>
					<span><a href="#">명품</a></span>
					<span><a href="#">연예</a></span>
					<span><a href="#">전자기기</a></span>
					<span><a href="#">가전제품</a></span>
					<span><a href="#">도서</a></span>
					<span><a href="#">스포츠</a></span>
					<span><a href="#">뷰티</a></span>
				</div>
			</div>
		</div>
		<section>
			<article>
