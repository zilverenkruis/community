var shortenIdea;

LITHIUM.jQuery(function($){
"use strict";


	if (LITHIUM.jQuery('.lia-component-ideas-widget-idea-message-view').length) {
		LITHIUM.jQuery('.lia-section-header-title').prepend(LITHIUM.jQuery('.lia-message-comment-view').text().split(' ')[0] + ' ');
	}

	if (LITHIUM.jQuery('.lia-quilt-idea-exchange-page-zk-ideas2016').length ||  LITHIUM.jQuery('.lia-component-ideas-widget-idea-message-view').length) {



        function positionLikes(messAvatar, messageRoot, topPos) {
         
	            LITHIUM.jQuery(messageRoot)
	                .find('.lia-component-kudos')
	                .css({
	                	'top': topPos + 'px',
	                	//,'visibility' : 'visible'
	                	'visibility': 'visible'
	                })
					.fadeTo( "slow" , 1.0, function() {
				    // Animation complete.
				  	});  

			        	//LITHIUM.jQuery(this).attr('src'));
        };


        //hide avatars and change size
        var avatars = LITHIUM.jQuery('.lia-panel-message-root .lia-message-author-avatar');
	
		var messRootPadding = parseInt(LITHIUM.jQuery('#messageview .lia-panel-message-root').css('padding-top').slice(0, -2));

        LITHIUM.jQuery(avatars).each(function(){
        	var messAvatar = this;
            var messageRoot  = LITHIUM.jQuery(messAvatar).closest('.lia-panel-message-root');

        	//console.log(LITHIUM.jQuery(this).find('.lia-user-avatar-message'));
            var img = LITHIUM.jQuery(this).find('.lia-user-avatar-message');

            LITHIUM.jQuery(img).attr('src', LITHIUM.jQuery(img).attr('src').replace(/\d\dx\d\d/g, '102x102')); 

//LITHIUM.jQuery('.lia-js-data-messageUid-852').css('padding-top')
            // LITHIUM.jQuery(this)
            //     // .css('visibility', 'hidden')
            //     .find('.lia-user-avatar-message')
            //     .attr('src', LITHIUM.jQuery(this).attr('src').replace(/\d\dx\d\d/g, '102x102')   );
// LITHIUM.jQuery(this).attr('src').replace(/\d\dx\d\d/g, '102x102')




        	var topPos = LITHIUM.jQuery(messAvatar).outerHeight() + messRootPadding;

        	//console.log(topPos, LITHIUM.jQuery(messAvatar).outerHeight(true), messRootPadding);
        	


			positionLikes(messAvatar, messageRoot, topPos);
 
                             
        });






     //    .promise()
     //    .done(function(){

	    //     LITHIUM.jQuery(avatars).each(function() {
	    //         // var test = LITHIUM.jQuery(this)
	    //         //     .closest('.lia-panel-message-root')
	    //         //     .find('.lia-component-kudos');
	    //         //     // .css('top', '300px;')    
	            
	    //         // console.log('test:', test);
	    //         var photoHeight = LITHIUM.jQuery(this).outerHeight(true);
	            
	    //         LITHIUM.jQuery(this)
	    //             .closest('.lia-panel-message-root')
	    //             .find('.lia-component-kudos')
	    //             .css({
	    //             	'top': photoHeight + 'px',
	    //             	//,'visibility' : 'visible'
	    //             	'visibility': 'visible'
	    //             })
					// .fadeTo( "slow" , 1.0, function() {
				 //    // Animation complete.
				 //  	});                

	    //     });

     //    });


        //hide avatars and change size
       //  var avatars = LITHIUM.jQuery('.lia-panel-message-root .lia-message-author-avatar');
       //  LITHIUM.jQuery(avatars).each(function(){
       //      LITHIUM.jQuery(this)
       //          .css('visibility', 'hidden')
       //          .find('.lia-user-avatar-message').each(function(){
			    //     $(this).attr('src', $(this).attr('src').replace(/\d\dx\d\d/g, '102x102'));
			    // });                                
       //  });


        //position kudo buttons depending on avatar height


			//change avatar size, ideas
			// $()('.lia-user-avatar-message').each(function(){
			//     $(this).attr('src', $(this).attr('src').replace(/\d\dx\d\d/g, '102x102'));
			// });





		function cornerSVG() {
			var xmlns = "http://www.w3.org/2000/svg";   
		    var svgns = 'http://www.w3.org/1999/xlink';

			var svg = document.createElementNS(xmlns, 'svg');
			// svg.setAttribute("viewBox", "0 536.5 105 100");
		    svg.setAttribute("width", "100");
		    svg.setAttribute("height", "100");
		    svg.setAttribute("style", "position: absolute; top: -3px;left: 0;fill: #fff;");


		    var Node = document.createElementNS(xmlns,'use');

			Node.setAttributeNS(svgns,'xlink:href','#corner-icon-2');

		    svg.appendChild(Node);

		    return svg
		}

		var generateCorner = cornerSVG();

		LITHIUM.jQuery(avatars).each(function(){
			svgCorner = generateCorner.cloneNode(true);

			LITHIUM.jQuery(this).children('.lia-component-common-widget-user-avatar')[0].appendChild(svgCorner);
		});

		//older browsers
       // svg4everybody();

 

        //make avatars visible
        LITHIUM.jQuery(avatars).each(function() {
            LITHIUM.jQuery(this)
                .css('visibility', 'visible')
                .fadeTo( "slow" , 1.0, function() {
			    
			  	});           
        });




        //idea filters
        $('.lia-component-ideas-widget-statuses, .lia-component-ideas-widget-labels').on('click', function(){
            var that = this;
            $(this)
                .toggleClass('open')
                .find('.lia-panel-content-wrapper').toggleClass('open');
            
        }).on('mouseleave',  function() {
            $(this)
                .removeClass('open')
                .find('.lia-panel-content-wrapper').removeClass('open');                
        });

        //idea shorter
        var ideaPage = $('.lia-quilt-idea-exchange-page-zk-ideas2016');
        // if(ideaPage.length) {

        // }

        //ideas short messages
        function shortText(parent, limit) {
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
            // console.log(text.text().length);
            var dots = text.text().length ? '...' : '';
            par.html(text.text().substring(0,limit) + dots);
        };
        shortenIdea = (function() {
	        $(ideaPage).find('.lia-message-body-content').each(function(){
	            // var hoogte = $(this).outerHeight();
	            // //console.log(hoogte);
	            // if(hoogte > 100)  $(this).parent().addClass('shorter');
				shortText($(this), 250);
	        });	
        })();




	};


}(LITHIUM.jQuery));