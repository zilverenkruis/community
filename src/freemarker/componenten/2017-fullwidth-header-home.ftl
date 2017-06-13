<header class="full-width-header home layout2017">
<div class="header-text no-background-image">
<#if user.anonymous>
    <h1 class="title">Welkom op onze community!</h1>
    <p class="description">
        Deel je ervaringen met duizenden gebruikers en vind alle informatie over onderwerpen die jou interesseren
    </p>
    <br>
    <div class="btn btn-primary btn-large"><@component id="common.widget.slide-out-user-menu"/></div>
</div>
<#else>
    <#assign unreadQ = "SELECT count(*) FROM inbox_notes WHERE user.id = '${user.id}' AND unread_only = true" />
    <#assign notificationsQ = "SELECT notification_style, count(*) FROM notification_feeds" />
    <#assign unreadCount = 0 />
    <#assign notificationsCount = 0 />

    <#attempt>
        <#assign unread = rest("2.0", "/search?q=${unreadQ?url}") />
        <#if unread?? && unread?has_content && unread.data?? && unread.status == "success">
            <#assign unreadCount = unread.data.count />
        </#if>
        <#recover>
            <!-- Error while querying for number of unread messages: ${.error} -->
    </#attempt>

    <#attempt>
        <#assign notifications = rest("2.0", "/search?q=${notificationsQ?url}") />
        <#if notifications?? && notifications.status == "success" && notifications.data??>
            <#assign notificationsCount = notifications.data.count />
        </#if>
        <#recover>
            <!-- Error while querying for number of notifications: ${.error} -->
    </#attempt>
    <h1 class="title">Welkom terug, ${user.login!"User"}!</h1>
    <#if unreadCount gt 0 || notificationsCount gt 0>
        <p class="description">
        ${text.format("component.user_dashboard.intro")} ${(notificationsCount gt 0)?string("<a class='unread-notifications' href='/t5/notificationfeed/page'>" + notificationsCount?c + " " + text.format("component.user_dashboard.new_notifications", notificationsCount), "")  + "</a> " }${(unreadCount gt 0 && notificationsCount gt 0)?string (" " + text.format("notificationFeed.description.topic.reply.separator.one.text") + " ", "")}${(unreadCount gt 0)?string("<a class='unread-private-messages' href='/t5/notes/privatenotespage'>" + unreadCount?c + " " + text.format("component.user_dashboard.new_messages", unreadCount), "") + "</a> "}
        </p>
    </#if>

</#if>
</header>