<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
            <!-- Open Graph -->
            <meta property="og:locale" content="zh_CN"/>
            <meta property="og:type" content="article"/>
            <meta property="og:title" content="${article.articleTitle}"/>
            <meta property="og:description" content="${article.articleAbstract?html}"/>
            <meta property="og:image" content="${article.authorThumbnailURL}"/>
            <meta property="og:url" content="${servePath}${article.articlePermalink}"/>
            <meta property="og:site_name" content="Solo"/>
            <!-- Twitter Card -->
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:description" content="${article.articleAbstract?html}"/>
            <meta name="twitter:title" content="${article.articleTitle}"/>
            <meta name="twitter:image" content="${article.authorThumbnailURL}"/>
            <meta name="twitter:url" content="${servePath}${article.articlePermalink}"/>
            <meta name="twitter:site" content="@DL88250"/>
            <meta name="twitter:creator" content="@DL88250"/>

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
            <main>
                <article class="post fn-wrap">
                    <header>
                        <h1 class="post-title">
                            <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                                ${article.articleTitle}
                            </a>
                            <#if article.hasUpdated>
                            <sup class="post-tip">
                                ${updatedLabel}
                            </sup>
                            </#if>
                            <#if article.articlePutTop>
                            <sup class="post-tip">
                                ${topArticleLabel}
                            </sup>
                            </#if>
                        </h1>
                        <section class="post-meta">
                            <#list article.articleTags?split(",") as articleTag>
                            <span>
                                <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                    ${articleTag}</a><#if articleTag_has_next>,</#if>
                            </span>
                            </#list>
                            <time>${article.articleCreateDate?string("yyyy-MM-dd")}</time>
                        </section>
                    </header>
                    <section class="post-content article-body">
                        ${article.articleContent}
                        <#if "" != article.articleSign.signHTML?trim>
                        <div class="marginTop12">
                            ${article.articleSign.signHTML}
                        </div>
                        </#if>
                    </section>
                    <footer>
                        <figure class="post-author">
                            <a href="${servePath}/authors/${article.authorId}"
                               title="${article.authorName}" alt="${article.authorName}"
                               style="background-image: url('${article.authorThumbnailURL}')">
                                <span class="fn-none">${article.authorName}</span>
                            </a>
                        </figure>
                        <div class="share fn-right">
                            <span class="icon icon-tencent" data-type="tencent"></span>
                            <span class="icon icon-weibo" data-type="weibo"></span>
                            <span class="icon icon-twitter" data-type="twitter"></span>
                            <span class="icon icon-google" data-type="google"></span>
                        </div>
                    </footer>
                </article>
                <#--<div id="externalRelevantArticles" class="fn-wrap"></div>-->
                <@comments commentList=articleComments article=article></@comments>
            </main>
            <#if nextArticlePermalink?? || previousArticlePermalink??>
            <aside class="read-next">
                <#if nextArticlePermalink??>
                <div class="read-next-story " style="background-image: url('${staticServePath}/skins/${skinDirName}/images/next.jpg')"
                     onclick="window.location = '${servePath}${nextArticlePermalink}'">
                    <section class="post">
                        <h2>${nextArticleTitle}</h2>
                        <p>${nextArticleAbstract}</p>
                    </section>
                </div>
                </#if>
                <#if previousArticlePermalink??>
                <div class="read-next-story prev " style="background-image: url('${staticServePath}/skins/${skinDirName}/images/preview.jpg')"
                     onclick="window.location = '${servePath}${previousArticlePermalink}'">
                    <section class="post">
                        <h2>${previousArticleTitle}</h2>
                        <p>${previousArticleAbstract}</p>
                    </section>
                </div>
                </#if>
            </aside>
            </#if>
            <#include "footer.ftl">

            <@comment_script oId=article.oId>
            <#--page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
            <#if 0 != externalRelevantArticlesDisplayCount>
            page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>");
            </#if>-->
             </@comment_script>
        </div>
    </body>
</html>
