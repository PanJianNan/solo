<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${categoryLabel} - ${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${categoryLabel}"/>
        <meta name="description" content="<#list mostUsedCategories as category>${category.categoryTitle}<#if category_has_next>,</#if></#list>"/>
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
                <ul id="tags" class="fn-clear fn-wrap">
                    <#list mostUsedCategories as category>
                    <li>
                        <a href="${servePath}/category/${category.categoryURI}"
                           title="${category.categoryTitle} (${category.categoryTagCnt})">
                            ${category.categoryTitle} (<b>${category.categoryTagCnt}</b>)
                        </a>
                    </li>
                    </#list>
                </ul>
            </main>
            <#include "footer.ftl">
        </div>
        <script type="text/javascript">
            Util.buildTags();
        </script>
    </body>
</body>
</html>
