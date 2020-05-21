<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>탭메뉴01 이미지형</title>

<style>
	*{margin:0; padding:0;}
	ul,li{list-style:none} 
	.tab{overflow:hidden} 
	.tab li{float:left;width:168px;border:1px solid #fff; cursor:pointer;} 
	.tab li a{display:block;width:100%;height:50px;line-height:50px;text-align:center;} 
	.wrap{position:relative;width:336px;height:420px;border:1px solid red;} 
	.wrap div{position:absolute;left:0;top:0;} 
	.wrap div:nth-child(2){display:none} 
	.wrap div:nth-child(3){display:none} 
	.wrap div:nth-child(4){display:none} 
	.wrap span {display: block; margin: 15px 0 0 10px; top:20px}
	.wrap ul {float:left; width: 336px; position:fixed; top:450px;  }
	.wrap ul li {float:left; width: 150px; color:gray; font-size: 12px; }
	.close {text-align: right;}
	.del{margin-left: 13px;}
	.box2 {border:1px solid pink; display: block; float: right; height: 9px;}
	
</style>

<script>
$(function(){
    $('.tab li').click(function(){
        var tabType = $(this).index();
            $('.tab li').each(function(index){
            $(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off','_on'));
            if(tabType != index){
                $(this).find('img').attr('src', $(this).find('img').attr('src').replace('_on','_off'));
            }
        });
            $('.wrap>div').eq(tabType).show().siblings('div').hide();
    });
 });
</script>

</head>

<body>

	
				<ul class="tab"> 
                    <li><img alt="" src="../img/btn1.png"></li> 
                    <li><img alt="" src="../img/btn2.png"></li> 
                   
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
                     <li class="del"><img src="../img/trash.png"></img>전체삭제</li>
                     <li class="close">닫기</li>
                    </ul>
                    </div>
                   
                </div>
</body>
</html>
