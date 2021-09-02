project_name: "snowplow-looker"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "snowplow_web_block"
#   override_constant: constant_name {
#    value: "string"
#  }
#}
# remote_dependency: public_project {
#  url: "https://github.com/llooker/google_ga360"
#  ref: "07a20007b6876d349ccbcacccdc400f668fd8147f1"
#  override_constant: constant_name {
#    value: "string"
#  }
#}
    localization_settings: {
      default_locale: en
      localization_level: permissive
    }


    constant: page_views_explore {
      value: "Snowplow Insights - Page Views"
    }
    constant: sessions_explore {
      value: "Snowplow Insights - Sessions"
    }
    constant: users_explore {
      value: "Snowplow Insights - Users"
    }



    constant: page_views_view {
      value: "Page Views Explore"
    }
    constant: sessions_view {
      value: "Sessions Explore"
    }
    constant: users_view {
      value: "Users Explore"
    }
