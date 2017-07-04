<#attempt>
    <#assign titel = env.context.component.getParameter("titel")!"Vul een titel in" />
    <#recover>

</#attempt>
<#attempt>
    <#assign linktitel = env.context.component.getParameter("linktitel")!"" />
    <#recover>

</#attempt>

<#attempt>
    <#assign subtitel = env.context.component.getParameter("subtitel")!"" />
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
    <#assign showmarker = env.context.component.getParameter("marker")!"" />
    <#recover>
</#attempt>


<div class="section-heading">

<#if linktitel?length gt 0>
    <h2 class="title"><a href="${linktitel}">${titel}</a></h2>
<#else>

    <h2 class="title">${titel}</h2>
</#if>

<#if subtitel?length gt 0>
    <p class="subtitle">${subtitel}</p>
</#if>

<#if btntitel?length gt 0 && btnlink?length gt 0>
    <a class="btn btn-primary btn-large " href="${btnlink}"><strong>${btntitel}</strong></a>

</#if>

</div>
<#if showmarker?length gt 0>
<div class="marker">&nbsp;</div>
</#if>