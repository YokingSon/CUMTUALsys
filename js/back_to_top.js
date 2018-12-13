/*var backButton = $('.back_to_top');
function backToTop() {
    $('html,body').animate({
        scrollTop: 0
    }, 800);
}
backButton.on('click', backToTop);

$(window).on('scroll', function () {
    if ($(window).scrollTop() > $(window).height())
        backButton.fadeIn();
    else
        backButton.fadeOut();
});
$(window).trigger('scroll');*/
/*goTop();

function goTop() {

    $(window).scroll(function () {
        var $scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
        if ($scrollTop > 100) {
            $("#goTop").show();
        }
        else {
            $("#goTop").hide();
        };
    })

    $("#goTop").on("click", function () {
        $("body").stop().animate({
            scrollTop: 0
        });
    })
}*/

$(function () {
    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 100) {
                $("#toTop").fadeIn(1500);
            }
            else {
                $("#toTop").fadeOut(1500);
            }
        });
        //当点击跳转链接后，回到页面顶部位置
        $("#toTop").click(function () {
            $('body,html').animate({ scrollTop: 0 }, 1000);
            return false;
        });
    });
});

