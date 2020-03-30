var footer = document.getElementById("contact");
var arrow = document.getElementById("arrow");
var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
var currentScrollPos = window.pageYOffset;
if(currentScrollPos === 0.0){
    document.getElementById("nav").style.display = "none";
}else{
    document.getElementById("nav").style.display = "block";
}
if (prevScrollpos > currentScrollPos) {
    document.getElementById("nav").style.top = "0";
    document.getElementById("navMobile").style.top = "0";
    if (footer){
        footer.style.bottom = "-50px";
    }
    if (arrow){
        arrow.style.visibility = "visible";
    }
} 
else {
    if (footer){
        footer.style.bottom = "0px";
    }
    if (arrow){
        arrow.style.visibility = "hidden";
    }
    // document.getElementById("nav").style.top = "-50px";
    document.getElementById("navMobile").style.top = "-70px";

}
prevScrollpos = currentScrollPos;
}