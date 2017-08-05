<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${category.categoryTitle} - ${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${category.categoryTitle}"/>
        <meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
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
                <h2 class="fn-wrap">
                    ${categoryLabel}:
                        ${category.categoryTitle}
                    (${category.categoryTagCnt})<small> ${category.categoryDescription}</small>
                </h2>
                <#include "article-list.ftl">
            </main>
            <#include "footer.ftl">
        </div>
    </body>
</html>
