function changePic(picid){
	var d = document.getElementById(picid);
	if(picid=="img1")
	   d.src = "img/1-1.jpg";
	if(picid=="img2")
	   d.src = "img/2-2.jpg";
	if(picid=="img3")
	   d.src = "img/4-4.jpg";
	if(picid=="img4")
	   d.src = "img/3-3.jpg";
	if(picid=="img5")
	   d.src = "img/5-5.jpg";
}

function recoverPic(picid){
	var d = document.getElementById(picid);
	if(picid=="img1")
	   d.src = "img/1.jpg";
	if(picid=="img2")
	   d.src = "img/2.jpg";
	if(picid=="img3")
	   d.src = "img/4.jpg";
	if(picid=="img4")
	   d.src = "img/3.jpg";
	if(picid=="img5")
	   d.src = "img/5.jpg";
}

function displayWord1(){
	var d=document.getElementById("word1");
	d.style.visibility="visible";
}

function hiddenWord1(){
	var d = document.getElementById("word1");
	d.style.visibility="hidden";
}

function displayWord2(){
	var d=document.getElementById("word2");
	d.style.visibility="visible";
}

function hiddenWord2(){
	var d = document.getElementById("word2");
	d.style.visibility="hidden";
}

function displayWord3(){
	var d=document.getElementById("word3");
	d.style.visibility="visible";
}

function hiddenWord3(){
	var d = document.getElementById("word3");
	d.style.visibility="hidden";
}

function displayWord4(){
	var d=document.getElementById("word4");
	d.style.visibility="visible";
}

function hiddenWord4(){
	var d = document.getElementById("word4");
	d.style.visibility="hidden";
}

function displayWord5(){
	var d=document.getElementById("word5");
	d.style.visibility="visible";
}

function hiddenWord5(){
	var d = document.getElementById("word5");
	d.style.visibility="hidden";
}