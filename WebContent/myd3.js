function collapse(d){
     if (d.children) {
       d._children = d.children;
       d._children.forEach(collapse);
       d.children = null;
     }
};
function update(source) {

  // Compute the new tree layout.
  var nodes = tree.nodes(root).reverse(),
      links = tree.links(nodes);

  // Normalize for fixed-depth.
  nodes.forEach(function(d) { d.y = d.depth * 180; });

  // Update the nodes.
  var node = svg.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .on("click", click);

  nodeEnter.append("circle")
      .attr("r", 1e-6)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeEnter.append("text")
      .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
      .attr("dy", ".35em")
      .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
      .text(function(d) { return d.name; })
      .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
      .attr("r", 4.5)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeUpdate.select("text")
      .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .remove();

  nodeExit.select("circle")
      .attr("r", 1e-6);

  nodeExit.select("text")
      .style("fill-opacity", 1e-6);

  // Update the links.
  var link = svg.selectAll("path.link")
      .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
        var o = {x: source.x0, y: source.y0};
        return diagonal({source: o, target: o});
      });

  // Transition links to their new position.
  link.transition()
      .duration(duration)
      .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
      .duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        return diagonal({source: o, target: o});
      })
      .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
    d.x0 = d.x;
    d.y0 = d.y;
  });
};

function generateFileName(node){
	var node_name = node.parent.name + "&" + node._name;
    return node_name;
};

function getCheckPointNumber(name,pos){
	if(name != null && name != "")
		return name.split("to")[pos];
	else
		return false;
};

function updateLegend(initial_data){

	document.getElementById('subframe2').innerHTML = "";
	var svg1 = d3.select('#subframe2')
				.append('svg')
				.attr('width', '100%')
				.attr('height', '100%')
				.append('g')
				.attr('transform', 'translate(' + margins.left + ',' + margins.top + ')');
	
	var count = 0;
	svg1.append('rect')
	.attr('fill', '#d3d3d3')
	.attr('width', '100%')
	.attr('height', '100%')
	.attr('x', margins.left)
	.attr('y', margins.top);
	
series.forEach(function (s, i) {
	if(mapForSelectedCheckpoints[s.name]){		
		svg1.append('text')
        .attr('fill', 'black')
        .attr('x', margins.left + 10)
        .attr('y', (count + i) * 24 + 32)
        .attr("font-family", "Comic sans MS")
        .attr("font-size", "12px")
        .text(s.name)
        .on("click",function() {
        	if(mapForSelectedCheckpoints[s.name])
        		mapForSelectedCheckpoints[s.name] = false;
        	else
        		mapForSelectedCheckpoints[s.name] = true;
        	updateLegend(initial_data); });
    
var myRect = svg1.append('rect')
        .attr('fill', colours[i%colours.length])        
        .attr('width', 60)
        .attr('height', 20)
        .attr('x', margins.left + 200)
        .attr('y', (count + i) * 24 + 20)
        .style('cursor', "pointer");
		if(mapForSelectedLegends[s.name])
			myRect.style('opacity', 0.3);
        myRect.on("click", function () {displayUpdatedChartWithRescaling(s.name, initial_data);});
    
    
    
    
    count++;
    
    svg1.append('text')
    .attr('fill', 'black')
    .attr('x', margins.left + 10)
    .attr('y', (count + i) * 24 + 32)
    .attr("font-family", "Comic sans MS")
    .attr("font-size", "12px")
    .text(getCheckPointNumber(s.name,0) + ": " + s.firstCheckPoint);
    
    count++;
    
    svg1.append('text')
    .attr('fill', 'black')
    .attr('x', margins.left + 10)
    .attr('y', (count + i) * 24 + 32)
    .attr("font-family", "Comic sans MS")
    .attr("font-size", "12px")
    .text(getCheckPointNumber(s.name,1) + ": " + s.secondCheckPoint);
    
	}
	else{
		
		svg1.append('text')
	        .attr('fill', 'black')
	        .attr('x', margins.left + 10)
	        .attr('y', (count + i) * 24 + 32)
	        .attr("font-family", "Comic sans MS")
	        .attr("font-size", "12px")
	        .text(s.name)
	        .on("click",function() { 
	        	if(mapForSelectedCheckpoints[s.name])
	        		mapForSelectedCheckpoints[s.name] = false;
	        	else
	        		mapForSelectedCheckpoints[s.name] = true;
	        	updateLegend(initial_data); });
		
				
var myRect = svg1.append('rect')
            .attr('fill', colours[i%colours.length])            
            .attr('width', 60)
            .attr('height', 20)
            .attr('x', margins.left + 200)
            .attr('y', (count + i) * 24 + 20)
            .style('cursor', "pointer");
			if(mapForSelectedLegends[s.name])
				myRect.style('opacity', 0.3);

            myRect.on("click", function () {displayUpdatedChartWithRescaling(s.name, initial_data);});
	    
	    
	}
 });
};

function updateFileName(fileNode){
	if(fileNode.name.indexOf("aggregate") >= 0)
		fileNode.name = "aggregate.log";
	else
		fileNode.name = "individual.log";
}

function click(d){
  if (d.children) {	  
      d._children = d.children;
      d.children = null;
  } else {	  
      d.children = d._children;
      d._children = null;
  }
  
  // If the node has a parent, then collapse its child nodes.
    if (d.parent) {
        d.parent.children.forEach(function(element) {
           if (d !== element) {
            collapse(element);
            }
          });
        }
    
    if(d.children != null){
    var server_child = d.children;
    
    server_child.forEach(function(node){
    	if(node.children == null && node._children == null){
    		node._name = node.name;
    		updateFileName(node);    		
    	}
    })    
    }
    
    update(d);    
         
   /* Code to get the complete file name from the directory structure */
   if(d.children == null && d._children == null){
	  d.url = "/ui/admin/paymentTimingLogs/TreeRootViewer";
      d.url = d.url + "/" + generateFileName(d);
      console.log(d.url);
   }
   
   if (d.url) {
        var win = window.open(d.url,'_blank');
        win.focus();
   }

};

/* 
 * Function to initialize the margins, width, height of the Page as 
 * well as deciding on the width of the Legend Panel */

function intializeBoundaryForPage(dataset){	
	 yMax = dataset[0].data.length;
	 margins = {
	    top: 10,
	    left: 40,
	    right: 10,
	    bottom: 20
	},
	legendPanel = {
	    width: 180
	},
	width = document.getElementById("subframe1").clientWidth - margins.left - margins.right,
	height = yMax*50 - margins.top - margins.bottom;        
};

/*
* Function to load the data from the file i.e. the series info
* and to load the dataset javascript object and convert it into an 
 * array type so as to pass it to d3.layout.stack function in order
* to get a stackedBarChart as required */

function loadDataFromFile(dataset){
    series = dataset.map(function (d) {
        return {
        	name: d.name,
        	firstCheckPoint: d.checkPointFrom,
        	secondCheckPoint: d.checkPointTo
        };
    }),
    dataset = dataset.map(function (d) {
    	if(mapForSelectedLegends[d.name])
    		return d.data.map(function (o) {
    			return {
    				name: d.name,
    				firstCheckPoint: d.checkPointFrom,
    				secondCheckPoint: d.checkPointTo,        		
    				y: 0,
    				x: o.time
    			};
    		});
    	else
            return d.data.map(function (o) {
            	return {
            		name: d.name,
            		firstCheckPoint: d.checkPointFrom,
            		secondCheckPoint: d.checkPointTo,        		
                	y: +o.count,
                    x: o.time
                };
            });
    }),
    stack = d3.layout.stack();

stack(dataset);
/*var xAxisHeight = document.getElementById('frame1').clientHeight - 40;
var yAxisHeight = document.getElementById('frame1').clientHeight - (yMax * 50);*/

dataset = dataset.map(function (group) {
    return group.map(function (d) {
        return {
        	name: d.name,
            x: d.y,
            y: d.x,
            x0: d.y0,
            firstCheckPoint: d.firstCheckPoint,
            secondCheckPoint: d.secondCheckPoint
        };
    });
});
return dataset;
};

/*
* Function to display/create the bar graphs on the svg element passed
* to the function based on the updated dataset returned by the 
 * d3.layout.stack function. This function will be called again
* in case of interactive legends where a user selection should hide a particular
* bar graph on the screen. */

function displayStackedBarOnPage(org_dataset,dataset){
	document.getElementById('subframe1').innerHTML = "";
	
	 svg = d3.select('#subframe1')
    .append('svg')
    .attr('width', '100%')
    .attr('height', height +  margins.top + margins.bottom)
    .append('g')
    .attr('transform', 'translate(' + margins.left + ',' + margins.top + ')'),
    
    xMax = d3.max(dataset, function (group) {
        return d3.max(group, function (d) {
            return d.x + d.x0;
        });
    }),
    xScale = d3.scale.linear()
        .domain([0, xMax])
        .range([0, width]),
    months = dataset[0].map(function (d) {
        return d.y;
    }),
    yScale = d3.scale.ordinal()
        .domain(months)
        .rangeRoundBands([0, height], .1),
    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient('bottom'),
    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient('left'),
    //colours = d3.scale.category10(),
    //  colours = ["#2E8B57","#3CB371","#66CDAA","#20B2AA", "#008B8B", "#00CED1", "#00FFFF", "#40E0D0", "#7FFFD4", "#5F9EA0", "#4682B4", "#6495ED", "#1E90FF",
     //            "#87CEEB", "#191970", "#6A5ACD", "#BA55D3", "#9932CC"];
	colours = ["#FF4500","#FF6347","#FFA07A","#FFA500","#9ACD32","#98FB98","#20B2AA","#7FFFD4","#6495ED","#7B68EE","#BA55D3","#DB7093","#F4A460","#FFDAB9","#B0C4DE","#C0C0C0"]; 
    groups = svg.selectAll('g')
        .data(dataset)
        .enter()
        .append('g')
        .style('fill', function (d, i) {
        	return colours[i%colours.length];
    }),
    rects = groups.selectAll('rect')
        .data(function (d) {
        return d;
    })
        .enter()
        .append('rect')
        .on('mouseover', function (d) {
        var xPos = parseFloat(d3.select(this).attr('x')) / 2 + width/2;
        var yPos = parseFloat(d3.select(this).attr('y')) + yScale.rangeBand() / 2;

        d3.select('#tooltip')
            .style('left', xPos + 'px')
            .style('top', 500 + 'px')
            .select('#value')
            .html("Count: " + d.x + " Time: " + d.y + "<br>" + 
            		getCheckPointNumber(d.name,0) + ": " + d.firstCheckPoint + "<br>" + 
            		getCheckPointNumber(d.name,1) + ": "  + d.secondCheckPoint);
	        d3.select('#tooltip').classed('hidden', false);
    })
        .on('mouseout', function () {
        d3.select('#tooltip').classed('hidden', true);
    })
    .on("click", function (d) {displayUpdatedChartWithRescaling(d.name, org_dataset);})
    .attr('x', function (d) {
        return xScale(d.x0);
    })
        .attr('y', function (d, i) {
        	return yScale(d.y) + (yScale.rangeBand() - d3.min([yScale.rangeBand(),100]))/2;
    })
        .attr('height', function (d) {
        	return d3.min([yScale.rangeBand(),100]); 
    })
    .attr('width', 0)
    .transition().duration(1000)
    .attr('width', function (d) {
        return xScale(d.x);
    });
    
    svg.append('g')
        .attr('class', 'axis')
        .attr('transform', 'translate(0,' + height + ')')
        .call(xAxis);

svg.append('g')
    .attr('class', 'axis')
    .call(yAxis);

};

function createMappingForCheckpoints(dataset){
	mapForSelectedLegends = {};
	mapForSelectedCheckpoints = {};
	dataset.map(function (d) {
		mapForSelectedLegends[d.name] = false;
		mapForSelectedCheckpoints[d.name] = false;
	});
};

function displayUpdatedChartWithRescaling(name,org_dataset){
	if(mapForSelectedLegends[name])
		mapForSelectedLegends[name] = false;
	else
		mapForSelectedLegends[name] = true;
	
    intializeBoundaryForPage(org_dataset);	
    dataset = loadDataFromFile(org_dataset);	
	displayStackedBarOnPage(org_dataset, dataset);
	updateLegend(org_dataset);
	
};

