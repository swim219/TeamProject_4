<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="keyword_tab_show">
	<ul class="tab"> 
		<li>최근</li> 
		<li>인기</li> 
	</ul>
	
	<div class="wrap"> 
		<div>
			<span>최근검색어 1</span>
			<span>최근검색어 2</span>
			<span>최근검색어 3</span>
			<span>최근검색어 4</span>
			<span>최근검색어 5</span>
			<span>최근검색어 6</span>
			<span>최근검색어 7</span>
			<span>최근검색어 8</span>
			<span>최근검색어 9</span>
			<span>최근검색어 10</span>
			<ul>
				<li class="del"><img src="../img/trash.png"></img>전체삭제</li>
				<li class="close">닫기</li>
			</ul>
		</div>
		<div>
			<span>1.인기검색어</span>
			<span>2.인기검색어</span>
			<span>3.인기검색어</span>
			<span>4.인기검색어</span>
			<span>5.인기검색어</span>
			<span>6.인기검색어</span>
			<span>7.인기검색어</span>
			<span>8.인기검색어</span>
			<span>9.인기검색어</span>
			<span>10.인기검색어</span>
			<ul>
				<li></li>
				<li class="close">닫기</li>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$('.tab li').click(function(){
		var tabType = $(this).index();
		
		$('.wrap > div').eq(tabType).show().siblings('div').hide();
	});
});
</script>
