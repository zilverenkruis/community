<#assign label = coreNode.title />

<#assign countQ = "SELECT count(*) FROM messages WHERE depth=0 AND labels.text='${label}' AND conversation.style='blog'" />
<#assign count = rest("2.0", "/search?q=${countQ?url}") />

<#if count?? && count?has_content && count.data?? && count.status == "success" && count.data.count gt 0>
<div class="header-latest-blogs-wrapper">
    <h2>Verdiep je in blogs</h2>
</div>
</#if>
