<#attempt>
    <#assign titel = env.context.component.getParameter("titel")!"Vul een titel in" />
    <#recover>
</#attempt>

<#attempt>
    <#assign btntitel = env.context.component.getParameter("btntitel")!"" />
    <#recover>
</#attempt>

<#attempt>
    <#assign btnlink = env.context.component.getParameter("btnlink")!"" />
    <#recover>
</#attempt>

<#attempt>
    <#assign forumboard = env.context.component.getParameter("forumboard")!"" />
    <#recover>
</#attempt>

<#if forumboard=="ja">
    <#assign btnlink = "/t5/forums/postpage/board-id/" + coreNode.id />
</#if>

<div class="section-heading-2017 small clear-float">
    <div class="column">
        <h2 class="title">${titel}</h2>
    </div>
    <div class="column">
    <#if btnlink?length gt 0 && btntitel?length gt 0>
        <a class="btn btn-primary btn-large " href="${btnlink}">${btntitel}</a>
    <#else >
        <br>
    </#if>
    </div>
</div>
