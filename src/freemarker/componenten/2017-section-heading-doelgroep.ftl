<#attempt>
    <#assign titel = coreNode.title!"" />
    <#assign imgpath = "/html/assets/doelgroep-heading-" + titel + ".jpg" />
    <#recover>
</#attempt>

<#attempt>
    <#assign subtitel = coreNode.description!"" />
    <#recover>
</#attempt>

<div class="center-content doelgroep-heading">
<#if titel?length gt 0>
    <div class="section-heading">
        <h1 class="title">${titel}</h1>
    </div>
</#if>
    <div class="section-content">
    <#if titel?length gt 0>
        <div class="doelgroep-heading-visual">
            <img src="${asset.get(imgpath)}">
        </div>
    </#if>
    <#if subtitel?length gt 0>
        <div class="subtitle">${subtitel}</div>
    </#if>
    </div>
</div>


