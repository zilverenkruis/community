ZK.shortenMessage = function($, textLength) {
        var textLength = textLength || 300;
        var ideaPage = $('.lia-quilt-idea-exchange-page-zk-ideas2016');
        // if(ideaPage.length) {

        // }

        //ideas short messages
        function shortText(parent, textLength, articleURL) {
            var text;
            var par = $(parent);
            var ps =  $(par).children('p');
            if(ps.length) {
            	// console.log('p');
                $(ps).each(function(){
                    $(this).text($(this).text().replace(/(<([^>]+)>)/ig,""));
                });
                text = ps
                .contents()
                .filter(function(){
                    return this.nodeType !== 1;
                });                                
            } else {
            	// console.log('no p');
                //$('.lia-message-body-content').text($(this).text().replace(/(<([^>]+)>)/ig,""));
                text = par
                .contents()
                .filter(function(){
                    return this.nodeType !== 1;
                });                 
            }
            // console.log('test: ',text.text().length, textLength);

            if(text.text().length > textLength) {
                // console.log('articleURL,', articleURL.length);
                var readmore;
                if(articleURL.length) {
                    readmore = $("<a />", {
                        "text": "Lees meer",
                        "href":articleURL, 
                        "title": articleURL,
                        "style": "margin-left: 8px"
                    });
                }
                
                par.html(text.text().substring(0,textLength) + '...')
                    .append(readmore);
                // par.;
                            
            } else {
                par.html(text.text().substring(0,textLength));            
            }

            // var dots = text.text().length ? '...' : '';
        };
        var shortenIdea = (function() {
	        $(ideaPage).find('.lia-message-body-content').each(function(){
	            // var hoogte = $(this).outerHeight();
	            // //console.log(hoogte);
	            // if(hoogte > 100)  $(this).parent().addClass('shorter');
                var articleURL = $(this).parent().parent().find('.idea-article-link').attr('href');
                // idea-article-link
				shortText($(this), textLength, articleURL);
	        });	
        })();    
}