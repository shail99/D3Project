<!DOCTYPE html>
<meta charset="utf-8">
<head>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
<script src="//d3js.org/d3.v3.js"></script>
<script src="myd3.js" type="text/javascript"></script>
<div id="mainframe" style="width: 100%; height: 100%">
	<div id="subframe1" style="width: 70%; float: left; overflow: auto">
<script>

var json_dataset =
[
  {
    "name": "1to2",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "7"
      },
      {
        "time": "00:04",
        "count": "7"
      },
      {
        "time": "00:05",
        "count": "5"
      }
    ]
  },
  {
    "name": "2to3",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "3to4",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "15"
      },
      {
        "time": "00:04",
        "count": "21"
      },
      {
        "time": "00:05",
        "count": "16"
      }
    ]
  },
  {
    "name": "4to5",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "5to6",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "6to7",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "1"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "7to8",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "3"
      },
      {
        "time": "00:04",
        "count": "4"
      },
      {
        "time": "00:05",
        "count": "3"
      }
    ]
  },
  {
    "name": "8to9",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "9to10",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "2"
      },
      {
        "time": "00:04",
        "count": "3"
      },
      {
        "time": "00:05",
        "count": "2"
      }
    ]
  },
  {
    "name": "10to11",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "507"
      },
      {
        "time": "00:04",
        "count": "480"
      },
      {
        "time": "00:05",
        "count": "548"
      }
    ]
  },
  {
    "name": "11to12",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "12to13",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "1"
      },
      {
        "time": "00:04",
        "count": "1"
      },
      {
        "time": "00:05",
        "count": "1"
      }
    ]
  },
  {
    "name": "13to14",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "4"
      },
      {
        "time": "00:04",
        "count": "4"
      },
      {
        "time": "00:05",
        "count": "3"
      }
    ]
  },
  {
    "name": "14to15",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "15to16",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "0"
      },
      {
        "time": "00:04",
        "count": "0"
      },
      {
        "time": "00:05",
        "count": "0"
      }
    ]
  },
  {
    "name": "16to17",
    "checkpointFrom": "Payment.Authorization.Workflow",
    "checkpointTo": "Authorization_Workflow.TokenId.Registration",
    "data": [
      {
        "time": "00:02",
        "count": "2"
      },
      {
        "time": "00:04",
        "count": "2"
      },
      {
        "time": "00:05",
        "count": "2"
      }
    ]
  }
];

	createMappingForCheckpoints(json_dataset);

	intializeBoundaryForPage(json_dataset);	
	var dataset = loadDataFromFile(json_dataset);	
	displayStackedBarOnPage(json_dataset,dataset);
   
  </script>
   </div>
<div id="subframe2" style="width: 30%; height: 600px; float: right; overflow: auto">
 <script>
 	updateLegend(json_dataset);
</script>
</div>
</div>
<div id="tooltip" class="hidden">
    <p><span id="value">100</span>
    </p>
</div>
</body>
