  <#attempt>
    <#assign diabetesPostsQ = "SELECT count(*) FROM messages WHERE label='Diabetes'" />
    <#assign diabetesPosts = rest("2.0", "/search?q=${diabetesPostsQ?url}") />
    <#assign hartPostsQ = "SELECT topics.count(*) FROM categories WHERE id='Hart'" />
    <#assign hartPosts = rest("2.0", "/search?q=${hartPostsQ?url}") />
    <#assign mantelzorgPostsQ = "SELECT topics.count(*) FROM categories WHERE id='Mantelzorg'" />
    <#assign mantelzorgPosts = rest("2.0", "/search?q=${mantelzorgPostsQ?url}") />
    <#assign seniorenPostsQ = "SELECT topics.count(*) FROM categories WHERE id='Senioren'" />
    <#assign seniorenPosts = rest("2.0", "/search?q=${seniorenPostsQ?url}") />
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
                <img src="${asset.get("/html/assets/nav-doelgroep-diabetes.jpg")}" alt="Diabetes">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Diabetes</h3>
                <div class="nav-nrofmessages">${diabetesPosts.data.items[0].topics.count} discussies</div>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Hart-en-vaatziekten/ct-p/Hart" title="Hart- en vaatziekten" alt="Hart- en vaatziekten" class="Hart-en-vaatziekten nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-hart-vaatziekten.jpg")}" alt="Hart- en vaatziekten">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Hart- en vaatziekten</h3>
                <div class="nav-nrofmessages">${hartPosts.data.items[0].topics.count} discussies</div>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Mantelzorg/ct-p/Mantelzorg" title="Mantelzorg" alt="Mantelzorg" class="Mantelzorg nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-mantelzorg.jpg")}" alt="Mantelzorg">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Mantelzorg</h3>
                <div class="nav-nrofmessages">${mantelzorgPosts.data.items[0].topics.count} discussies</div>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
        <li class="grid-item main-nav-item">
          <a href="/t5/Senioren/ct-p/Senioren" title="Senioren" alt="Senioren" class="Senioren nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/nav-doelgroep-senioren.jpg")}" alt="Senioren">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Senioren</h3>
                <div class="nav-nrofmessages">${seniorenPosts.data.items[0].topics.count} discussies</div>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
      </ul>
    </div>
  </div>

