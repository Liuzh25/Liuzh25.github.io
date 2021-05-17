var OriginTitile = document.title;
var titleTime;
document.addEventListener('visibilitychange', function () {
    if (document.hidden) {
        $('[rel="shortcut icon"]').attr('href', "/TEP.png");
        document.title = '程序已暂停';
        clearTimeout(titleTime);
    }
    else {
        $('[rel="shortcut icon"]').attr('href', "/favicon.png");
        document.title = '程序运行中 ' + OriginTitile;
        titleTime = setTimeout(function () {
            document.title = OriginTitile;
        }, 2000);
    }
});