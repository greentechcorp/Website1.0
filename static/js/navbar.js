var footerExist = document.getElementById("contact");
var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
var currentScrollPos = window.pageYOffset;
if (prevScrollpos > currentScrollPos) {
    document.getElementById("nav").style.top = "0";
    if (footerExist){
        document.getElementById("contact").style.bottom = "-50px";
    }
} 
else {
    if (footerExist){
        document.getElementById("contact").style.bottom = "0";
    }
    document.getElementById("nav").style.top = "-50px";
}
prevScrollpos = currentScrollPos;
}