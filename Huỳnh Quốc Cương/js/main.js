// Gửi Hình Ảnh Để Tạo Slide
var images = new Array("../image/slider/01.png", "../image/slider/02.png", "../image/slider/03.png", "../image/slider/04.png", "../image/slider/05.png", "../image/slider/06.png", "../image/slider/07.png", "../image/slider/08.png", "../image/slider/09.png", "../image/slider/10.png", "../image/slider/11.png", "../image/slider/12.png", "../image/slider/13.png", "../image/slider/14.png", "../image/slider/15.png", "../image/slider/16.png");
var index = 0;
var w = 998;
var h = 244;
var lw = w*images.length;

function makeslide(id, src){
	$(id).width(lw);
	$(id).height(h);
	var s = "";
	for(i=0; i<images.length; i++)
		s+="<div style='float:left; width:"+w+"px; height:"+h+"px; background-image:url("+src+images[i]+");'></div>";
	$(id).html(s);
	changeslide(id);
}
function changeslide(id){
	if(index>=images.length){
		index = 1;
		$(id).animate({opacity:.5}, 400);
		$(id).animate({marginLeft:'0px'}, 800);
		//$(id).css('margin-left', '0px');
	}
	else{
		$(id).animate({opacity:.5}, 400);
		$(id).animate({marginLeft:'-'+(index*w)+'px'}, 800);
		index++;
	}
	$(id).animate({opacity:1}, 400);
	setTimeout('changeslide("'+id+'")', 5000);
}