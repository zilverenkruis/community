ZK.svgCorner = function(fillColor) {
        
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
}