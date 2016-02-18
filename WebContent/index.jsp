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
	</script>
</body>
</html>