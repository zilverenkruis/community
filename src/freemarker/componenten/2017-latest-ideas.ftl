<#include "common-functions.ftl">
<#assign type = coreNode.nodeType />
<#assign dateFormat = settings.name.get("layout.format_pattern_date")  />
<#assign timeFormat = settings.name.get("layout.format_pattern_time")  />

<#assign interaction = "idea" />

<#attempt>
    <#assign label = coreNode.title!"" />
    <#recover>
</#attempt>

<#attempt>
    <#assign numRows = env.context.component.getParameter("rows")!"3" />
    <#recover>
</#attempt>

<#attempt>
    <#assign labelQuery = " AND labels.text='${label}'" />
    <#recover>
</#attempt>

<#assign interactionQ = " AND conversation.style='${interaction}'" />

<#assign messagesQ = "SELECT id, subject, kudos.sum(weight), conversation.last_post_time, view_href FROM messages WHERE depth=0 ${labelQuery} ${interactionQ} ORDER BY conversation.last_post_time DESC LIMIT ${numRows}" />

<#assign messages = rest("2.0", "/search?q=${messagesQ?url}") />

<#if messages?? && messages.data?? && messages.data.items?? && messages.data.items?size gt 0>
    <@wrapComponent name="custom-latest-post-" + type + "-" + interaction>
    <div class="items-list doelgroep-item-list">
        <ul class="items">
            <#list messages.data.items as msg>
                <@displayMessage message=msg />
            </#list>
            <li>
                <a href="/t5/forums/postpage/board-id/IdeaExchange" class="btn btn-normal btn-large strong" data-icon="a">Deel jouw idee</a>
            </li>
        </ul>
    </div>
    <div class="view-all-link-wrapper">
        <a href="/t5/Ideeënbus/idb-p/IdeaExchange/label-name/${label}" class="btn btn-link strong" data-icon="a">Bekijk alle ideeën</a>
    </div>
    </@wrapComponent>
</#if>

<#macro displayMessage message>

<li class="msg-${message.id} list-item">
    <div class="item-wrapper clear-float">

        <div class="item-text-wrapper">

            <div class="item-info">
                <h3 class="item-title">
                    <a href="${message.view_href}" title="${message.subject?html}"
                       alt="${message.subject?html}">${message.subject?html}</a>
                </h3>
            </div>
            <div class="item-meta-info">
                <div class="wrapper">
                    <div class="kudos">
                        <span class="unit">${text.format("message.message-view.kudos-count.label", message.kudos.sum.weight)}
                    </div>

                </div>
            </div>
        </div>
    </div>
</li>

</#macro>
