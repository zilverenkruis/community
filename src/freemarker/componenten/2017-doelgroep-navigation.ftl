  <#attempt>
    <#assign diabetesPostsQ = "SELECT count(*) FROM messages WHERE labels.text='Diabetes' AND depth=0" />
    <#assign diabetesPosts = rest("2.0", "/search?q=${diabetesPostsQ?url}") />

    <#if diabetesPosts?? && diabetesPosts?has_content && diabetesPosts.data?? && diabetesPosts.status == "success">
        <#assign diabetesCount = diabetesPosts.data.count />
    </#if>

    <#assign hartPostsQ = "SELECT count(*) FROM messages WHERE labels.text='Hart- en vaatziekten' AND depth=0" />
    <#assign hartPosts = rest("2.0", "/search?q=${hartPostsQ?url}") />

    <#if hartPosts?? && hartPosts?has_content && hartPosts.data?? && hartPosts.status == "success">
        <#assign hartCount = hartPosts.data.count />
    </#if>

    <#assign mantelzorgPostsQ = "SELECT count(*) FROM messages WHERE labels.text='Mantelzorg' AND depth=0" />
    <#assign mantelzorgPosts = rest("2.0", "/search?q=${mantelzorgPostsQ?url}") />

    <#if mantelzorgPosts?? && mantelzorgPosts?has_content && mantelzorgPosts.data?? && mantelzorgPosts.status == "success">
        <#assign mantelzorgCount = mantelzorgPosts.data.count />
    </#if>

    <#assign seniorenPostsQ = "SELECT count(*) FROM messages WHERE labels.text='Senioren' AND depth=0" />
    <#assign seniorenPosts = rest("2.0", "/search?q=${seniorenPostsQ?url}") />

    <#if seniorenPosts?? && seniorenPosts?has_content && seniorenPosts.data?? && seniorenPosts.status == "success">
        <#assign seniorenCount = seniorenPosts.data.count />
    </#if>
  <#recover>
  </#attempt>

  <div class="main-community-nav-2017">
    <div class="wrapper center-content">
      <@component id="2016-section-heading" titel="Praat mee over onderwerpen die jou raken" />
      <ul class="inline-grid desktop-one-half mobile-one-second">
        <li class="grid-item main-nav-item">
          <a href="/t5/Diabetes/ct-p/Diabetes" title="Diabetes" alt="Diabetes" class="Diabetes nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-Diabetes.jpg")}" alt="Diabetes">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Diabetes</h3>
                <#if diabetesCount gt 0 >
                  <div class="nav-nrofmessages">${diabetesCount?c} discussies</div>
                </#if>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Hart-en-vaatziekten/ct-p/Hart" title="Hart- en vaatziekten" alt="Hart- en vaatziekten" class="Hart-en-vaatziekten nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-Hart.jpg")}" alt="Hart- en vaatziekten">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Hart- en vaatziekten</h3>
                <#if hartCount gt 0 >
                  <div class="nav-nrofmessages">${hartCount?c} discussies</div>
                </#if>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Mantelzorg/ct-p/Mantelzorg" title="Mantelzorg" alt="Mantelzorg" class="Mantelzorg nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-Mantelzorg.jpg")}" alt="Mantelzorg">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Mantelzorg</h3>
                <#if mantelzorgCount gt 0 >
                  <div class="nav-nrofmessages">${mantelzorgCount?c} discussies</div>
                </#if>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Senioren/ct-p/Senioren" title="Ouder worden" alt="Ouder worden" class="Ouder-worden nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-Senioren.jpg")}" alt="Senioren">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Senioren</h3>
                <#if seniorenCount gt 0 >
                  <div class="nav-nrofmessages">${seniorenCount?c} discussies</div>
                </#if>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
      </ul>
    </div>
  </div>

