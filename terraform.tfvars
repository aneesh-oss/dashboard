dashboard = {
  "example_dashboard_1" = {
    name        = "New Relic Multi_Page Dashboard"
    permissions = "public_read_only"
    pages = [
      {
        name = "Page 1"
        widgets = [
          {
            type         = "pie"
            title        = "Number of views grouped by page"
            row          = 1
            column       = 1
            width        = 4
            height       = 4
            query        = "SELECT count(*) FROM BrowserInteraction WHERE appName = 'FoodMe-Browser' FACET browserInteractionName"
            nrql_queries = []
          },
          {
            type         = "pie"
            title        = "Average Duration"
            row          = 1
            column       = 5
            width        = 4
            height       = 4
            query        = "FROM Transaction SELECT average(duration) WHERE appName = 'FoodMe-Browser'"
            nrql_queries = []
          },
          {
            type         = "bar"
            title        = "Transaction Count"
            row          = 1
            column       = 9
            width        = 4
            height       = 4
            query        = "FROM Transaction SELECT count(*) WHERE appName = 'FoodMe-Browser'"
            nrql_queries = []
          }
        ]
      },
      {
        name = "Page 2"
        widgets = [
          {
            type         = "billboard"
            title        = "Sum of Duration"
            row          = 1
            column       = 1
            width        = 4
            height       = 4
            query        = "FROM Transaction SELECT sum(duration) WHERE appName = 'FoodMe-Browser' SINCE 1 month ago"
            nrql_queries = []
          },
          {
            type             = "line"
            title            = "Maximum Duration"
            row              = 1
            column           = 5
            width            = 4
            height           = 4
            query            = "FROM Transaction SELECT max(duration) WHERE appName = 'FoodMe-Browser'"
            nrql_queries     = []
            y_axis_left_zero = false
          },
          {
            type         = "pie"
            title        = "Slowest Transactions"
            row          = 1
            column       = 9
            width        = 4
            height       = 4
            query        = "SELECT max(duration) FROM Transaction FACET name SINCE 24 HOURS AGO"
            nrql_queries = []
          }
        ]
      }
    ]
  }
}

# dashboard_name = "My Dynamic Dashboard"

# pages = {
#   page1 = {
#     name = "Server Performance"
#     widgets = [
#       {
#         type       = "billboard"
#         title      = "CPU Usage"
#         nrql_query = "SELECT average(memoryUsedPercent) FROM SystemSample WHERE entityName='DESKTOP-G2H93DA'"
#         row        = 1
#         column     = 1
#         width      = 6
#         height     = 3
#       },
#       {
#         type       = "table"
#         title      = "Memory Usage"
#         nrql_query = "SELECT customer, restaurant,itemCount AS 'Items Order', orderTotal FROM Transaction WHERE appName = 'Foodme-testing' AND customer IS NOT NULL SINCE 1 day ago"
#         row        = 2
#         column     = 5
#         width      = 6
#         height     = 3
#       },
#       {
#         type       = "pie"
#         title      = "Memory Usage"
#         nrql_query = "SELECT average(cpuPercent) FROM SystemSample"
#         row        = 1
#         column     = 2
#         width      = 6
#         height     = 3
#       },
#       # ... other widgets
#     ]
#   },
#   page2 = {
#     name = "Application Health"
#     widgets = [
#       {
#         type       = "billboard"
#         title      = "Response Time"
#         nrql_query = "SELECT average(duration) FROM Transaction WHERE appName='Foodme-testing'"
#         row        = 2
#         column     = 1
#         width      = 6
#         height     = 3
#       },
#       {
#         type       = "billboard"
#         title      = "Error Rate"
#         nrql_query = "SELECT count(*) FROM InfrastructureEvent "
#         row        = 2
#         column     = 2
#         width      = 6
#         height     = 3
#       },
#       {
#         type       = "table"
#         title      = "Memory Usage"
#         nrql_query = "SELECT customer, paymentType AS 'Method' FROM Transaction WHERE appName='Foodme-testing' AND paymentType IS NOT NULL SINCE 1 week ago"
#         row        = 5
#         column     = 3
#         width      = 6
#         height     = 3
#       },
#     ]
#   }
# }
