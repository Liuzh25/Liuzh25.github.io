{# 鼠标点击特效 #}
{% if theme.cursor_effect.enabled and not is_index %}
  {% if theme.cursor_effect.fairyDustCursor %}
	<script src="/js/cursor/fairyDustCursor.js"></script>
  {% endif %}
  {% if theme.cursor_effect.type == "fireworks" %}
    <script src="/js/cursor/fireworks.js"></script>
  {% elseif theme.cursor_effect.type == "explosion" %}
    <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas>
    <script src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script>
    <script src="/js/cursor/explosion.min.js"></script>
  {% elseif theme.cursor_effect.type == "love" %}
    <script src="/js/cursor/love.min.js"></script>
  {% elseif theme.cursor_effect.type == "text" %}
    <script src="/js/cursor/text.js"></script>
  {% endif %}
{% endif %}


{# 雪花飘落特效 #}
{% if theme.snow.enabled and not is_index %}
  {% if theme.snow.type == "hexo" %}
	<script type="text/javascript">
	  var windowWidth = $(window).width();
	  if (windowWidth > 480) {
		document.write('<script type="text/javascript" src="/js/src/hexo.js"><\/script>');
	  }
	</script>
  {% elseif theme.snow.type == "circle" %}}
	<script type="text/javascript">
	  var windowWidth = $(window).width();
	  if (windowWidth > 480) {
		document.write('<script type="text/javascript" src="/js/src/circle.js"><\/script>');
	  }
	</script>
  {% elseif theme.snow.type == "sakura" %}}
    <script type="text/javascript" src="/js/src/sakura.js"><\/script>
  {% endif %}
{% endif %}

<script></script>





