var ZK = function(){
    
    
    
    return {
        load: load    
    }
};//restructure some html elements for better layout
ZK.restructureHTML = function($) {    
    if($('.IdeaExchangePage').length || $('.IdeaPage').length) {
        $('.lia-message-idea .lia-message-heading').each(function(){
            $(this).find('.lia-message-subject').prependTo(this);
            $(this)[0].style.paddingTop = "0";
        });
    }
};ZK.removeEmptyRows = function($) {
    
        $('.lia-quilt-column-alley-single.lia-mark-empty').parent().parent().remove();
    
        var emptyReplies = $('.ForumTopicPage .lia-component-reply-list .linear-message-list');
        if(!$(emptyReplies).children().length) {
            $(emptyReplies).parent().parent().parent().parent().remove();
        }
};ZK.svgCorner = function(fillColor) {
        
        // var fillColor = typeof fillColor !== undefined ? fillColor: "#fff";		
        
        function cornerSVG() {
            
            
			var xmlns = "http://www.w3.org/2000/svg";   
		    var svgns = 'http://www.w3.org/1999/xlink';

			var svg = document.createElementNS(xmlns, 'svg');
			// svg.setAttribute("viewBox", "0 536.5 105 100");
		    svg.setAttribute("width", "100");
		    svg.setAttribute("height", "100");
		    // svg.setAttribute("style", "position: absolute; top: -3px;left: 0;fill: " + fillColor +";");
		    svg.setAttribute("style", "position: absolute; top: -3px;left: 0;");
		    svg.setAttribute("class", "icon-svg-corner");
			


		    var Node = document.createElementNS(xmlns,'use');

			Node.setAttributeNS(svgns,'xlink:href','#corner-icon-2');

		    svg.appendChild(Node);

		    return svg
		}

		return cornerSVG();
};ZK.avatars = function($) {
    
    //for now only resize avatars when messagelist 
    if ($('.message-list, .CommentList, .lia-message-author-avatar').length) {
        $('.lia-user-avatar-message').each(function(){
            
            $(this).attr('src', $(this).attr('src')
                .replace(/\d\dx\d\d/g, '100x100')
                .replace(/avatar-display-size\/message/g, 'avatar-display-size/profile'));
                
                //prevent flickering
                var av = this;
                
                setTimeout(function(){
                    $(av).css('display', 'block');
                }, 500);            
        });
    }
    
    
    
    
    //add corner to avatars
    var avatars = $('.author-avatar, .item-img-wrapper a, .lia-message-view .UserAvatar');

    $(avatars).each(function(){
        svgCorner = ZK.svgCorner().cloneNode(true);
        // svgCorner = ZK.svgCorner("#D6EFF0").cloneNode(true);
        // svgCorner = ZK.svgCorner("#ddeaf5").cloneNode(true);

        $(this).append(svgCorner);
    });    
};ZK.shortenMessage = function($, textLength) {
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
};/* =============================================================
 * bootstrap-collapse.js v2.3.2
 * http://getbootstrap.com/2.3.2/javascript.html#collapse
 * =============================================================
 * Copyright 2013 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


ZK.accordion = function($) {

  "use strict"; // jshint ;_;


 /* COLLAPSE PUBLIC CLASS DEFINITION
  * ================================ */

  var Collapse = function (element, options) {
    this.$element = $(element)
    this.options = $.extend({}, $.fn.collapse.defaults, options)

    if (this.options.parent) {
      this.$parent = $(this.options.parent)
    }

    this.options.toggle && this.toggle()
  }

  Collapse.prototype = {

    constructor: Collapse

  , dimension: function () {
      var hasWidth = this.$element.hasClass('width')
      return hasWidth ? 'width' : 'height'
    }

  , show: function () {
      var dimension
        , scroll
        , actives
        , hasData

      if (this.transitioning || this.$element.hasClass('in')) return

      dimension = this.dimension()
      scroll = $.camelCase(['scroll', dimension].join('-'))
      actives = this.$parent && this.$parent.find('> .accordion-group > .in')

      if (actives && actives.length) {
        hasData = actives.data('collapse')
        if (hasData && hasData.transitioning) return
        actives.collapse('hide')
        hasData || actives.data('collapse', null)
      }

      this.$element[dimension](0)
      this.transition('addClass', $.Event('show'), 'shown')
      $.support.transition && this.$element[dimension](this.$element[0][scroll])
    }

  , hide: function () {
      var dimension
      if (this.transitioning || !this.$element.hasClass('in')) return
      dimension = this.dimension()
      this.reset(this.$element[dimension]())
      this.transition('removeClass', $.Event('hide'), 'hidden')
      this.$element[dimension](0)
    }

  , reset: function (size) {
      var dimension = this.dimension()

      this.$element
        .removeClass('collapse')
        [dimension](size || 'auto')
        [0].offsetWidth

      this.$element[size !== null ? 'addClass' : 'removeClass']('collapse')

      return this
    }

  , transition: function (method, startEvent, completeEvent) {
      var that = this
        , complete = function () {
            if (startEvent.type == 'show') that.reset()
            that.transitioning = 0
            that.$element.trigger(completeEvent)
          }

      this.$element.trigger(startEvent)

      if (startEvent.isDefaultPrevented()) return

      this.transitioning = 1

      this.$element[method]('in')

      $.support.transition && this.$element.hasClass('collapse') ?
        this.$element.one($.support.transition.end, complete) :
        complete()
    }

  , toggle: function () {
      this[this.$element.hasClass('in') ? 'hide' : 'show']()
    }

  }


 /* COLLAPSE PLUGIN DEFINITION
  * ========================== */

  var old = $.fn.collapse

  $.fn.collapse = function (option) {
    return this.each(function () {
      var $this = $(this)
        , data = $this.data('collapse')
        , options = $.extend({}, $.fn.collapse.defaults, $this.data(), typeof option == 'object' && option)
      if (!data) $this.data('collapse', (data = new Collapse(this, options)))
      if (typeof option == 'string') data[option]()
    })
  }

  $.fn.collapse.defaults = {
    toggle: true
  }

  $.fn.collapse.Constructor = Collapse


 /* COLLAPSE NO CONFLICT
  * ==================== */

  $.fn.collapse.noConflict = function () {
    $.fn.collapse = old
    return this
  }



// extend 'show' functionality
    var _show = $.fn.collapse.Constructor.prototype.show;

    $.fn.collapse.Constructor.prototype.show = function() {
        _show.apply(this, arguments);
        this.$element.parent().find('.accordion-heading .info').text('Sluiten');

    };

// extend 'hide' functionality
    var _hide = $.fn.collapse.Constructor.prototype.hide;

    $.fn.collapse.Constructor.prototype.hide = function() {
        _hide.apply(this, arguments);
        this.$element.parent().find('.accordion-heading .info').text('Bekijk of wijzig');

    };




 /* COLLAPSE DATA-API
  * ================= */

  $(document).on('click.collapse.data-api', '[data-toggle=collapse]', function (e) {
    var $this = $(this), href
      , target = $this.attr('data-target')
        || e.preventDefault()
        || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
      , option = $(target).data('collapse') ? 'toggle' : $this.data()
    $this[$(target).hasClass('in') ? 'addClass' : 'removeClass']('collapsed')
    $(target).collapse(option)
  })

};;ZK.scrollTo = function($) {
    "use strict";
    
    $("a[data-scrollto]").on("click", function(e){
        e.preventDefault();
        var target = $('#ideasection');
        var targetName = $(this).data("scrollto");
        target = $(targetName);
        //target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
            $('html, body').animate({
            scrollTop: target.offset().top
            }, 1000);
            return false;
        }          
    });
        
};;ZK.commentCount = function($) {
	if (LITHIUM.jQuery('.lia-component-ideas-widget-idea-message-view').length) {
		LITHIUM.jQuery('.lia-section-header-title').prepend(LITHIUM.jQuery('.lia-message-comment-view').text().split(' ')[0] + ' ');
	}    
};ZK.filterDropdown = function($) {
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
}


;ZK.createFullwidthBG = function($) {
    
    var row = $('.lia-quilt-row-main-one');    
    var rowHeight = row.outerHeight(true) + 80 + 'px';
    
    var bg = $('<div />', {
        'class': 'full-width-bg',
        'style': 'height: ' + rowHeight
    });

    $(row).prepend(bg);    
    
};LITHIUM.jQuery(function($) {

        ZK.restructureHTML($);
        ZK.removeEmptyRows($);
        ZK.svgCorner();
        // ZK.shortenMessage($,400);
        // ZK.filterDropdown($);
        // ZK.commentCount($);
        ZK.accordion($);
        // ZK.avatars($);
        ZK.avatars($);
        // ZK.correctBGHeight($);

        // ZK.createFullwidthBG($);
        ZK.scrollTo($);


}(LITHIUM.jQuery));