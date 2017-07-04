<#include "common-functions.ftl">

<#assign boardId = coreNode.id />


<#assign numPosts = settings.name.get("blog.entries_per_page_num", "1")?number />

<#assign query = "select teaser, subject, view_href, post_time, post_time_friendly, kudos.sum(weight), metrics.views from messages where board.id='${boardId}' and depth=0 order by post_time desc LIMIT ${numPosts} OFFSET 0" />

<#assign latestBlogPosts = [] />

<#assign latestBlogPosts = rest("2.0", "/search?q=${query?url}")>
<#if latestBlogPosts.status == "success" &&
latestBlogPosts.data.items?? && latestBlogPosts.data.items?has_content>
    <#assign latestBlogPosts = latestBlogPosts.data.items />
<#else>
    <#assign latestBlogPosts = [] />
${text.format("blogPage.noArticleFound.title")}
</#if>

<#assign blogMessages = [] >

<#if latestBlogPosts?? && latestBlogPosts?has_content && latestBlogPosts?size gt 0>




    <@wrapComponent name="customBlogArticlesList">
    <div class="blog-overview">
        <ul id="latest_blog_posts_list" class="latest_blogposts bricklayer blog-overview">
            <#list latestBlogPosts as blogMessage>
                <li class="blog-item">
                    <a href="${blogMessage.view_href}">
                        <div class="blog-image ratio" style="background-image: url('${secondMediaURIfromHTML(blogMessage.teaser)}')"></div>
                        <div class="blog-description">
                            <h3 class="blog-title">${blogMessage.subject}</h3>

                            <div class="blog-meta">
                                <span class="blog-kudos nr_of_kudos " title="Aantal kudos">${blogMessage.kudos.sum.weight}</span>
                                <span class="blog-views nr_of_views" title="Aantal views">${blogMessage.metrics.views}</span>
                            </div>
                            <div class="blog-date date_created">
                                <#if blogMessage.post_time_friendly??>
                    ${blogMessage.post_time_friendly}
               <#else>
                                    <#assign postDate = datesupport.setDate(blogMessage.post_time) />
                                ${postDate.getDateAsString()}
                                </#if>
                            </div>
                        </div>
                    </a>
                </li>
            </#list>
        </ul>
    </div>
    <div class="clear-float"></div>
    <div class="show-more-line">
        <a href="#" class="link-btn show-more btn btn-primary btn-large" id="loadmore">Toon meer blog posts</a>
    </div>


    </@wrapComponent>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bricklayer/0.4.2/bricklayer.min.css"/>


    <@liaAddScript>


    (function($){


    $.getScript( "/html/assets/2016-bricklayer.min.js", function() {

    var bricklayer = new Bricklayer(document.querySelector('.bricklayer'));

    loadBlogsEvent(bricklayer);
    });


    function loadBlogsEvent(bricklayer) {
    var page = 2;

    $('#loadmore').click(function(e) {
    e.preventDefault();
    //Hide button and show the spinner

    var position = $("#loadmore").position();
    $("#loadmore").hide();
    $("#waitSpinner").show();
    $("#waitSpinner").css("left", position.left).css("top", position.top);



    var url = document.URL;
    var arr = url.split("/");
    var protocolDomain= arr[0] + "//" + arr[2]
    var loadUrl = "${community.urls.communityPrefix}/plugins/custom/lithium/${community.id}/fetchArticles?page=" + page;
    $.ajax({
    type: "GET",
    url: loadUrl,
    async: false
    }).done(
    function(obj) {
    console.log(obj);
    $.each(obj.messages,
    function(key, messageObject) {
    var listItem = $('<li></li>', {
    class: 'blog-item'
    });
    var link = $('<a></a>').attr('href', messageObject.messageUrl);
    var description = $('<div></div>').attr('class', "blog-description");
    var h3Element = $('<h3 class="blog-title">' + messageObject.subject + '</h3>');
    //var img = $('<img>').attr('src', messageObject.imageUrl).attr("title", messageObject.subject).attr("att", messageObject.subject);
    var img = $('<div></div>', {
    class: 'blog-image ratio',
    style: 'background-image: url("' + messageObject.imageUrl + '")'
    });


    var datum = $('<div>' + messageObject.post_date + '</div>').addClass('date_created blog-date');

    var aantalKudos = $('<span>' + messageObject.kudos + '</span>').addClass('blog-kudos nr_of_kudos');
    var aantalViews = $('<span>' + messageObject.views +'</span>').addClass('blog-views nr_of_views');
    var meta = $('<div />', {
    class: 'blog-meta'
    });
    meta.append(aantalKudos);
    meta.append(aantalViews);


    $(aantalKudos, aantalViews)

    link.append(img);

    description.append(h3Element);
    description.append(meta);

    //description.append(aantalViews);
    //description.append(aantalKudos);
    description.append(datum);
    link.append(description);

    listItem.append(link);


    //                 $("#latest_blog_posts_list li:last").after(listItem);
    bricklayer.append(listItem[0]);


    $(window).scrollTop($(window).scrollTop() + 200);

    if (page == obj.pages)
    {
    //Remove the button since it's not needed anymore
    $("#loadmore").remove();
    }
    else{
    page++;
    $("#loadmore").show();
    }

    $("#waitSpinner").hide();
    });
    });
    });
    }



    })(LITHIUM.jQuery);
    </@liaAddScript>
</#if>