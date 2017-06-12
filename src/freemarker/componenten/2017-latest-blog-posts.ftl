<#include "common-functions.ftl">
<#assign type = coreNode.nodeType />
<#assign nodeId = coreNode.id />
<#assign dateFormat = settings.name.get("layout.format_pattern_date")  />
<#assign timeFormat = settings.name.get("layout.format_pattern_time")  />

<#-- COMPONENT PARAMETERS -->

<#assign interaction = "blog" />

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

<#-- This code might seem a bit overkilling but it is just to prevent that typos in specifying the interaction style while configuring the component, brings it down.  -->

<#assign interactionQ = " AND conversation.style='blog'" />

<#assign messagesQ = "SELECT id, teaser, subject, conversation.solved, kudos.sum(weight), author.login, author.view_href, author.avatar, conversation.last_post_time, post_time, post_time_friendly, metrics.views, view_href, replies.count(*), board.id, board.view_href, board.title FROM messages WHERE depth=0 ${labelQuery} ${interactionQ} ORDER BY conversation.last_post_time DESC LIMIT ${numRows}" />

<#assign messages = rest("2.0", "/search?q=${messagesQ?url}") />

<#if messages?? && messages.data?? && messages.data.items?? && messages.data.items?size gt 0>
    <@wrapComponent name="custom-latest-post-" + type + "-" + interaction>
    <div class="items-list doelgroep-item-list">
        <ul class="items">
            <#list messages.data.items as msg>
          <@displayMessage message=msg />
        </#list>
        </ul>
    </div>
    </@wrapComponent>
</#if>

<#macro displayMessage message>
    <#assign latestAuthorQ = "SELECT author.login, author.view_href FROM messages WHERE topic.id = '${message.id}' ORDER BY post_time DESC LIMIT 1" />
    <#assign latestAuthor = rest("2.0", "/search?q=${latestAuthorQ?url}") />

    <#assign postDate = "" />
    <#if message.post_time_friendly??>
        <#assign postDate = message.post_time_friendly />
    <#else>
        <#assign postDate = message.post_time?string["${dateFormat} ${timeFormat}"] />
    </#if>

<li class="msg-${message.id} list-item">
    <div class="item-wrapper clear-float">

        <#if message.conversation.solved>
            <div class="is_solved"></div>
        </#if>
        <div class="hidden blog-teaser">${message.teaser}</div>
        <div class="blogitem-img-wrapper"></div>

        <div class="item-text-wrapper">

            <div class="item-info">
                <h3 class="item-title">
                    <a href="${message.view_href}" title="${message.subject?html}"
                       alt="${message.subject?html}">${message.subject?html}</a>
                </h3>
                <#if message.author?? && message.author?has_content && message.author.view_href??>
                    <div class="item-author">${text.format("message.message-view.byline-author-date.title", "<a href='" + message.author.view_href + "'>" + message.author.login + "</a>", postDate)}
                    </div>
                <#else>
                    <div class="item-author">${text.format("message.message-view.byline-author-date.title",  settings.name.get("config.display_name_for_deleted_users", "")!""?html, postDate)}
                    </div>
                </#if>

              ${postDate}

                <#if latestAuthor?? && latestAuthor.data?? && latestAuthor.data.items?? && latestAuthor.data.items?size gt 0>
                    <#assign latestAuthor = latestAuthor.data.items[0].author />
                    <#if latestAuthor?? && latestAuthor.login?? && latestAuthor.view_href??>
                        <div class="latest_author">
                        ${text.format("latest_posts.latest_author")}&nbsp<a href="${latestAuthor.view_href}"
                                                                            title="${latestAuthor.login?html}"
                                                                            alt="${latestAuthor.login?html}">${latestAuthor.login?html}</a>
                        </div>
                    </#if>
                </#if>

                <div class="message-board">
                    <a href="${message.board.view_href}" title="${message.board.title}"
                       alt="${message.board.title}">${message.board.title}</a>
                </div>
            </div>
            <div class="item-meta-info">
                <div class="wrapper">
                    <div class="kudos">
                        <span class="unit-count">${message.kudos.sum.weight}&nbsp;</span>
                        <span class="unit">${text.format("message.message-view.kudos-count.label", message.kudos.sum.weight)}
                    </div>
                    <div class="replies">
                        <a href="${message.view_href}" title="${message.subject?html}" alt="${message.subject?html}">

                            <span class="unit-count">${message.replies.count}</span>
                            <span class="unit">${message.replies.count}
                                &nbsp;${text.format("messages.column.thread-replies-count.label", message.replies.count)}</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>

</#macro>
