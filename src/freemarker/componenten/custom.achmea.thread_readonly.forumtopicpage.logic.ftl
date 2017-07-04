<#if page.name == "ForumTopicPage">
    <#include "readonly_threads_functions" />
    <#assign message = get_message_details(page.context.thread.topicMessage.uniqueId) />
    <#if is_old_thread(message.post_time) && !is_readonly_override(message)>
        <#assign tkb_url = settings.name.get("achmea.tkb_url_for_readonly","") />
        <#if tkb_url != "">
        <div class="outdated-topic-notification">${text.format("custom-old-threads-read-only.text_with_url",tkb_url)}</div>
        <#else>
        <div class="outdated-topic-notification">${text.format("custom-old-threads-read-only.text")}</div>
        </#if>
        <@liaAddScript>
        ;(function($){
        $(function(){
        $("#lia-body.ForumTopicPage").each(function(){
        if($(this).hasClass("outdated-topic")) {
        return;
        } else {
        $(this).addClass("outdated-topic");
        }
        });
            <#if user_has_role(user.id, "'Administrator','Moderator'") >
            $("#lia-body.ForumTopicPage").each(function(){
            if($(this).hasClass("admin")) {
            return;
            } else {
            $(this).addClass("admin");
            }
            });
            </#if>
        });
        })(LITHIUM.jQuery);
        </@liaAddScript>

    <style>
        #lia-body.ForumTopicPage.outdated-topic .lia-content .outdated-topic-notification {
            margin: 15px 0 30px 0;
            background: #E5F5F5;
            text-align: center;
            color: #113E83;
            padding: 14px;
            font-size: 1.2em;
        }

        #lia-body.ForumTopicPage.outdated-topic .lia-content .lia-message-options,
        #lia-body.ForumTopicPage.outdated-topic .lia-content .lia-rating-metoo,
        #lia-body.ForumTopicPage.outdated-topic .lia-content .lia-component-actions,
        #lia-body.ForumTopicPage.outdated-topic .lia-content .lia-menu-bar-buttons,
        #lia-body.ForumTopicPage.outdated-topic .lia-content .lia-action-reply {
            display: none;
        }
        #lia-body.ForumTopicPage.outdated-topic.admin .lia-content .lia-message-options,
        #lia-body.ForumTopicPage.outdated-topic.admin .lia-content .lia-component-actions,
        #lia-body.ForumTopicPage.outdated-topic.admin .lia-content .lia-menu-bar-buttons,
        #lia-body.ForumTopicPage.outdated-topic.admin .lia-content .lia-action-reply {
            display: inherit;
        }
    </style>
    </#if>
</#if>

