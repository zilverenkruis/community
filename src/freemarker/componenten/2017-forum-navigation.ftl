<#attempt>
    <#assign countCollectiviteitQ = "select count(*) from messages where board.id = 'Collectiviteit' and depth=0 AND conversation.style='forum'" />
    <#assign countCollectiviteit = rest("2.0", "/search?q=${countCollectiviteitQ?url}") />
    <#if countCollectiviteit?? && countCollectiviteit?has_content && countCollectiviteit.data?? && countCollectiviteit.status == "success">
        <#assign collectiviteitCount = countCollectiviteit.data.count />
    </#if>

    <#assign countAlternatiefQ = "select count(*) from messages where board.id = 'alternatief' and depth=0 AND conversation.style='forum'" />
    <#assign countAlternatief = rest("2.0", "/search?q=${countAlternatiefQ?url}") />
    <#if countAlternatief?? && countAlternatief?has_content && countAlternatief.data?? && countAlternatief.status == "success">
        <#assign alternatiefCount = countAlternatief.data.count />
    </#if>

    <#assign countFysioQ = "select count(*) from messages where board.id = 'Fysio' and depth=0 AND conversation.style='forum'" />
    <#assign countFysio = rest("2.0", "/search?q=${countFysioQ?url}") />
    <#if countFysio?? && countFysio?has_content && countFysio.data?? && countFysio.status == "success">
        <#assign fysioCount = countFysio.data.count />
    </#if>

    <#assign countHuisartsQ = "select count(*) from messages where board.id = 'Huisarts' and depth=0 AND conversation.style='forum'" />
    <#assign countHuisarts = rest("2.0", "/search?q=${countHuisartsQ?url}") />
    <#if countHuisarts?? && countHuisarts?has_content && countHuisarts.data?? && countHuisarts.status == "success">
        <#assign huisartsCount = countHuisarts.data.count />
    </#if>

    <#assign countHulpmiddelenQ = "select count(*) from messages where board.id = 'Hulpmiddelen' and depth=0 AND conversation.style='forum'" />
    <#assign countHulpmiddelen = rest("2.0", "/search?q=${countHulpmiddelenQ?url}") />
    <#if countHulpmiddelen?? && countHulpmiddelen?has_content && countHulpmiddelen.data?? && countHulpmiddelen.status == "success">
        <#assign hulpmiddelenCount = countHulpmiddelen.data.count />
    </#if>

    <#assign countMedicijnenQ = "select count(*) from messages where board.id = 'Medicijnen' and depth=0 AND conversation.style='forum'" />
    <#assign countMedicijnen = rest("2.0", "/search?q=${countMedicijnenQ?url}") />
    <#if countMedicijnen?? && countMedicijnen?has_content && countMedicijnen.data?? && countMedicijnen.status == "success">
        <#assign medicijnenCount = countMedicijnen.data.count />
    </#if>

    <#assign countMondzorgQ = "select count(*) from messages where board.id = 'Mondzorg' and depth=0 AND conversation.style='forum'" />
    <#assign countMondzorg = rest("2.0", "/search?q=${countMondzorgQ?url}") />
    <#if countMondzorg?? && countMondzorg?has_content && countMondzorg.data?? && countMondzorg.status == "success">
        <#assign mondzorgCount = countMondzorg.data.count />
    </#if>

    <#assign countPGBQ = "select count(*) from messages where board.id = 'PGB' and depth=0 AND conversation.style='forum'" />
    <#assign countPGB = rest("2.0", "/search?q=${countPGBQ?url}") />
    <#if countPGB?? && countPGB?has_content && countPGB.data?? && countPGB.status == "success">
        <#assign pgbCount = countPGB.data.count />
    </#if>

    <#assign countZiekenhuisQ = "select count(*) from messages where board.id = 'Ziekenhuis' and depth=0 AND conversation.style='forum'" />
    <#assign countZiekenhuis = rest("2.0", "/search?q=${countZiekenhuisQ?url}") />
    <#if countZiekenhuis?? && countZiekenhuis?has_content && countZiekenhuis.data?? && countZiekenhuis.status == "success">
        <#assign ziekenhuisCount = countZiekenhuis.data.count />
    </#if>

    <#assign countOverigQ = "select count(*) from messages where board.id = 'Overig' and depth=0 AND conversation.style='forum'" />
    <#assign countOverig = rest("2.0", "/search?q=${countOverigQ?url}") />
    <#if countOverig?? && countOverig?has_content && countOverig.data?? && countOverig.status == "success">
        <#assign overigCount = countOverig.data.count />
    </#if>

    <#assign countBeleidQ = "select count(*) from messages where board.id = 'Beleid' and depth=0 AND conversation.style='forum'" />
    <#assign countBeleid = rest("2.0", "/search?q=${countBeleidQ?url}") />
    <#if countBeleid?? && countBeleid?has_content && countBeleid.data?? && countBeleid.status == "success">
        <#assign beleidCount = countBeleid.data.count />
    </#if>

    <#assign countBuitenlandQ = "select count(*) from messages where board.id = 'Buitenland' and depth=0 AND conversation.style='forum'" />
    <#assign countBuitenland = rest("2.0", "/search?q=${countBuitenlandQ?url}") />
    <#if countBuitenland?? && countBuitenland?has_content && countBuitenland.data?? && countBuitenland.status == "success">
        <#assign buitenlandCount = countBuitenland.data.count />
    </#if>

    <#assign countPremieQ = "select count(*) from messages where board.id = 'Premie' and depth=0 AND conversation.style='forum'" />
    <#assign countPremie = rest("2.0", "/search?q=${countPremieQ?url}") />
    <#if countPremie?? && countPremie?has_content && countPremie.data?? && countPremie.status == "success">
        <#assign premieCount = countPremie.data.count />
    </#if>

    <#assign countGezondQ = "select count(*) from messages where board.id = 'Gezond' and depth=0 AND conversation.style='forum'" />
    <#assign countGezond = rest("2.0", "/search?q=${countGezondQ?url}") />
    <#if countGezond?? && countGezond?has_content && countGezond.data?? && countGezond.status == "success">
        <#assign gezondCount = countGezond.data.count />
    </#if>

    <#assign countKankerQ = "select count(*) from messages where board.id = 'Kanker' and depth=0 AND conversation.style='forum'" />
    <#assign countKanker = rest("2.0", "/search?q=${countKankerQ?url}") />
    <#if countKanker?? && countKanker?has_content && countKanker.data?? && countKanker.status == "success">
        <#assign kankerCount = countKanker.data.count />
    </#if>

    <#assign countOnlineQ = "select count(*) from messages where board.id = 'Online' and depth=0 AND conversation.style='forum'" />
    <#assign countOnline = rest("2.0", "/search?q=${countOnlineQ?url}") />
    <#if countOnline?? && countOnline?has_content && countOnline.data?? && countOnline.status == "success">
        <#assign onlineCount = countOnline.data.count />
    </#if>

    <#assign countZwangerschapQ = "select count(*) from messages where board.id = 'Zwangerschap' and depth=0 AND conversation.style='forum'" />
    <#assign countZwangerschap = rest("2.0", "/search?q=${countZwangerschapQ?url}") />
    <#if countZwangerschap?? && countZwangerschap?has_content && countZwangerschap.data?? && countZwangerschap.status == "success">
        <#assign zwangerschapCount = countZwangerschap.data.count />
    </#if>
    <#recover>
</#attempt>


<div class="main-community-nav-2017 forum-navigation">
    <div class="wrapper center-content">
    <@component id="2016-section-heading" titel="Stel vragen of deel je ervaringen" subtitel="Op een van onze forum-boards" />
        <ul class="inline-grid desktop-one-half mobile-one-second">
            <div class="nav-row">
                <li class="grid-item left-item main-nav-item has-subnav">
                    <a href="#" title="Vergoedingen" alt="Vergoedingen" class="Vergoedingen nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Vergoedingen.jpg")}" alt="Vergoedingen">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Vergoedingen</h3>
                                <div>9 subthema's</div>
                            </div>
                        </div>
                        <div class="clear-float"></div>
                    </a>
                    <div class="main-community-subnav-2017">
                        <ul class="nav-boards">
                            <li class="nav-board"><a href="/t5/Alternatieve-geneeswijzen/bd-p/Alternatief" title="Alternatieve geneeswijzen">Alternatieve geneeswijzen&nbsp;(${alternatiefCount})</a></li>
                            <li class="nav-board"><a href="/t5/Fysiotherapie/bd-p/Fysio" title="Fysiotherapie">Fysiotherapie&nbsp;(${fysioCount})</a></li>
                            <li class="nav-board"><a href="/t5/Huisarts/bd-p/Huisarts" title="Huisarts">Huisarts&nbsp;(${huisartsCount})</a></li>
                            <li class="nav-board"><a href="/t5/Hulpmiddelen/bd-p/Hulpmiddelen" title="Hulpmiddelen">Hulpmiddelen&nbsp;(${hulpmiddelenCount})</a></li>
                            <li class="nav-board"><a href="/t5/Medicijnen/bd-p/Medicijnen" title="Medicijnen">Medicijnen&nbsp;(${medicijnenCount})</a></li>
                            <li class="nav-board"><a href="/t5/Mondzorg/bd-p/Mondzorg" title="Mondzorg">Mondzorg&nbsp;(${mondzorgCount})</a></li>
                            <li class="nav-board"><a href="/t5/Persoonsgebonden-budget-PGB/bd-p/PGB" title="Persoonsgebonden budget (PGB)">Persoonsgebonden budget (PGB)&nbsp;(${pgbCount})</a></li>
                            <li class="nav-board"><a href="/t5/Ziekenhuiszorg-MSZ/bd-p/Ziekenhuis" title="Ziekenhuiszorg (MSZ)">Ziekenhuiszorg (MSZ)&nbsp;(${ziekenhuisCount})</a></li>
                            <li class="nav-board"><a href="/t5/Overige-vergoedingen/bd-p/Overig" title="Overige vergoedingen">Overige vergoedingen&nbsp;(${overigCount})</a></li>
                        </ul>
                    </div>
                </li>
                <li class="grid-item right-item main-nav-item">
                    <a href="/t5/Beleid-polis-en-regelgeving/bd-p/Beleid" title="Polis en beleid" alt="Polis en beleid" class="Polis-en-beleid nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Beleid.jpg")}" alt="Service & beleid">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Polis en beleid</h3>
                                <div class="nav-nrofmessages">${beleidCount} discussies</div>
                            </div>
                        </div>
                        <div class="clear-float"></div>
                    </a>
                </li>
            </div>
            <div class="nav-row">
                <li class="grid-item main-nav-item">
                    <a href="/t5/Buitenland/bd-p/Buitenland" title="Buitenland" alt="Buitenland" class="Buitenland nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Buitenland.jpg")}" alt="Buitenland">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Buitenland</h3>
                                <div class="nav-nrofmessages">${buitenlandCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="grid-item main-nav-item">
                    <a href="/t5/Collectiviteit/bd-p/Collectiviteit" title="Collectiviteit" alt="Collectiviteit" class="Collectiviteit nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Collectiviteit.jpg")}" alt="Collectiviteit">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Collectiviteit</h3>
                                <div class="nav-nrofmessages">${collectiviteitCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
            <div class="nav-row">
                <li class="grid-item main-nav-item">
                    <a href="/t5/Eigen-risico-en-premie/bd-p/Premie" title="Eigen risico en premie" alt="Eigen risico en premie" class="Eigen-risico-en-premie nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Premie.jpg")}" alt="Eigen risico en premie">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Eigen risico en premie</h3>
                                <div class="nav-nrofmessages">${premieCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="grid-item main-nav-item">
                    <a href="/t5/Gezond-leven/bd-p/Gezond" title="Gezond leven" alt="Gezond leven" class="Gezond-leven nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Gezond.jpg")}" alt="Gezond leven">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Gezond leven</h3>
                                <div class="nav-nrofmessages">${gezondCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
            <div class="nav-row">
                <li class="grid-item main-nav-item">
                    <a href="/t5/Leven-met-kanker/bd-p/Kanker" title="Leven met kanker" alt="Leven met kanker" class="Leven-met-kanker nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Kanker.jpg")}" alt="Leven met kanker">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Leven met kanker</h3>
                                <div class="nav-nrofmessages">${kankerCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="grid-item main-nav-item">
                    <a href="/t5/Zilveren-Kruis-Online/bd-p/Online" title="Zilveren Kruis online" alt="Zilveren Kruis online" class="Zilveren-Kruis-online nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Online.jpg")}" alt="Zilveren Kruis online">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Zilveren Kruis online</h3>
                                <div class="nav-nrofmessages">${onlineCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
            <div class="nav-row">
                <li class="grid-item main-nav-item">
                    <a href="/t5/Zwangerschap/bd-p/Zwangerschap" title="Zwangerschap" alt="Zwangerschap" class="Zwangerschap nav-2017-link">
                        <div class="item-content">
                            <div class="nav-visual">
                                <img src="${asset.get("/html/assets/nav-doelgroep-Zwangerschap.jpg")}" alt="Zwangerschap">
                            </div>
                            <div class="nav-text">
                                <h3 class="nav-title">Zwangerschap</h3>
                                <div class="nav-nrofmessages">${zwangerschapCount} discussies</div>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
        </ul>
    </div>
</div>

