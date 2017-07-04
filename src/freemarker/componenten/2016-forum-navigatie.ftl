<#assign myQuery = "SELECT title, id FROM categories WHERE ancestor_categories.id = 'healthy_living' ORDER BY position ASC" />
<#assign categories = rest("2.0","/search?q=" + myQuery?url('UTF-8')).data.items />

<div class="center-content">

<@component id="2016-section-heading" titel="Forum" subtitel="Stel vragen, meng je in discussies en ontdek waar nu over gepraat wordt" marker="true" />
    <div class="forum-navigation">
        <ul class="forum-navigation-parent">
        <#list categories as categorie>
            <#assign catID = categorie.id />
            <li class="col-category col-${utils.css.toValidClassName(categorie.id)} nav-column">
                <div class="forum-navigation-cat">
                ${categorie.title}
                </div>

                <#assign boardsQuery = "SELECT id, title, short_title, view_href FROM boards WHERE ancestor_categories.id = '" + catID + "' ORDER BY position ASC" />
                <#assign boards = rest("2.0","/search?q=" + boardsQuery?url('UTF-8')).data.items />

                <ul class="forum-boards">
                    <#list boards as board>

                        <#assign postsCountQuery = "SELECT count(*) FROM messages WHERE board.id = '"+board.id+"' and depth = 0" />
                        <#assign postscount = rest("2.0","/search?q=" + postsCountQuery?url('UTF-8')).data />

                        <li class="forum-board"><a href="${board.view_href}" title="${board.title}">${board.title}&nbsp;(${postscount.count})</a>
                        </li>
                    </#list>
                </ul>

            </li>
        </#list>
        </ul>
    </div>
</div>


<@liaAddScript>

LITHIUM.jQuery(function($) {

$('.col-category').each(function(){
$(this).addClass("closed");
}).on('click', function(){
$(this).toggleClass('closed');
});

}(LITHIUM.jQuery));

</@liaAddScript>