<ul id="tags_nav" class="fn-clear fn-wrap">
<#list tags as tag>
    <li>
        <a rel="tag" data-count="${tag.tagPublishedRefCount}"
           href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}">
            <span>${tag.tagTitle}</span>
            (<b>${tag.tagPublishedRefCount}</b>)
        </a>
    </li>
</#list>
</ul>