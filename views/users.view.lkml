view: users {
  label: "@{users_view}"
  sql_table_name: derived.users ;;
  drill_fields: [network_userid]


# User

  dimension: network_userid {
    label: "network_userid"
    primary_key: yes
    group_label: "User"
    description: "User ID set by Snowplow using 3rd party cookie e.g. ‘ecdff4d0-9175-40ac-a8bb-325c49733607’"
    type: string
    sql: ${TABLE}.network_userid ;;
  }

  dimension: domain_userid {
    label: "domain_userid"
    description: "User ID set by Snowplow using 1st party cookie e.g. ‘bc2e92ec6c204a14’"
    group_label: "User"
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

# Engaged Time
  dimension_group: end_tstamp {
    label: "end_tstamp"
    description: "Timestamp for the last time the user was seen, based on derived_tstamp"
    group_label: "Engaged Time"
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_tstamp ;;
  }

  dimension: engaged_time_in_s {
    label: "engaged_time_in_s"
    description: "The total engaged time in seconds by the user"
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.engaged_time_in_s ;;
  }


# First Page

  dimension: first_page_title {
    label: "first_page_title"
    description: "The title of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_title ;;
  }

  dimension: first_page_url {
    label: "first_page_url"
    description: "The url of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_url ;;
  }

  dimension: first_page_urlfragment {
    label: "first_page_urlfragment"
    description: "The urlfragment of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlfragment ;;
  }

  dimension: first_page_urlhost {
    label: "first_page_urlhost"
    description: "The urlhost of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlhost ;;
  }

  dimension: first_page_urlpath {
    label: "first_page_urlpath"
    description: "The urlpath of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlpath ;;
  }

  dimension: first_page_urlquery {
    label: "first_page_urlquery"
    description: "The urlquery of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlquery ;;
  }

  dimension: first_page_urlscheme {
    label: "first_page_urlscheme"
    description: "The urlscheme of the first page visited by the user"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlscheme ;;
  }


# Last Page

  dimension: last_page_title {
    label: "last_page_title"
    description: "The title of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_title ;;
  }

  dimension: last_page_url {
    label: "last_page_url"
    description: "The url of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_url ;;
  }

  dimension: last_page_urlfragment {
    label: "last_page_urlfragment"
    description: "The urlfragment of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlfragment ;;
  }

  dimension: last_page_urlhost {
    label: "last_page_urlhost"
    description: "The urlhost of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlhost ;;
  }

  dimension: last_page_urlpath {
    label: "last_page_urlpath"
    description: "The urlpath of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlpath ;;
  }

  dimension: last_page_urlquery {
    label: "last_page_urlquery"
    description: "The urlquery of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlquery ;;
  }

  dimension: last_page_urlscheme {
    label: "last_page_urlscheme"
    description: "The urlscheme of the last page visited by the user"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlscheme ;;
  }


# Marketing
  dimension: mkt_campaign {
    label: "mkt_campaign"
    description: "The campaign ID e.g. ‘diageo-123’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: mkt_clickid {
    label: "mkt_clickid"
    description: "The click ID e.g. ‘ac3d8e459’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_clickid ;;
  }

  dimension: mkt_content {
    label: "mkt_content"
    description: "The content of the ad. (Or an ID so that it can be looked up.) e.g. 13894723"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_content ;;
  }

  dimension: mkt_medium {
    label: "mkt_medium"
    description: "Type of traffic source e.g. ‘cpc’, ‘affiliate’, ‘organic’, ‘social’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_medium ;;
  }

  dimension: mkt_network {
    label: "mkt_network"
    description: "The ad network to which the click ID belongs e.g. ‘DoubleClick’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_network ;;
  }

  dimension: mkt_source {
    label: "mkt_source"
    description: "The company / website where the traffic came from e.g. ‘Google’, ‘Facebook’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_source ;;
  }

  dimension: mkt_term {
    label: "mkt_term"
    description: "Any keywords associated with the referrer e.g. ‘new age tarot decks’"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.mkt_term ;;
  }


# Page Views

  dimension: page_views {
    label: "page_views"
    description: "The total page views by the user"
    group_label: "Page Views"
    type: number
    sql: ${TABLE}.page_views ;;
  }



# Referrer
  dimension: referrer {
    label: "referrer"
    description: "The referrer associated with the first page view of the user"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: refr_medium {
    label: "refr_medium"
    description: "Type of referer e.g. ‘search’, ‘internal’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_medium ;;
  }

  dimension: refr_source {
    label: "refr_source"
    description: "Name of referer if recognised e.g. ‘Bing images’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_source ;;
  }

  dimension: refr_term {
    label: "refr_term"
    description: "Keywords if source is a search engine e.g. ‘psychic oracle cards’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_term ;;
  }

  dimension: refr_urlfragment {
    label: "refr_urlfragment"
    description: "Referer URL fragment"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_urlfragment ;;
  }

  dimension: refr_urlhost {
    label: "refr_urlhost"
    description: "Referer host e.g. ‘www.bing.com’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_urlhost ;;
  }

  dimension: refr_urlpath {
    label: "refr_urlpath"
    description: "Referer page path e.g. ‘/images/search’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_urlpath ;;
  }

  dimension: refr_urlquery {
    label: "refr_urlquery"
    description: "Referer URL querystring e.g. ‘q=psychic+oracle+cards’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_urlquery ;;
  }

  dimension: refr_urlscheme {
    label: "refr_urlscheme"
    description: "Referer scheme e.g. ‘http’"
    group_label: "Referrer"
    type: string
    sql: ${TABLE}.refr_urlscheme ;;
  }


# Sessions

  dimension: sessions {
    label: "sessions"
    description: "The total sessions by the user"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension_group: start_tstamp {
    label: "start_tstamp"
    description: "Timestamp for the start of the users lifecycle, based on derived_tstamp"
    group_label: "Engaged Time"
    type: time
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_tstamp ;;
  }

  dimension: user_id {
    label: "user_id"
    description: "Unique ID set by business e.g. ‘jon.doe@email.com’"
    group_label: "User"
    type: string
    #hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: user_count {
    label: "user_count"
    type: count_distinct
    description: "Totla Number of Users"
    group_label: "Count"
    sql: ${domain_userid} ;;
  }


}
