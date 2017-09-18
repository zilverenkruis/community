<#include "common-functions.ftl">
<#assign type = coreNode.nodeType />
<#assign id = coreNode.id />
<#assign label = coreNode.title />
<#assign dateFormat = settings.name.get("layout.format_pattern_date")  />
<#assign timeFormat = settings.name.get("layout.format_pattern_time")  />

<#assign interaction = "forum" />

<#attempt>
    <#assign numRows = env.context.component.getParameter("rows")!"14" />
    <#recover>
</#attempt>

<#attempt>
    <#assign labelQuery = " AND labels.text='${label}'" />
    <#recover>
</#attempt>

<#assign interactionQ = " AND conversation.style='${interaction}'" />
<#assign messagesQ = "SELECT id, author, subject, kudos.sum(weight), conversation.last_post_time, post_time, post_time_friendly, view_href FROM messages WHERE depth=0 ${labelQuery} ${interactionQ} ORDER BY conversation.last_post_time DESC LIMIT ${numRows}" />
<#assign messages = rest("2.0", "/search?q=${messagesQ?url}") />

<#if messages?? && messages.data?? && messages.data.items?? && messages.data.items?size gt 0>
    <@wrapComponent name="custom-latest-post-" + type + "-" + interaction>
    <div class="items-list doelgroep-item-list">
        <ul class="items">
            <#list messages.data.items as msg>
                <@displayMessage message=msg />
            </#list>
            <li class="view-all-link-wrapper">
                <div>
                    <a href="/t5/custom/page/page-id/LabelPage/label-name/${label}" class="btn btn-link strong" data-icon="a">Bekijk alle ${label} topics</a>
                    <a href="/t5/forums/postpage/board-id/${label}" class="btn btn-primary btn-large strong" data-icon="a">Plaats een nieuw topic</a>
                </div>
            </li>
        </ul>
    </div>

    </@wrapComponent>
</#if>

<#macro displayMessage message>
    <#assign postDate = "" />
    <#if message.post_time_friendly??>
        <#assign postDate = message.post_time_friendly />
    <#else>
        <#assign postDate = message.post_time?string["${dateFormat}"] />
    </#if>

<li class="msg-${message.id} list-item">
    <div class="item-wrapper clear-float">

        <div class="avatar-wrapper">
            <div class="author-avatar">
                <#assign avatarQuery = "select avatar.profile from users where id = '"+message.author.id+"'" />
                <#assign avatarResponse = rest("2.0", "/search?q="+avatarQuery?url("UTF-8")) />
                <#if avatarResponse.data.size gt 0 && avatarResponse.data.items[0].avatar??>
                    <img src="${avatarResponse.data.items[0].avatar.profile}" alt="${message.author.login}">
                </#if>
            </div>
        </div>
        <div class="item-info">
            <h3 class="item-title">
                <a href="${message.view_href}" title="${message.subject?html}"
                   alt="${message.subject?html}">${message.subject?html}</a>
            </h3>
            <span class="lia-message-byline lia-message-byline-author-date lia-component-byline-author-date">
                <span class="lia-byline-text lia-text-submitted-by">Geplaatst door</span>
                <span class="UserName lia-user-name">
                    <a class="lia-link-navigation lia-page-link lia-user-name-link" href="${message.author.view_href}">
                        <span class="login-bold">${message.author.login}</span>
                    </a>
                </span>
                <span class="lia-byline-text lia-text-date-on">op</span>
                <span class="DateTime lia-component-common-widget-date">
                    <span class="local-date">‎${postDate}</span>
                </span>
            </span>
        </div>
        <div class="item-meta-info">
            <div class="wrapper">
                <div class="kudos">
                    <span class="unit">${message.kudos.sum.weight}
                </div>
                <#assign countQ = "SELECT count(*) FROM messages WHERE parent.id = '${message.id}'">
                <#assign count = rest("2.0", "/search?q=${countQ?url}") />
                <#assign nrofreplies = '0' />
                <#if count?? && count?has_content && count.data?? && count.status == "success">
                    <div class="replies">
                        <span class="unit">${count.data.count}</span>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</li>
</#macro>
