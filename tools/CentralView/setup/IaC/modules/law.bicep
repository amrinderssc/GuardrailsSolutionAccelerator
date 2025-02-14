param subscriptionId string
param logAnalyticsWorkspaceName string
param rg string
param location string
param version string
param releaseDate string

var wbConfig1 ='''
{
  "version": "Notebook/1.0",
  "items": [
    {
      "type": 1,
      "content": {
        "json": "## Guardrails Accelerator\n\nSelect the Report Time (Default is latest). Select whether Recommended items are shown.\n\n(M) = Mandatory / (R) = Recommended",
        "style": "info"
      },
      "name": "Details Title"
    },
    {
      "type": 9,
      "content": {
        "version": "KqlParameterItem/1.0",
        "parameters": [
          {
            "id": "c90ebce2-9568-40ee-82cd-a8fd774f2e6b",
            "version": "KqlParameterItem/1.0",
            "name": "RequiredYesNo",
            "label": "Show Recommended Controls",
            "type": 10,
            "isRequired": true,
            "typeSettings": {
              "additionalResourceOptions": [],
              "showDefault": false
            },
            "jsonData": "[\n    { \"value\":\"Other\", \"label\":\"Yes\" },\n    { \"value\":\"False\", \"label\":\"No\", \"selected\":true }\n]",
            "timeContext": {
              "durationMs": 86400000
            },
            "value": "Other"
          }
        ],
        "style": "pills",
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces"
      },
      "name": "parameters - 19"
    },
    {
      "type": 9,
      "content": {
        "version": "KqlParameterItem/1.0",
        "parameters": [
          {
            "id": "618c9321-a3de-4287-b4cf-860a4adf42d4",
            "version": "KqlParameterItem/1.0",
            "name": "RunTime",
            "label": "Report Time",
            "type": 2,
            "isRequired": true,
            "query": "GuardrailsCompliance_CL\n| summarize by ReportTime_s \n| sort by ReportTime_s desc",
            "typeSettings": {
              "additionalResourceOptions": [
                "value::1"
              ],
              "showDefault": false
            },
            "timeContext": {
              "durationMs": 86400000
            },
            "defaultValue": "value::1",
            "queryType": 0,
            "resourceType": "microsoft.operationalinsights/workspaces",
            "value": "2023-01-16 19:55:14"
          }
        ],
        "style": "pills",
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces"
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isNotEqualTo",
        "value": "information"
      },
      "name": "parameters - 1"
    },
    {
      "type": 11,
      "content": {
        "version": "LinkItem/1.0",
        "style": "tabs",
        "links": [
          {
            "id": "6a683959-7ed3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 1",
            "subTarget": "gr1",
            "style": "link"
          },
          {
            "id": "6a683959-7fd3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 2",
            "subTarget": "gr2",
            "style": "link"
          },
          {
            "id": "6a683359-5ed3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 3",
            "subTarget": "gr3",
            "style": "link"
          },
          {
            "id": "6a383959-1ed3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 4",
            "subTarget": "gr4",
            "style": "link"
          },
          {
            "id": "6b683959-7ed3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 5",
            "subTarget": "gr5",
            "style": "link"
          },
          {
            "id": "6a683959-4fd3-42b1-a509-3cdcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 6",
            "subTarget": "test6",
            "style": "link"
          },
          {
            "id": "6a683959-7ed3-42b1-a509-3cfcd18017cf",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 7",
            "subTarget": "gr7",
            "style": "link"
          },
          {
            "id": "4b2de2e9-a9c7-486c-a524-7da0e8f44d26",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 8",
            "subTarget": "gr8",
            "style": "link"
          },
          {
            "id": "40243b3d-3037-482b-959b-d95c1b4b2014",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 9",
            "subTarget": "gr9",
            "style": "link"
          },
          {
            "id": "6bc4aa50-56c1-425b-9894-d6d7edb20e3a",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 10",
            "subTarget": "gr10",
            "style": "link"
          },
          {
            "id": "cad591d5-9404-46e2-b56f-b32723b390de",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 11",
            "subTarget": "gr11",
            "style": "link"
          },
          {
            "id": "144c0d71-a9de-4e02-95bf-0474d243ada6",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "GUARDRAIL 12",
            "subTarget": "gr12",
            "style": "link"
          },
          {
            "id": "8c5914bd-a497-473f-b767-f646b642fe5e",
            "cellValue": "selectedTab",
            "linkTarget": "parameter",
            "linkLabel": "Information",
            "subTarget": "information",
            "style": "link"
          }
        ]
      },
      "name": "links - 1"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "//let lic = GRITSGControls_CL | summarize max(TimeGenerated);\r\ngr_data(\"GUARDRAIL 1\",\"{RunTime}\", \"{RequiredYesNo}\" )",
        "size": 0,
        "title": "GR 1",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr1"
      },
      "name": "Gr1"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 2\",\"{RunTime}\",  \"{RequiredYesNo}\" )",
        "size": 1,
        "title": "GR 2",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr2"
      },
      "name": "Gr1 - Copy"
    },
    {
      "type": 9,
      "content": {
        "version": "KqlParameterItem/1.0",
        "parameters": [
          {
            "id": "9ff4b484-e871-4df0-8cbe-8ae6570c5984",
            "version": "KqlParameterItem/1.0",
            "name": "su",
            "label": "Show Guest Accounts",
            "type": 10,
            "isRequired": true,
            "value": "yes",
            "typeSettings": {
              "additionalResourceOptions": []
            },
            "jsonData": "[\n    { \"value\":\"yes\", \"label\":\"Yes\" },\n    { \"value\":\"no\", \"label\":\"No\", \"selected\":true }\n]",
            "timeContext": {
              "durationMs": 86400000
            }
          }
        ],
        "style": "above",
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces"
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr2"
      },
      "name": "parameters - 18"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "GR2ExternalUsers_CL \n| where ReportTime_s == \"{RunTime}\"\n| project DisplayName_s, Mail_s, Subscription_s",
        "size": 0,
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces"
      },
      "conditionalVisibilities": [
        {
          "parameterName": "selectedTab",
          "comparison": "isEqualTo",
          "value": "gr2"
        },
        {
          "parameterName": "su",
          "comparison": "isEqualTo",
          "value": "yes"
        }
      ],
      "name": "query - 17"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 3\",\"{RunTime}\",  \"{RequiredYesNo}\")",
        "size": 0,
        "title": "GR 3",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr3"
      },
      "name": "Gr1 - Copy - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 4\",\"{RunTime}\",  \"{RequiredYesNo}\" )",
        "size": 0,
        "title": "GR 4",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr4"
      },
      "name": "query - 6 - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data567(\"GUARDRAIL 5\",\"{RunTime}\",  \"{RequiredYesNo}\" )",
        "size": 0,
        "title": "GR 5",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ],
          "hierarchySettings": {
            "treeType": 1,
            "groupBy": [
              "Status"
            ]
          }
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr5"
      },
      "name": "query - 2 - Copy - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data567(\"GUARDRAIL 6\",\"{RunTime}\",  \"{RequiredYesNo}\" )",
        "size": 0,
        "title": "GR 6",
        "timeContext": {
          "durationMs": 86400000
        },
        "exportToExcelOptions": "all",
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ],
          "hierarchySettings": {
            "treeType": 1,
            "groupBy": [
              "Status"
            ]
          }
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "test6"
      },
      "name": "query - 26 - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data567(\"GUARDRAIL 7\",\"{RunTime}\",  \"{RequiredYesNo}\" )",
        "size": 0,
        "title": "GR 7",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ],
          "hierarchySettings": {
            "treeType": 1,
            "groupBy": [
              "Status"
            ]
          }
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr7"
      },
      "name": "query - 6 - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "let itsgcodes=GRITSGControls_CL | where TimeGenerated == toscalar(GRITSGControls_CL | summarize by TimeGenerated | top 2 by TimeGenerated desc | top 1 by TimeGenerated asc | project TimeGenerated);\r\nlet ctrlprefix=\"GUARDRAIL 8\";\r\nGuardrailsCompliance_CL\r\n| where ControlName_s has ctrlprefix  and ReportTime_s == \"{RunTime}\" and Required_s !=tostring(\"{RequiredYesNo}\")\r\n| where TimeGenerated > ago (24h)\r\n|join kind=leftouter (itsgcodes) on itsgcode_s\r\n| project SubnetName=SubnetName_s, Status=iif(tostring(ComplianceStatus_b)==\"True\", '✔️ ', '❌ '), Comments=Comments_s,[\"ITSG Control\"]=itsgcode_s, Definition=Definition_s,Mitigation=gr_geturl(replace_string(ctrlprefix,\" \",\"\"),itsgcode_s)\r\n| sort by Status asc",
        "size": 0,
        "title": "GR 8",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ],
          "hierarchySettings": {
            "treeType": 1,
            "groupBy": [
              "Status"
            ]
          }
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr8"
      },
      "name": "query - 2"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "let itsgcodes=GRITSGControls_CL | where TimeGenerated == toscalar(GRITSGControls_CL | summarize by TimeGenerated | top 2 by TimeGenerated desc | top 1 by TimeGenerated asc | project TimeGenerated);\r\nlet ctrlprefix=\"GUARDRAIL 9\";\r\nGuardrailsCompliance_CL\r\n| where ControlName_s has \"GUARDRAIL 9:\"  and ReportTime_s == \"{RunTime}\" and Required_s !=tostring(\"{RequiredYesNo}\")\r\n| where TimeGenerated > ago (24h)\r\n|join kind=leftouter (itsgcodes) on itsgcode_s\r\n| project ['VNet Name']=VNETName_s, Status=iif(tostring(ComplianceStatus_b)==\"True\", '✔️ ', '❌ '), Comments=Comments_s,[\"ITSG Control\"]=itsgcode_s, Definition=Definition_s,Mitigation=gr_geturl(replace_string(ctrlprefix,\" \",\"\"),itsgcode_s)\r\n",
        "size": 0,
        "title": "GR 9",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr9"
      },
      "name": "query - 3"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 10\",\"{RunTime}\", \"{RequiredYesNo}\")",
        "size": 4,
        "title": "GR 10",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr10"
      },
      "name": "query - 2 - Copy - Copy - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 11\",\"{RunTime}\", \"{RequiredYesNo}\")",
        "size": 1,
        "title": "GR 11",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr11"
      },
      "name": "query - 2 - Copy - Copy - Copy - Copy"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "gr_data(\"GUARDRAIL 12\",\"{RunTime}\", \"{RequiredYesNo}\")",
        "size": 4,
        "title": "GR 12",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "table",
        "gridSettings": {
          "formatters": [
            {
              "columnMatch": "Mitigation",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            },
            {
              "columnMatch": "Link",
              "formatter": 7,
              "formatOptions": {
                "linkTarget": "Url"
              }
            }
          ]
        }
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "gr12"
      },
      "name": "GR11"
    },
    {
      "type": 12,
      "content": {
        "version": "NotebookGroup/1.0",
        "groupType": "editable",
        "items": [
          {
            "type": 3,
            "content": {
              "version": "KqlItem/1.0",
              "query": "GuardrailsCompliance_CL \n| where ReportTime_s == '{RunTime}' and Required_s ==\"True\"\n| extend Status=iif(tostring(ComplianceStatus_b)==\"True\", 'Compliant Items', 'Non-compliant Items'), Title=\"Items by Compliance\"\n| summarize Total=count() by Status, Title",
              "size": 4,
              "timeContext": {
                "durationMs": 86400000
              },
              "queryType": 0,
              "resourceType": "microsoft.operationalinsights/workspaces",
              "visualization": "tiles",
              "tileSettings": {
                "showBorder": false,
                "titleContent": {
                  "columnMatch": "Status",
                  "formatter": 1
                },
                "leftContent": {
                  "columnMatch": "Total",
                  "formatter": 12,
                  "formatOptions": {
                    "palette": "auto"
                  },
                  "numberFormat": {
                    "unit": 17,
                    "options": {
                      "maximumSignificantDigits": 3,
                      "maximumFractionDigits": 2
                    }
                  }
                }
              }
            },
            "name": "query - 16"
          },
          {
            "type": 3,
            "content": {
              "version": "KqlItem/1.0",
              "query": "GuardrailsCompliance_CL\n| where ReportTime_s == '{RunTime}'\n| summarize by ControlName_s\n| count \n| extend Title=\"Total # of Controls\"",
              "size": 4,
              "timeContext": {
                "durationMs": 86400000
              },
              "queryType": 0,
              "resourceType": "microsoft.operationalinsights/workspaces",
              "visualization": "tiles",
              "tileSettings": {
                "titleContent": {
                  "columnMatch": "Title",
                  "formatter": 1
                },
                "leftContent": {
                  "columnMatch": "Count",
                  "numberFormat": {
                    "unit": 17,
                    "options": {
                      "style": "decimal"
                    }
                  }
                },
                "showBorder": true,
                "size": "auto"
              }
            },
            "name": "query - 15"
          }
        ]
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isNotEqualTo",
        "value": "information"
      },
      "name": "group - 17"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "let dt = GR_VersionInfo_CL | summarize max(ReportTime_s);\nGR_VersionInfo_CL\n| where ReportTime_s == toscalar (dt)\n|project [\"Deployed Version\"]= DeployedVersion_s, [\"Version Available\"]=AvailableVersion_s, [\"Update Required\"]=iff(UpdateNeeded_b==true,\"Yes\",\"No\"),[\"Check date\"]=toscalar (dt)",
        "size": 4,
        "title": "Guardrails Version Information",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces"
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "information"
      },
      "name": "information"
    },
    {
      "type": 3,
      "content": {
        "version": "KqlItem/1.0",
        "query": "let dt = GR_TenantInfo_CL | summarize max(ReportTime_s);\r\nGR_TenantInfo_CL\r\n| where ReportTime_s == toscalar (dt)\r\n| project [\"Cloud Usage Profiles\"] = iff(cloudUsageProfiles_s == 'default',toscalar(\"Cloud Usage Profile not specified or 'default'\"),cloudUsageProfiles_s),[\"Report Time\"]=toscalar (dt)",
        "size": 0,
        "title": "Cloud Usage Profile Configuration",
        "timeContext": {
          "durationMs": 86400000
        },
        "queryType": 0,
        "resourceType": "microsoft.operationalinsights/workspaces",
        "visualization": "card"
      },
      "conditionalVisibility": {
        "parameterName": "selectedTab",
        "comparison": "isEqualTo",
        "value": "information"
      },
      "name": "query - 20"
    }
  ],
  "fallbackResourceIds": [
'''
var wbConfig2='"/subscriptions/${subscriptionId}/resourceGroups/${rg}/providers/Microsoft.OperationalInsights/workspaces/${logAnalyticsWorkspaceName}"'
var wbConfig3='''
  ]
}
'''
var wbConfig='${wbConfig1}${wbConfig2}${wbConfig3}'

resource guardrailsLogAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  tags: {
    version: version
    releasedate: releaseDate
  }
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}
resource guarrailsWorkbooks 'Microsoft.Insights/workbooks@2022-04-01' = {
  location: location
  kind: 'shared'
  name: guid('guardrails')
  properties:{
    displayName: 'Department Compliance Report'
    serializedData: wbConfig
    category: 'guardrails'
    sourceId: guardrailsLogAnalytics.id
  }
}
resource f1 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  name: 'controlconfig'
  parent: guardrailsLogAnalytics
  properties: {
    category: 'grcentral_functions'
    displayName: 'controlconfig'
    //query: 'let baseurl="${GRDocsBaseUrl}";\nlet Link=strcat(baseurl,control,"-", replace_string(replace_string(itsgcode,"(","-"),")",""),".md");\nLink\n'
    query: 'let controlconfig = datatable(Control:string, mandatory:bool)\n[\n"GUARDRAIL 1: PROTECT ROOT / GLOBAL ADMINS ACCOUNT", false,\n"GUARDRAIL 8: NETWORK SEGMENTATION AND SEPARATION", true,\n"GUARDRAIL 11: LOGGING AND MONITORING", true,\n"GUARDRAIL 5: DATA LOCATION", true,\n"GUARDRAIL 2: MANAGEMENT OF ADMINISTRATIVE PRIVILEGES", false,\n"GUARDRAIL 6: PROTECTION OF DATA-AT-REST",true,\n"GUARDRAIL 7: PROTECTION OF DATA-IN-TRANSIT",   true,\n"GUARDRAIL 12: CONFIGURATION OF CLOUD MARKETPLACES",false,\n"GUARDRAIL 10: CYBER DEFENSE SERVICES",true,\n"GUARDRAIL 3: CLOUD CONSOLE ACCESS",true,\n"GUARDRAIL 4: ENTERPRISE MONITORING ACCOUNTS",true,\n"GUARDRAIL 9: NETWORK SECURITY SERVICES",true\n];\ncontrolconfig'
    functionAlias: 'controlconfig'
    version: 2
  }
}
output customerId string = guardrailsLogAnalytics.properties.customerId
output lawresourceid string = guardrailsLogAnalytics.id
