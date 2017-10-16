<#assign messages_per_page_linear = settings.name.get("layout.messages_per_page_linear")?number />
<#assign subjectLength = 60 />

<#assign messages_per_page_linear = 15 />

<#if webuisupport.path.parameters.name.get("label-name")?? >
    <#assign label =  webuisupport.path.parameters.name.get("label-name").getText() >
<#else>
    <#assign label = "Diabetes" />
</#if>
<#if webuisupport.path.parameters.name.get("page")?? >
    <#assign page_number  =  webuisupport.path.parameters.name.get("page") >
<#else>
    <#assign page_number  = 1 />
</#if>

<#assign query = "select count(*) from messages where labels.text = '" + label + "' AND depth=0 AND conversation.style='forum'" />

<#assign messages = rest("2.0", "search?q="+query?url) />

<#assign messagesTotal = messages.data.count />

<#if (((page_number - 1) * messages_per_page_linear) >= messagesTotal) >
    <#assign page_number = 1 />
</#if>

<#assign pageable_item = webuisupport.paging.pageableItem.setCurrentPageNumber(page_number).setItemsPerPage(messages_per_page_linear).setTotalItems(messagesTotal).setPagingMode("enumerated").build />

<#assign offset = (page_number-1)*messages_per_page_linear />

<#assign query2 = "select * from messages where labels.text = '" + label + "' AND depth=0 AND conversation.style='forum' order by post_time desc limit " + messages_per_page_linear + " offset " + offset />

<#assign messages = rest("2.0", "search?q="+query2?url) />

<div class="custom-messages-by-label">

    <div class="lia-menu-bar lia-menu-bar-top top-block">
        <div class="lia-decoration-border-menu-bar">
            <div class="lia-decoration-border-menu-bar-top">
                <div></div>
            </div>
            <div class="lia-decoration-border-menu-bar-content">
                <div>
                <@component id="common.widget.pager" pageableItem=pageable_item />
                </div>
            </div>
            <div class="lia-decoration-border-menu-bar-bottom">
                <div></div>
            </div>
        </div>
    </div>

    <div class="MessageList lia-component-forums-widget-message-list" id="messageList">
        <div class="t-data-grid single-message-list">
            <table class="lia-list-wide">
                <tbody>
                <#list messages.data.items as msg>
                <tr class="lia-list-row lia-row-odd lia-js-data-messageRevision-2">
                    <td class="cMessageAuthorAvatarColumn lia-data-cell-secondary lia-data-cell-icon">
                        <div class="UserAvatar lia-user-avatar lia-component-messages-column-message-author-avatar">
                            <a class="UserAvatar lia-link-navigation" target="_self" href="${msg.author.view_href}">
                                <#assign avatarQuery = "select avatar.message from users where id = '"+msg.author.id+"'" />
                                <#assign avatarResponse = rest("2.0", "/search?q="+avatarQuery?url("UTF-8")) />
                                <#if avatarResponse.data.size gt 0 && avatarResponse.data.items[0].avatar??>
                                    <img class="lia-user-avatar-message" title="${msg.author.login}" alt="${msg.author.login}" id="display" src="${avatarResponse.data.items[0].avatar.message}"/>
                                </#if>
                            </a>
                        </div>
                    </td>
                    <td class="cThreadInfoColumn lia-data-cell-primary lia-data-cell-text">
                        <div class="lia-component-messages-column-message-info">
                            <div class="MessageSubjectCell">
                                <div class="MessageSubject">
                                    <div class="MessageSubjectIcons ">
                                        <h2 class="message-subject">
									<span class="lia-message-unread">
										<a class="page-link lia-link-navigation lia-custom-event" href="${msg.view_href}">${utils.html.stripper.from.gdata.strip(utils.html.truncate(subjectLength,utils.html.stripper.from.gdata.strip(msg.subject), "..."))?html}</a>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                            <div class="lia-info-area">
        				<span class="lia-info-area-item">
            ${text.format("custom-messages-by-label-by")}
                <@component id="common.widget.user-name" user="${msg.author.id}" />

                <#if msg.post_time_friendly?? && msg.post_time_friendly?trim?length != 0>
                    <#assign postDate = msg.post_time_friendly />
                    <#assign postTime = "" />
                <#else>
                    <#assign postTime = msg.post_time?time />
                    <#attempt>
                        <#assign postDate = text.format("custom-messages-by-label-on")+" "+msg.post_time?string[settings.name.get("layout.format_pattern_date")] />
                        <#recover>
                            <#assign postDate = text.format("custom-messages-by-label-on")+" "+msg.post_time?date />
                    </#attempt>
                </#if>
                <span class="DateTime lia-component-common-widget-date">
				<span class="local-date">&lrm;${postDate}</span>
				<span class="local-time">${postTime}</span>
			</span>
        </span>
                            </div>
                        </div></td>

                    <#if msg.conversation.messages_count?? && msg.conversation.messages_count?has_content>
                        <#assign replies_count = (msg.conversation.messages_count?number - 1) />
                    <#else>
                        <#assign replies_count = msg.replies.count?number />
                    </#if>

                    <#if replies_count == 1>
                        <#assign repliesLabel = text.format("custom-messages-by-label-answer") />
                    <#else>
                        <#assign repliesLabel = text.format("custom-messages-by-label-answers") />
                    </#if>

                    <td class="cRepliesCountColumn lia-data-cell-secondary lia-data-cell-integer">
                        <div class="lia-component-messages-column-message-replies-count">
                            <a class="lia-link-navigation lia-replies-count-link" href="${msg.view_href}">
                                <span class="lia-message-stats-count">${replies_count}</span> ${repliesLabel}
                            </a>
                        </div>
                    </td>
                    <td class="cViewsCountColumn lia-data-cell-secondary lia-data-cell-integer">
                        <div class="lia-component-messages-column-message-views-count">
                            <span class="lia-message-stats-count">${msg.metrics.views}</span>
                            <#if replies_count == 1>
                            ${text.format("custom-messages-by-label-view")}
                            <#else>
                            ${text.format("custom-messages-by-label-views")}
                            </#if>
                        </div>
                    </td>
                    <td class="triangletop lia-data-cell-secondary lia-data-cell-icon"><div class="lia-component-common-column-empty-cell"></div></td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>

    <div class="lia-menu-bar lia-menu-bar-top top-block">
        <div class="lia-decoration-border-menu-bar">
            <div class="lia-decoration-border-menu-bar-top">
                <div></div>
            </div>
            <div class="lia-decoration-border-menu-bar-content">
                <div>
                <@component id="common.widget.pager" pageableItem=pageable_item />
                </div>
            </div>
            <div class="lia-decoration-border-menu-bar-bottom">
                <div></div>
            </div>
        </div>
    </div>
</div>

<@liaAddScript>
;(function($) {
$(document).ready(function() {
document.title = '${text.format("custom-messages-by-label-title")} ${label}';
$('.final-crumb span').text("${text.format("custom-messages-by-label-title")} ${label}");
});
})(LITHIUM.jQuery);
</@liaAddScript>



