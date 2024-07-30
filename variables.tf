variable "account_id" {
  description = "account_id"
  type        = string
}
variable "api_key"{
  description = "api_key for the newrelic"
  type        = string
}
variable "region"{
  description = "region"
  type = string
}

variable "dashboard" {
  type = map(object({
    name        = string
    permissions = string
    pages = list(object({
      name = string
      widgets = list(object({
        type   = string
        title  = string
        row    = number
        column = number
        width  = number
        height = number
        query  = string
        nrql_queries = optional(list(object({
          #   account_id = number
          query = string
        })), [])
        # y_axis_left_zero = optional(bool, false)
      }))
    }))
  }))
}
# variable "dashboard_name" {
#   type    = string
#   default = "My Dynamic Dashboard"
# }

# variable "pages" {
#   type = map(object({
#     name = string
#     widgets = list(object({
#       type       = string
#       title      = string
#       nrql_query = string
#       row        = number
#       column     = number
#       width      = number
#       height     = number
#     }))
#     # widget_pie = list(object({
#     #   title      = string
#     #   nrql_query = string
#     #   row        = number
#     #   column     = number
#     #   width      = number
#     #   height     = number
#     # }))
#     # widget_table = list(object({
#     #   title      = string
#     #   nrql_query = string
#     #   row        = number
#     #   column     = number
#     #   width      = number
#     #   height     = number
#     #   # Add specific table properties (optional)
#     # }))
#     # ... other widget types (pie chart, etc.)
#   }))
# }
#   default = {
#     page1 = {
#       name = "Server Performance"
#       billboards = [
#         {
#           title = "CPU Usage"
#           nrql_query = "SELECT average(cpu.usage) FROM cpu WHERE entity.kind = 'HOST'"
#           row = 1
#           column = 1
#           width = 6
#           height = 3
#         },
#         {
#           title = "Memory Usage"
#           nrql_query = "SELECT average(memory.used) FROM SystemSample WHERE entity.kind = 'HOST'"
#           row = 1
#           column = 2
#           width = 6
#           height = 3
#         }
#       ]
#       line_charts = [
#         {
#           title = "Response Time"
#           nrql_query = "SELECT average(duration) FROM Transaction WHERE entity.name = 'my_transaction'"
#           row = 2
#           column = 1
#           width = 6
#           height = 3
#         }
#       ]
#       tables = [
#         {
#           title = "Top Processes"
#           nrql_query = "SELECT process_name, cpu_usage FROM ProcessSample LIMIT 10"
#           row = 2
#           column = 2
#           width = 6
#           height = 5
#         }
#       ]
#     }
#     # ... other pages
#   }
# }
