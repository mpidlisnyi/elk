#!/bin/sh

curl -s0 -X POST --user admin:admin -H 'Accept: application/json' -H 'Content-Type: application/json' http://localhost:3000/api/datasources -d '
{
  "name":"dockerbeat",
  "type":"elasticsearch",
  "url":"http://elasticsearch:9200",
  "access":"proxy",
  "database":"[dockerbeat-]YYYY.MM.DD",
"jsonData":{"timeField":"@timestamp", "esVersion": 2, "interval":"Daily", "Pattern":"Daily"},
  "basicAuth":false
}
'

curl -s0 -X POST --user admin:admin -H 'Accept: application/json' -H 'Content-Type: application/json' http://localhost:3000/api/dashboards/db -d '
{ "overwrite": true, "dashboard": {
  "id": null,
  "title": "dockerbeat",
  "originalTitle": "dockerbeat",
  "tags": [
    "dockerbeat"
  ],
  "style": "dark",
  "timezone": "browser",
  "editable": true,
  "hideControls": false,
  "sharedCrosshair": false,
  "rows": [
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "dockerbeat",
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "leftLogBase": 1,
            "leftMax": null,
            "leftMin": null,
            "rightLogBase": 1,
            "rightMax": null,
            "rightMin": null,
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 1,
          "isNew": true,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "refId": "A",
              "metrics": [
                {
                  "type": "max",
                  "id": "1",
                  "field": "cpu.totalUsage",
                  "settings": {},
                  "meta": {}
                }
              ],
              "dsType": "elasticsearch",
              "bucketAggs": [
                {
                  "type": "terms",
                  "field": "containerName",
                  "id": "3",
                  "fake": true,
                  "settings": {
                    "order": "asc",
                    "size": "0",
                    "orderBy": "_term"
                  }
                },
                {
                  "type": "date_histogram",
                  "id": "2",
                  "settings": {
                    "interval": "auto",
                    "min_doc_count": 0
                  },
                  "field": "@timestamp"
                }
              ],
              "timeField": "@timestamp",
              "query": "type:cpu"
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "CPU",
          "tooltip": {
            "shared": true,
            "value_type": "cumulative"
          },
          "type": "graph",
          "x-axis": true,
          "y-axis": true,
          "y_formats": [
            "short",
            "short"
          ]
        }
      ],
      "title": "Row"
    }
  ],
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ],
    "now": true
  },
  "templating": {
    "list": []
  },
  "annotations": {
    "list": []
  },
  "schemaVersion": 8,
  "version": 2,
  "links": []
}
}
'
