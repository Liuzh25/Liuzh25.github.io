{# 标签云 #}
{% if site.tags.length > 1 and theme.tag_cloud.enabled and not is_index %}
<script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcloud.js') }}"></script>
<script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcanvas.js') }}"></script>
<div class="widget-wrap">
	<!--<div style="font-family: 'comic sans ms', courier; font-size: 16px;">Tag Cloud</div>-->
    <div id="myCanvasContainer" class="widget tagcloud">
        <canvas width="250" height="250" id="resCanvas" style="width:100%">
            {{ list_tags() }}
        </canvas>
    </div>
</div>
{% endif %}


{# 心知天气 #}
{% if theme.weather_widget.enabled and not is_index %}
	<div id="tp-weather-widget"></div>
	  <script>
		(function(a,h,g,f,e,d,c,b){b=function(){d=h.createElement(g);c=h.getElementsByTagName(g)[0];d.src=e;d.charset="utf-8";d.async=1;c.parentNode.insertBefore(d,c)};a["SeniverseWeatherWidgetObject"]=f;a[f]||(a[f]=function(){(a[f].q=a[f].q||[]).push(arguments)});a[f].l=+new Date();if(a.attachEvent){a.attachEvent("onload",b)}else{a.addEventListener("load",b,false)}}(window,document,"script","SeniverseWeatherWidget","//cdn.sencdn.com/widget2/static/js/bundle.js?t="+parseInt((new Date().getTime() / 100000000).toString(),10)));
		window.SeniverseWeatherWidget('show', {
		  flavor: "slim",
		  location: "WM7B0X53DZW2",
		  geolocation: true,
		  language: "zh-Hans",
		  unit: "c",
		  theme: "auto",
		  token: "6f2b0ab7-4bda-4cbe-8ee0-50d827246f1c",
		  hover: "disabled",
		  container: "tp-weather-widget"
		})
	  </script>
{% endif %}


{# 运行时间 #}
<div id="days"></div>
    <script>
    function show_date_time(){
        window.setTimeout("show_date_time()", 1000);
        BirthDay=new Date("04/23/2021 23:24:52");
        today=new Date();
        timeold=(today.getTime()-BirthDay.getTime());
        sectimeold=timeold/1000
        secondsold=Math.floor(sectimeold);
        msPerDay=24*60*60*1000
        e_daysold=timeold/msPerDay
        daysold=Math.floor(e_daysold);
        e_hrsold=(e_daysold-daysold)*24;
        hrsold=setzero(Math.floor(e_hrsold));
        e_minsold=(e_hrsold-hrsold)*60;
        minsold=setzero(Math.floor((e_hrsold-hrsold)*60));
        seconds=setzero(Math.floor((e_minsold-minsold)*60));
        document.getElementById('days').innerHTML="已运行"+daysold+"天"+hrsold+"小时"+minsold+"分"+seconds+"秒";
    }
function setzero(i){
    if (i<10)
    {i="0" + i};
    return i;
}
show_date_time();
</script>

