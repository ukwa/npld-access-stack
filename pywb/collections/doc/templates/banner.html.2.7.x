{% autoescape false %}
{% if not embed_url %}

<!-- Custom Fixup Script -->
<script src="{{ static_prefix }}/fixup.js"> </script>

{# NPLD Addition for content frame #}
{% if env.single_use_lock %}
<script src="{{ static_prefix }}/selection-limits.js"> </script>
<script>
__WB_initSelectionLimit({{ env.select_word_limit }});
</script>
{% endif %}

<!-- Video Transclusions -->
<script src="{{ static_prefix }}/transclusions.js"> </script>

{% else %}

{# NPLD Addition for top-frame #}
{% if env.single_use_lock %}
<script>
  setInterval(function () { window.fetch("/_locks/ping"); }, {{env.lock_ping_interval}});
</script>
{% endif %}


{% endif %}

<script>
window.banner_info = {
  is_gmt: true,

  liveMsg: decodeURIComponent("{{ _Q('Live on') }}"),

  calendarAlt: decodeURIComponent("{{ _Q('Calendar icon') }}"),
  calendarLabel: decodeURIComponent("{{ _Q('View All Captures') }}"),
  choiceLabel: decodeURIComponent("{{ _Q('Language:') }}"),
  loadingLabel: decodeURIComponent("{{ _Q('Loading...') }}"),
  logoAlt: decodeURIComponent("{{ _Q('Logo') }}"),

  locale: "{{ env.pywb_lang | default('en') }}",
  curr_locale: "{{ env.pywb_lang }}",
  locales: {{ locales }},
  locale_prefixes: {{ get_locale_prefixes() | tojson }},
  prefix: "{{ wb_prefix }}",
  staticPrefix: "{{ static_prefix }}",

  logoImg: "{{ ui.logo }}"
};
</script>
<script src="{{ static_prefix }}/loading-spinner/loading-spinner.js"></script>
<!-- Not needed (and it breaks anyway):
<script src="{{ static_prefix }}/vue/vueui.js"></script>
-->
<link rel="stylesheet" href='{{ static_prefix }}/vue_banner.css'/>

<!-- Remove the Vue toolbar block altogether: -->
<style>
#app {
  display: none !important;
}
</style>

<script>
window.activeUrl = "{{ url }}";
</script>

{% endautoescape %}
