<div class="full-width-paragraph section-join">
    <div class="center-content">
    <#if user.anonymous>
       <@component id="2016-section-heading" titel="Word lid van de community!" subtitel="Maak een account aan en stel je vragen, praat mee over onderwerpen en help andere leden." btnlink="/t5/user/userregistrationpage/registration-type/invitation_id?dest_url=https:%2F%2Fforum.zilverenkruis.nl%2F" btntitel="Maak een account aan"/>
       <div class="lia-link-arrow-wrapper">
           <a class="lia-link-navigation lia-link-arrow" href="/t5/user/userloginpage?dest_url=https%3A%2F%2Fforum.zilverenkruis.nl">Inloggen</a>
       </div>
    <#else>
       <@component id="2016-section-heading" titel="Zelf een vraag stellen?" subtitel="Start een discussie, stel een vraag of deel je ervaringen met andere leden" btnlink="/t5/forums/postpage/choose-node/true" btntitel="Plaats een nieuw topic"/>
    </#if>
    </div>
</div>