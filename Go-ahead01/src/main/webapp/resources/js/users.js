/**
 * 
 */
 $(function () {
    $(".popup_box").draggable({ containment: "parent", scroll: false }); // 레이어 팝업 창 드래그 가능
    //{containment:'parent', scroll:false} 화면 영역 밖으로 드래그 안됌.

    if (document.cookie.indexOf("popToday=close") < 0) {
        // 쿠키 저장여부 체크
        document.getElementById("popup_layer").style.display = "block";
    } else {
        document.getElementById("popup_layer").style.display = "none";
    }
});

//오늘하루만보기 닫기버튼 스크립트
function closeToday() {
    setCookie("popToday", "close", 1);
    $("#popup_layer").css("display", "none");
    document.getElementById("popup_layer").style.display = "none";
}
//그냥 닫기버튼 스크립트
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
}


 