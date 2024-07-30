
provider "newrelic" {
  account_id = var.account_id
  api_key    = var.api_key
  region     = var.region
  # ... your New Relic API key and account ID configuration ...
}
resource "newrelic_one_dashboard" "multi_page_dashboard" {
  for_each    = var.dashboard
  name        = each.value.name
  permissions = each.value.permissions

  dynamic "page" {
    for_each = { for p in each.value.pages : p.name => p }
    content {
      name = page.value.name

      dynamic "widget_billboard" {
        for_each = { for widget in page.value.widgets : widget.title => widget if widget.type == "billboard" }
        content {
          title  = widget_billboard.value.title
          row    = widget_billboard.value.row
          column = widget_billboard.value.column
          width  = widget_billboard.value.width
          height = widget_billboard.value.height

          nrql_query {
            query = widget_billboard.value.query
          }
        }
      }

      dynamic "widget_pie" {
        for_each = { for widget in page.value.widgets : widget.title => widget if widget.type == "pie" }
        content {
          title  = widget_pie.value.title
          row    = widget_pie.value.row
          column = widget_pie.value.column
          width  = widget_pie.value.width
          height = widget_pie.value.height

          nrql_query {
            query = widget_pie.value.query
          }
        }
      }

      dynamic "widget_bar" {
        for_each = { for widget in page.value.widgets : widget.title => widget if widget.type == "bar" }
        content {
          title  = widget_bar.value.title
          row    = widget_bar.value.row
          column = widget_bar.value.column
          width  = widget_bar.value.width
          height = widget_bar.value.height

          nrql_query {
            query = widget_bar.value.query
          }
        }
      }

      dynamic "widget_line" {
        for_each = { for widget in page.value.widgets : widget.title => widget if widget.type == "line" }
        content {
          title  = widget_line.value.title
          row    = widget_line.value.row
          column = widget_line.value.column
          width  = widget_line.value.width
          height = widget_line.value.height

          nrql_query {
            query = widget_line.value.query
          }

          dynamic "nrql_query" {
            for_each = widget_line.value.nrql_queries
            content {
              #   account_id = nrql_query.value.account_id
              query = nrql_query.value.query
            }
          }

          #   y_axis_left_zero = try(widget_line.value.y_axis_left_zero, false)
        }
      }
    }
  }
}
# resource "newrelic_one_dashboard" "my_dashboard" {
#   for_each = var.dashboard
#   name        = each.value.name
#   description = "Dashboard created using Terraform"

#   dynamic "page" {
#     # for_each = var.pages
#     for_each = {for p in each.value.pages : p.name => p}

#     content {
#       name = page.value.name

#       dynamic "widget_billboard" {
#         # for_each = page.value.widget_billboard
#         # for_each = widget.value.type == "billboard" ? [1] : []
#         for_each = {for widget in page.value.widgets : widget.title => widget if widget.type == "billboard"}

#         content {
#           title  = widget_billboard.value.title
#           row    = (widget_billboard.value.column - 1) * widget_billboard.value.width
#           column = (widget_billboard.value.row - 1) * widget_billboard.value.height
#           width  = widget_billboard.value.width
#           height = widget_billboard.value.height
#           nrql_query {
#             query = widget_billboard.value.nrql_query
#           }
#         }
#       }

#       dynamic "widget_pie" {
#         # for_each = page.value.widget_pie
#         # for_each = widget.value.type == "pie" ? [1] : []
#         for_each = {for widget in page.value.widgets : widget.title => widget if widget.type == "pie"}

#         content {
#           title  = widget_pie.value.title
#           row    = (widget_pie.value.column - 1) * widget_pie.value.width
#           column = (widget_pie.value.row - 1) * widget_pie.value.height
#           width  = widget_pie.value.width
#           height = widget_pie.value.height
#           nrql_query {
#             query = widget_pie.value.nrql_query
#           }
#         }
#       }

#       dynamic "widget_table" {
#         # for_each = widget.value.type == "table" ? [1] : []
#         for_each = {for widget in page.value.widgets : widget.title => widget if widget.type == "table"}

#         content {
#           title  = widget_table.value.title
#           row    = (widget_table.value.column - 1) * widget_table.value.width
#           column = (widget_table.value.row - 1) * widget_table.value.height
#           width  = widget_table.value.width
#           height = widget_table.value.height
#           nrql_query {
#             query = widget_table.value.nrql_query
#           }
#         }
#       }

#       # ... other widget types (pie chart, etc.)
#     }
#   }
# }


# resource "newrelic_one_dashboard" "my_dashboard" {
#   name        = var.dashboard_name
#   description = "Dashboard created using Terraform"

#   dynamic "page" {
#     for_each = var.pages

#     content {
#       name = page.value.name

#       dynamic "widget_billboard" {
#         for_each = page.value.widgets

#         content {
#           title  = widget_billboard.value.title
#           row    = (widget_billboard.value.column - 1) * widget_billboard.value.width
#           column = (widget_billboard.value.row - 1) * widget_billboard.value.height
#           width  = widget_billboard.value.width
#           height = widget_billboard.value.height

#           nrql_query {
#             query = widget_billboard.value.nrql_query
#           }
#         }


#       }
#     }
#   }
# }
