<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${linkLabel}"/>
        <meta name="description" content="${metaDescription},${linkLabel}"/>
        </@head>

        <#--baidu tongji-->
        <script>
            var _hmt = _hmt || [];
            (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?8f1b0c897cbeb1f954a6867a2ab311b3";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </head>
    <body class="nav-closed">
        <div class="nav">
            <#include "side.ftl">
        </div>
        <div class="site-wrapper">
            <#include "header.ftl">
            <main id="content">
                <#if 0 != links?size>
                <ul class="fn-clear fn-wrap" id="tags">
                    <#list links as link>
                    <li>
                        <a rel="friend" href="${link.linkAddress}" title="${link.linkDescription}" target="_blank">
                            <img src="${faviconAPI}<#list link.linkAddress?split('/') as x><#if x_index=2>${x}<#break></#if></#list>" width="16" height="16" />
                            ${link.linkTitle}
                        </a>
                    </li>
                    </#list>
                </ul>
                </#if>
            </main>
            <#include "footer.ftl">
        </div>
    </body>
</html>
