<#-- copy of: 2016-latest-posts component in de 2016-section-homepage-forum page -->

<#include "common-functions.ftl">
<#assign type = coreNode.nodeType />
<#assign nodeId = coreNode.id />
<#assign dateFormat = settings.name.get("layout.format_pattern_date")  />
<#assign timeFormat = settings.name.get("layout.format_pattern_time")  />
<p>||${nodeId}||</p>
<#-- COMPONENT PARAMETERS -->

<#attempt>
    <#-- assign interaction = env.context.component.getParameter("interaction-style")!"all" />
    <#recover -->
    <#assign interaction = "all" />
</#attempt>

<#attempt>
    <#-- assign numRows = env.context.component.getParameter("rows")!"10"?number />
    <#recover>
    <#if type == "category">
        <#assign numRows = settings.name.get("layout.boards_per_category_page", "10")?number />
    <#elseif type=="board">
        <#assign numRows = settings.name.get("layout.messages_per_page_linear", "10")?number />
    <#else -->
        <#assign numRows = 10 />
    <#-- /#if -->
</#attempt>

<#-- assign levelQuery = "" />

<#if type == "board">
    <#assign levelQuery = " AND board.id='${nodeId}'" />
</#if>

<#if type="category" -->
    <#assign levelQuery = " AND category.id='${nodeId}'" />
<#-- /#if -->

<#-- This code might seem a bit overkilling but it is just to prevent that typos in specifying the interaction style while configuring the component, brings it down.  -->

<#-- assign  interactionQ = "" />
<#if interaction != "all">
    <#if interaction == "idea">
        <#assign interactionQ = " AND conversation.style='idea'" />
    <#elseif interaction == "forum">
        <#assign interactionQ = " AND conversation.style='forum'" />
    <#elseif interaction == "blog">
        <#assign interactionQ = " AND conversation.style='blog'" />
    <#elseif interaction == "tkb">
        <#assign interactionQ = " AND conversation.style='tkb'" />
    </#if>
</#if -->

<#assign messagesQ = "
    SELECT id, subject, conversation.solved, kudos.sum(weight), author.login, author.view_href, author.avatar,
    conversation.last_post_time, post_time, post_time_friendly, metrics.views, view_href, replies.count(*), board.id,
    board.view_href, board.title
    FROM messages
    WHERE depth=0 ${levelQuery} ${interactionQ}
    ORDER BY conversation.last_post_time DESC
    LIMIT ${numRows}
"/>

<#assign messages = rest("2.0", "/search?q=${messagesQ?url}") />

<#if messages?? && messages.data?? && messages.data.items?? && messages.data.items?size gt 0>
    <@wrapComponent name="custom-latest-post-" + type + "-" + interaction>
        <div class="items-list">
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

            <div class="item-img-wrapper">
                <#if message.author?? && message.author?has_content && message.author.view_href??>
                    <a href="${message.author.view_href}" title="${message.author.login?html}" alt="${message.author.login?html}">
                        <img src="${message.author.avatar.profile}">
                    </a>
                <#else>
                    <a href="" title="${settings.name.get("config.display_name_for_deleted_users", "")!""?html}" alt="${settings.name.get("config.display_name_for_deleted_users", "")!""?html}">
                        <img src="${skin.images.icon_anonymous}">
                    </a>
                </#if>
            </div>

            <div class="item-text-wrapper">
                <div class="item-info">
                    <h3 class="item-title">
                        <a href="${message.view_href}" title="${message.subject?html}" alt="${message.subject?html}">${message.subject?html}</a>
                    </h3>

                    <#if message.author?? && message.author?has_content && message.author.view_href??>
                        <div class="item-author">
                            ${text.format("message.message-view.byline-author-date.title", "<a href='" + message.author.view_href + "'>" + message.author.login + "</a>", postDate)}
                        </div>
                    <#else>
                        <div class="item-author">
                            ${text.format("message.message-view.byline-author-date.title",  settings.name.get("config.display_name_for_deleted_users", "")!""?html, postDate)}
                        </div>
                    </#if>

                    <!-- <div class="item-date">${postDate}</div> -->

                    <#if latestAuthor?? && latestAuthor.data?? && latestAuthor.data.items?? && latestAuthor.data.items?size gt 0>
                        <#assign latestAuthor = latestAuthor.data.items[0].author />
                        <#if latestAuthor?? && latestAuthor.login?? && latestAuthor.view_href??>
                            <div class="latest_author">
                                ${text.format("latest_posts.latest_author")}&nbsp;
                                <a href="${latestAuthor.view_href}" title="${latestAuthor.login?html}" alt="${latestAuthor.login?html}">${latestAuthor.login?html}</a>
                            </div>
                        </#if>
                    </#if>

                    <div class="message-board">
                        <a href="${message.board.view_href}" title="${message.board.title}" alt="${message.board.title}">${message.board.title}</a>
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
                                <span class="unit">${message.replies.count}&nbsp;${text.format("messages.column.thread-replies-count.label", message.replies.count)}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>
</#macro>







