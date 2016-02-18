<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js"></script>
</head>
<body>
<h2>
	D3 reading from CSV file
</h2> 
	<script type="text/javascript">
		d3.csv("data.csv", function(myArrayOfObjects) {
			myArrayOfObjects.forEach(function(d) {
				console.log(d.x + " " + d.y);
			});
		});
		
		var data = [1, 2, 3, 4, 5];
		var scale = d3.scale.linear()
					.domain([1,5]) // Data space i.e. the actual data
					.range([0,100]); // Pixel space to be mapped to
		
		var svg = d3.select("body").append("svg")
				  .attr("width", 500)
				  .attr("height", 500);
		
		svg.selectAll("rect").data(data)
					.enter().append("rect")
					.attr("x",scale)
					.attr("y",50)
					.attr("width",5)
					.attr("height",5);
					
		
	</script>
</body>
</html>