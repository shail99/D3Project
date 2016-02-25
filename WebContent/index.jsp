<!DOCTYPE html>
<meta charset="utf-8">
<style>
.axis path, .axis line {
    fill: none;
    stroke: black;
    shape-rendering: crispEdges;
}
.axis text {
    font-family: sans-serif;
    font-size: 11px;
}
#tooltip {
    position: absolute;
    text-align: left;
    width: auto;
    height: auto;
    padding: 10px;
    background-color: white;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    -webkit-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
    -moz-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
    pointer-events: none;
}
#tooltip.hidden {
    display: none;
}
#tooltip p {
    margin: 0;
    font-family: sans-serif;
    font-size: 16px;
    line-height: 20px;
    width: auto;
}
</style>
<body>
<script src="//d3js.org/d3.v3.js"></script>
<div id="mainframe" style="width: 1200px; height: 600px">
	<div id="subframe1" style="width: 70%; height: 600px; float: left; overflow: auto">
<script>
var margins = {
    top: 12,
    left: 48,
    right: 24,
    bottom: 24
},
legendPanel = {
    width: 180
},
width = 1200 - margins.left - margins.right - legendPanel.width,
    height = 600 - margins.top - margins.bottom,
    dataset =
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
      },
      {
        "time": "00:09",
        "count": "6"
      },
      {
        "time": "00:10",
        "count": "6"
      },
      {
        "time": "00:11",
        "count": "6"
      },
      {
        "time": "00:12",
        "count": "6"
      },
      {
        "time": "00:13",
        "count": "9"
      },
      {
        "time": "00:14",
        "count": "5"
      },
      {
        "time": "00:16",
        "count": "4"
      },
      {
        "time": "00:17",
        "count": "5"
      },
      {
        "time": "00:18",
        "count": "7"
      },
      {
        "time": "00:19",
        "count": "7"
      },
      {
        "time": "00:20",
        "count": "6"
      },
      {
        "time": "00:21",
        "count": "5"
      },
      {
        "time": "00:23",
        "count": "5"
      },
      {
        "time": "00:24",
        "count": "15"
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "22"
      },
      {
        "time": "00:10",
        "count": "21"
      },
      {
        "time": "00:11",
        "count": "23"
      },
      {
        "time": "00:12",
        "count": "29"
      },
      {
        "time": "00:13",
        "count": "22"
      },
      {
        "time": "00:14",
        "count": "18"
      },
      {
        "time": "00:16",
        "count": "20"
      },
      {
        "time": "00:17",
        "count": "29"
      },
      {
        "time": "00:18",
        "count": "23"
      },
      {
        "time": "00:19",
        "count": "23"
      },
      {
        "time": "00:20",
        "count": "22"
      },
      {
        "time": "00:21",
        "count": "24"
      },
      {
        "time": "00:23",
        "count": "28"
      },
      {
        "time": "00:24",
        "count": "20"
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
        "count": "4"
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "3"
      },
      {
        "time": "00:10",
        "count": "3"
      },
      {
        "time": "00:11",
        "count": "3"
      },
      {
        "time": "00:12",
        "count": "3"
      },
      {
        "time": "00:13",
        "count": "2"
      },
      {
        "time": "00:14",
        "count": "3"
      },
      {
        "time": "00:16",
        "count": "3"
      },
      {
        "time": "00:17",
        "count": "3"
      },
      {
        "time": "00:18",
        "count": "4"
      },
      {
        "time": "00:19",
        "count": "4"
      },
      {
        "time": "00:20",
        "count": "2"
      },
      {
        "time": "00:21",
        "count": "3"
      },
      {
        "time": "00:23",
        "count": "3"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "2"
      },
      {
        "time": "00:10",
        "count": "2"
      },
      {
        "time": "00:11",
        "count": "2"
      },
      {
        "time": "00:12",
        "count": "3"
      },
      {
        "time": "00:13",
        "count": "2"
      },
      {
        "time": "00:14",
        "count": "2"
      },
      {
        "time": "00:16",
        "count": "1"
      },
      {
        "time": "00:17",
        "count": "2"
      },
      {
        "time": "00:18",
        "count": "2"
      },
      {
        "time": "00:19",
        "count": "2"
      },
      {
        "time": "00:20",
        "count": "2"
      },
      {
        "time": "00:21",
        "count": "2"
      },
      {
        "time": "00:23",
        "count": "2"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "531"
      },
      {
        "time": "00:10",
        "count": "618"
      },
      {
        "time": "00:11",
        "count": "474"
      },
      {
        "time": "00:12",
        "count": "491"
      },
      {
        "time": "00:13",
        "count": "540"
      },
      {
        "time": "00:14",
        "count": "417"
      },
      {
        "time": "00:16",
        "count": "555"
      },
      {
        "time": "00:17",
        "count": "392"
      },
      {
        "time": "00:18",
        "count": "383"
      },
      {
        "time": "00:19",
        "count": "479"
      },
      {
        "time": "00:20",
        "count": "478"
      },
      {
        "time": "00:21",
        "count": "413"
      },
      {
        "time": "00:23",
        "count": "433"
      },
      {
        "time": "00:24",
        "count": "627"
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "2"
      },
      {
        "time": "00:10",
        "count": "2"
      },
      {
        "time": "00:11",
        "count": "2"
      },
      {
        "time": "00:12",
        "count": "1"
      },
      {
        "time": "00:13",
        "count": "1"
      },
      {
        "time": "00:14",
        "count": "2"
      },
      {
        "time": "00:16",
        "count": "1"
      },
      {
        "time": "00:17",
        "count": "6"
      },
      {
        "time": "00:18",
        "count": "1"
      },
      {
        "time": "00:19",
        "count": "2"
      },
      {
        "time": "00:20",
        "count": "1"
      },
      {
        "time": "00:21",
        "count": "3"
      },
      {
        "time": "00:23",
        "count": "2"
      },
      {
        "time": "00:24",
        "count": "2"
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
      },
      {
        "time": "00:09",
        "count": "3"
      },
      {
        "time": "00:10",
        "count": "4"
      },
      {
        "time": "00:11",
        "count": "3"
      },
      {
        "time": "00:12",
        "count": "3"
      },
      {
        "time": "00:13",
        "count": "3"
      },
      {
        "time": "00:14",
        "count": "86"
      },
      {
        "time": "00:16",
        "count": "3"
      },
      {
        "time": "00:17",
        "count": "4"
      },
      {
        "time": "00:18",
        "count": "3"
      },
      {
        "time": "00:19",
        "count": "3"
      },
      {
        "time": "00:20",
        "count": "3"
      },
      {
        "time": "00:21",
        "count": "3"
      },
      {
        "time": "00:23",
        "count": "4"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "0"
      },
      {
        "time": "00:10",
        "count": "0"
      },
      {
        "time": "00:11",
        "count": "0"
      },
      {
        "time": "00:12",
        "count": "0"
      },
      {
        "time": "00:13",
        "count": "0"
      },
      {
        "time": "00:14",
        "count": "0"
      },
      {
        "time": "00:16",
        "count": "0"
      },
      {
        "time": "00:17",
        "count": "0"
      },
      {
        "time": "00:18",
        "count": "0"
      },
      {
        "time": "00:19",
        "count": "0"
      },
      {
        "time": "00:20",
        "count": "0"
      },
      {
        "time": "00:21",
        "count": "0"
      },
      {
        "time": "00:23",
        "count": "0"
      },
      {
        "time": "00:24",
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
      },
      {
        "time": "00:09",
        "count": "2"
      },
      {
        "time": "00:10",
        "count": "2"
      },
      {
        "time": "00:11",
        "count": "3"
      },
      {
        "time": "00:12",
        "count": "2"
      },
      {
        "time": "00:13",
        "count": "2"
      },
      {
        "time": "00:14",
        "count": "2"
      },
      {
        "time": "00:16",
        "count": "2"
      },
      {
        "time": "00:17",
        "count": "2"
      },
      {
        "time": "00:18",
        "count": "2"
      },
      {
        "time": "00:19",
        "count": "2"
      },
      {
        "time": "00:20",
        "count": "2"
      },
      {
        "time": "00:21",
        "count": "2"
      },
      {
        "time": "00:23",
        "count": "2"
      },
      {
        "time": "00:24",
        "count": "3"
      }
    ]
  }
];
console.log("Hello"); 
var series = dataset.map(function (d) {
        return {
        	name: d.name,
        	ckf: d.checkpointFrom,
        	ckt: d.checkpointTo
        };
    }),
    dataset = dataset.map(function (d) {
        return d.data.map(function (o, i) {
            return {
                y: +o.count,
                x: o.time,
                name: d.name,
                ckf: d.checkpointFrom,
            	ckt: d.checkpointTo
            };
        });
    }),
    stack = d3.layout.stack();

stack(dataset);

var dataset = dataset.map(function (group) {
    return group.map(function (d) {
        return {
            x: d.y,
            y: d.x,
            x0: d.y0,
            name: d.name,
            ckf: d.ckf,
        	ckt: d.ckt
        };
    });
}),
    svg = d3.select('#subframe1')
        .append('svg')
        .attr('width', width + margins.left + margins.right + legendPanel.width)
        .attr('height', height + margins.top + margins.bottom)
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
    _ = console.log(months),
    yScale = d3.scale.ordinal()
        .domain(months)
        .rangeRoundBands([0, height], .1),
    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient('bottom'),
    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient('left'),
    colours = d3.scale.category10(),
    groups = svg.selectAll('g')
        .data(dataset)
        .enter()
        .append('g')
        .style('fill', function (d, i) {
        return colours(i);
    }),
    rects = groups.selectAll('rect')
        .data(function (d) {
        return d;
    })
        .enter()
        .append('rect')
        .attr('x', function (d) {
        return xScale(d.x0);
    })
        .attr('y', function (d, i) {
        return yScale(d.y);
    })
        .attr('height', function (d) {
        return yScale.rangeBand();
    })
        .attr('width', function (d) {
        return xScale(d.x);
    })
        .on('mouseover', function (d) {
        var xPos = parseFloat(d3.select(this).attr('x')) / 2 + width / 2;
        var yPos = parseFloat(d3.select(this).attr('y')) + yScale.rangeBand() / 2;
        d3.select('#tooltip')
            .style('left', xPos + 'px')
            .style('top', yPos + 'px')
            .select('#value')
            .html("Count: "+ d.x +"<br>Time: "+ d.y + "<br>Checkpoint 1: " + d.ckf + "<br>Checkpoint 2: " + d.ckt);// + "," + d.y + "," + d.name);

        d3.select('#tooltip').classed('hidden', false);
    })
        .on('mouseout', function () {
        d3.select('#tooltip').classed('hidden', true);
    })

    svg.append('g')
        .attr('class', 'axis')
        .attr('transform', 'translate(0,' + height + ')')
        .call(xAxis);
        
   svg.append('g')
       .attr('class', 'axis')
       .call(yAxis);
   
  </script>
   </div>
<div id="subframe2" style="width: 30%; height: 600px; float: right; overflow: auto">
 <script>
 
 svg1 = d3.select('#subframe2')
 		.append('svg')
 		.attr('width', 360)
 		.attr('height', 600 + margins.top + margins.bottom)
 		.append('g')
 		.attr('transform', 'translate(' + margins.left + ',' + margins.top + ')'),

   svg1.append('rect')
       .attr('fill', 'yellow')
       .attr('width', 160)
       .attr('height', 30 * dataset.length)
       .attr('x', margins.left)
       .attr('y', 0);

   series.forEach(function (s, i) {
       svg1.append('text')
           .attr('fill', 'black')
           .attr('x', margins.left + 8)
           .attr('y', i * 24 + 24)
           .text(s.name);
       svg1.append('rect')
           .attr('fill', colours(i))
           .attr('width', 60)
           .attr('height', 20)
           .attr('x', margins.left + 90)
           .attr('y', i * 24 + 6);
      });

</script>
</div>
</div>
<div id="tooltip" class="hidden">
    <p><span id="value">100</span>
    </p>
</div>
</body>
