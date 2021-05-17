{# 引用JQ #} 
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/jquery@3/dist/jquery.min.js"></script>

{# 文章加密 #}
<script>
    (function () {
        if ('{{ page.password }}') {
            if (prompt('请输入文章密码') !== '{{ page.password }}') {
                alert('密码错误！');
                if (history.length === 1) {
                    location.replace("http://www.jxxb.top"); // 这里替换成你的首页
                } else {
                    history.back();
                }
            }
        }
    })();
</script>

{# 动态标签名 #}
<script type="text/javascript" src="/js/src/dytitle.js"></script> 

{# 音乐播放器 #}
<link rel="stylesheet" href="/aplayer/APlayer.min.css">
<div id="aplayer"></div>
<script type="text/javascript" src="/aplayer/APlayer.min.js"></script>
<script type="text/javascript" src="/aplayer/music.js"></script>

{# 打字特效 #}
{% if theme.typing_effect.enabled and not is_index %}
  <script type="text/javascript" src="/js/src/activate-power-mode.min.js"></script>
  <script>
    POWERMODE.colorful = {{ theme.typing_effect.colorful }};
    POWERMODE.shake = {{ theme.typing_effect.shake }};
    document.body.addEventListener('input', POWERMODE);
  </script>
{% endif %}

