<#include "common-functions.ftl">

<#if env?? && env.context?? && env.context.message??>
    <#assign msgId = env.context.message.uniqueId />
    <#assign msgUrl = env.context.message.webUi.url />
    <@wrapComponent name="message_social">
    <section class="message_social_container">
        <a href="" class="btn btn-normal  lia-link-navigation">Deel</a>
        <@displaySocialSharings msgSubject=env.context.message.subject msgUrl=msgUrl />
    </section>

    </@wrapComponent>
</#if>


<#macro displaySocialSharings msgSubject msgUrl>
    <#if msgUrl?? && msgUrl?has_content && msgSubject?? && msgSubject?has_content>
    <ul class="message_social_sharing">
        <@displayFacebookButton msgUrl=msgUrl />
      <@displayTwitterButton msgSubject msgUrl/>
      <@displayEmailButton msgSubject=msgSubject msgUrl=msgUrl />
    </ul>

    </#if>
</#macro>

<#macro displayFacebookButton msgUrl>
<li class="share_fb"><a target="_blank" href="http://www.facebook.com/sharer/sharer.php?u=${msgUrl}" title="Share on Facebook">Facebook</a></li>
</#macro>

<#macro displayTwitterButton msgSubject msgUrl>
<li class="share_twitter">
    <a href="http://twitter.com/share?text=${msgSubject?url}&url=${msgUrl?url}" title="Share on Twitter">Twitter</a>
</li>
</#macro>

<#macro displayEmailButton msgSubject msgUrl>
    <#if msgUrl?? && msgUrl?has_content>
    <li class="share_email">
        <a href="mailto:?subject=${msgSubject}&body=${msgUrl}" title="Share by email">Email</a>
    </li>
    </#if>
</#macro>