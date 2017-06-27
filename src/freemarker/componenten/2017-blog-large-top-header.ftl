<#import "common-functions.ftl" as util >

<#if page?? && page.name?? && page.name == "BlogArticlePage">

    <#assign msgId = page.context.message.uniqueId />
    <#assign teaserQ = "SELECT teaser FROM messages WHERE id='${msgId}'" />
    <#assign teaserRes = rest("2.0", "/search?q=${teaserQ?url}") />
    <#if teaserRes?? && teaserRes?has_content && teaserRes.data?? && teaserRes.data.size gt 0>
        <#assign teaser = teaserRes.data.items[0].teaser />

        <#assign imgUrl = util.mediaURIfromHTML(teaser)?replace("image-size.+", "", "r") />

        <#assign bigImgUrl = imgUrl />
        <#assign mobileImgUrl = imgUrl + "/image-size/large" />


        <#if imgUrl?? && imgUrl != skin.images.image_not_found.url>
            <@util.wrapComponent name="blog-banner-2017">


            <img sizes="(min-width: 662px) 100vw, 100vw"
                 srcset="${bigImgUrl} 1900w,
	${mobileImgUrl} 900w"

                 src="bigImgUrl">


            </@util.wrapComponent>
        </#if>
    </#if>
</#if>