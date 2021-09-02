connection: "snowplow_snplow5"

label: "Snowplow Looker Model"

# include all the views
include: "/views/**/*.view"

datagroup: snowplow-looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowplow-looker_default_datagroup

explore: sessions {
  label: "@{sessions_explore}"
  join: users {
    type: left_outer
    sql_on: ${sessions.domain_userid} = ${users.domain_userid} ;;
    relationship: many_to_one
  }
}

explore: page_views {
  label: "@{page_views_explore}"
  join: sessions {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${page_views.domain_sessionid} = ${sessions.domain_sessionid};;

  }
  join: users  {
    type:  left_outer
    relationship: many_to_one
    sql_on:  ${page_views.domain_userid} = ${users.domain_userid} ;;

  }
}

explore: users  {
  label: "@{users_explore}"
}
