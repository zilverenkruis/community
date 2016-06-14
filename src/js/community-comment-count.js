ZK.commentCount = function($) {
	if (LITHIUM.jQuery('.lia-component-ideas-widget-idea-message-view').length) {
		LITHIUM.jQuery('.lia-section-header-title').prepend(LITHIUM.jQuery('.lia-message-comment-view').text().split(' ')[0] + ' ');
	}    
}