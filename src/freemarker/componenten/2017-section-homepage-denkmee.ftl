<#attempt>
  <#assign countInnovatielabQ = "select count(*) from messages where board.id = 'Innovatielab' and depth=0 AND conversation.style='forum'" />
  <#assign countInnovatielab = rest("2.0", "/search?q=${countInnovatielabQ?url}") />
  <#if countInnovatielab?? && countInnovatielab?has_content && countInnovatielab.data?? && countInnovatielab.status == "success">
    <#assign innovatielabCount = countInnovatielab.data.count />
  </#if>
  <#recover>
</#attempt>

<div class="main-community-nav-2017">
  <div class="wrapper center-content">
    <ul class="inline-grid evenrow desktop-one-half mobile-one-second">
      <div class="nav-row">
        <li class="grid-item">
          <h3>Denk mee met Zilveren Kruis</h3>
          <p>Samen maken we onze producten en diensten beter.</p>
        </li>
        <li class="grid-item right-item main-nav-item">
          <a href="/t5/Innovatielab/ct-p/Innovatielab" title="Innovatielab" alt="Innovatielab" class="Innovatielab nav-2017-link">
            <div class="item-content">
              <div class="nav-visual">
                <img src="${asset.get("/html/assets/placeholder-diabetes.jpg")}" alt="Innovatielab">
              </div>
              <div class="nav-text">
                <h3 class="nav-title">Innovatielab</h3>
                <div>${innovatielabCount} discussies's</div>
              </div>
            </div>
            <div class="clear-float"></div>
          </a>
        </li>
      </div>
    </ul>
  </div>
</div>