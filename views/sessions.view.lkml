view: sessions {
  label: "Sessions"
  sql_table_name: derived.sessions ;;
  drill_fields: [domain_sessionidx]


# Session
  dimension: domain_sessionidx {
    label: "domain_sessionidx"
    primary_key: yes
    description: "A visit / session index e.g. 3"
    group_label: "Session"
    type: number
    sql: ${TABLE}.domain_sessionidx ;;
  }


# Engaged Time
  dimension: absolute_time_in_s {
    label: "absolute_time_in_s"
    description: "The time in seconds between the start_tstamp and end_tstamp"
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.absolute_time_in_s ;;
  }


# Agent
  dimension: agent_class {
    label: "agent_class"
    description: "Class of agent e.g. browser"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_class ;;
  }

  dimension: agent_name {
    label: "agent_name"
    description: "Name of agent e.g. Chrome"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension: agent_name_version {
    label: "agent_name_version"
    description: "Name and version of agent e.g. Chrome 53.0.2785.124"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_name_version ;;
  }

  dimension: agent_name_version_major {
    label: "agent_name_version_major"
    description: "Name and major version of agent e.g. Chrome 53"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_name_version_major ;;
  }

  dimension: agent_version {
    label: "agent_version"
    description: "Version of agent e.g. 53.0.2785.124"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_version ;;
  }

  dimension: agent_version_major {
    label: "agent_version_major"
    description: "Major version of agent e.g. 53"
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_version_major ;;
  }


# App ID
  dimension: app_id {
    label: "app_id"
    description: "Application ID e.g. ‘angry-birds’ is used to distinguish different applications that are being tracked by the same Snowplow stack, e.g. production versus dev."
    group_label: "App ID"
    type: string
    sql: ${TABLE}.app_id ;;
  }


# Browser
  dimension: br_lang {
    label: "br_lang"
    description: "Language the browser is set to e.g. ‘en-GB’"
    group_label: "Browser"
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension: br_renderengine {
    label: "br_renderengine"
    description: "Browser rendering engine e.g. ‘GECKO’"
    group_label: "Browser"
    type: string
    sql: ${TABLE}.br_renderengine ;;
  }


# Category
  dimension: category {
    label: "category"
    description: "Category based on activity if the IP/UA is a spider or robot, BROWSER otherwise"
    group_label: "Category"
    type: string
    sql: ${TABLE}.category ;;
  }


# Device
  dimension: device_brand {
    label: "device_brand"
    description: "Brand of device e.g. Google"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_brand ;;
  }

  dimension: device_class {
    label: "device_class"
    description: "Class of device e.g. phone"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_class ;;
  }

  dimension: device_family {
    label: "device_family"
    description: "Device type"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_family ;;
  }

  dimension: device_name {
    label: "device_name"
    description: "Name of device e.g. Google Nexus 6"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: device_version {
    label: "device_version"
    description: "Version of device e.g. 6.0"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_version ;;
  }


# Session
  dimension: domain_sessionid {
    label: "domain_sessionid"
    description: "A visit / session UUID e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Session"
    type: string
    sql: ${TABLE}.domain_sessionid ;;
  }


# User
  dimension: domain_userid {
    label: "domain_userid"
    description: "User ID set by Snowplow using 1st party cookie e.g. ‘bc2e92ec6c204a14’"
    group_label: "User"
    type: string
    sql: ${TABLE}.domain_userid ;;
  }


# Time Stamp
  dimension_group: end_tstamp {
    label: "end_tstamp"
    description: "Timestamp for the end of the session, based on derived_tstamp"
    group_label: "Time Stamp"
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
    sql: ${TABLE}.end_tstamp ;;
  }

  dimension: engaged_time_in_s {
    label: "engaged_time_in_s"
    description: "The total time engaged by a user within a session"
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.engaged_time_in_s ;;
  }


# First Page
  dimension: first_page_title {
    label: "first_page_title"
    description: "The title of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_title ;;
  }

  dimension: first_page_url {
    label: "first_page_url"
    description: "The url of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_url ;;
  }

  dimension: first_page_urlfragment {
    label: "first_page_urlfragment"
    description: "The urlfragment of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlfragment ;;
  }

  dimension: first_page_urlhost {
    label: "first_page_urlhost"
    description: "The urlhost of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlhost ;;
  }

  dimension: first_page_urlpath {
    label: "first_page_urlpath"
    description: "The urlpath of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlpath ;;
  }

  dimension: first_page_urlquery {
    label: "first_page_urlquery"
    description: "The urlquery of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlquery ;;
  }

  dimension: first_page_urlscheme {
    label: "first_page_urlscheme"
    description: "The urlscheme of the first page visited within the session"
    group_label: "First Page"
    type: string
    sql: ${TABLE}.first_page_urlscheme ;;
  }


# geographical
  dimension: geo_city {
    label: "geo_city"
    description: "City the visitor is in e.g. ‘New York’, ‘London’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    label: "geo_country"
    description: "ISO 3166-1 code for the country the visitor is located in e.g. ‘GB’, ‘US’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_latitude {
    label: "geo_latitude"
    description: "Visitor location latitude e.g. 37.443604"
    group_label: "Geographical"
    type: number
    sql: ${TABLE}.geo_latitude ;;
  }

  dimension: geo_longitude {
    label: "geo_longitude"
    description: "Visitor location longitude e.g. -122.4124"
    group_label: "Geographical"
    type: number
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: geo_location {
    label: "geo_location"
    description: "Location of USer"
    group_label: "Geographical"
    type: location
    sql_latitude: ${geo_latitude} ;;
    sql_longitude: ${geo_longitude} ;;
  }

  dimension: geo_region {
    label: "geo_region"
    description: "ISO-3166-2 code for country region the visitor is in e.g. ‘I9’, ‘TX’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: geo_region_name {
    label: "geo_region_name"
    description: "Visitor region name e.g. ‘Florida’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_region_name ;;
  }

  dimension: geo_timezone {
    label: "geo_timezone"
    description: "Visitor timezone name e.g. ‘Europe/London’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  dimension: geo_zipcode {
    label: "geo_zipcode"
    description: "Postcode the visitor is in e.g. ‘94109’"
    group_label: "Geographical"
    type: string
    sql: ${TABLE}.geo_zipcode ;;
  }


# Last Page
  dimension: last_page_title {
    label: "last_page_title"
    description: "The title of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_title ;;
  }

  dimension: last_page_url {
    label: "last_page_url"
    description: "The url of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_url ;;
  }

  dimension: last_page_urlfragment {
    label: "last_page_urlfragment"
    description: "The urlfragment of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlfragment ;;
  }

  dimension: last_page_urlhost {
    label: "last_page_urlhost"
    description: "The urlhost of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlhost ;;
  }

  dimension: last_page_urlpath {
    label: "last_page_urlpath"
    description: "The urlpath of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlpath ;;
  }

  dimension: last_page_urlquery {
    label: "last_page_urlquery"
    description: "The urlquery of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlquery ;;
  }

  dimension: last_page_urlscheme {
    label: "last_page_urlscheme"
    description: "The urlscheme of the last page visited within the session"
    group_label: "Last Page"
    type: string
    sql: ${TABLE}.last_page_urlscheme ;;
  }


# Layout
  dimension: layout_engine_class {
    label: "layout_engine_class"
    description: "Class of layout engine e.g. Browser"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_class ;;
  }

  dimension: layout_engine_name {
    label: "layout_engine_name"
    description: "Name of layout engine e.g. Blink"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_name ;;
  }

  dimension: layout_engine_name_version {
    label: "layout_engine_name_version"
    description: "Name and version of layout engine e.g. Blink 53.0"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_name_version ;;
  }

  dimension: layout_engine_name_version_major {
    label: "layout_engine_name_version_major"
    description: "Name and major version of layout engine e.g. Blink 53"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_name_version_major ;;
  }

  dimension: layout_engine_version {
    label: "layout_engine_version"
    description: "Version of layout engine e.g. 53.0"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_version ;;
  }

  dimension: layout_engine_version_major {
    label: "layout_engine_version_major"
    description: "Major version of layout engine e.g. 53"
    group_label: "Layout"
    type: string
    sql: ${TABLE}.layout_engine_version_major ;;
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

  dimension: network_userid {
    label: "network_userid"
    description: "User ID set by Snowplow using 3rd party cookie e.g. ‘ecdff4d0-9175-40ac-a8bb-325c49733607’"
    group_label: "User"
    type: string
    sql: ${TABLE}.network_userid ;;
  }


# OS
  dimension: operating_system_class {
    label: "operating_system_class"
    description: "Class of the OS e.g. Mobile"
    group_label: "OS"
    type: string
    sql: ${TABLE}.operating_system_class ;;
  }

  dimension: operating_system_name {
    label: "operating_system_name"
    description: "Name of the OS e.g. Android"
    group_label: "OS"
    type: string
    sql: ${TABLE}.operating_system_name ;;
  }

  dimension: operating_system_name_version {
    label: "operating_system_name_version"
    description: "Name and version of the OS e.g. Android 7.0"
    group_label: "OS"
    type: string
    sql: ${TABLE}.operating_system_name_version ;;
  }

  dimension: operating_system_version {
    label: "operating_system_version"
    description: "Version of the OS e.g. 7.0"
    group_label: "OS"
    type: string
    sql: ${TABLE}.operating_system_version ;;
  }

  dimension: os_family {
    label: "os_family"
    description: "Operating system family e.g. ‘Linux’"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: os_major {
    label: "os_major"
    description: "Operation system major version"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_major ;;
  }

  dimension: os_minor {
    label: "os_minor"
    description: "Operation system minor version"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_minor ;;
  }

  dimension: os_patch {
    label: "os_patch"
    description: "Operation system patch version"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_patch ;;
  }

  dimension: os_patch_minor {
    label: "os_patch_minor"
    description: "Operation system patch minor version"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_patch_minor ;;
  }

  dimension: os_timezone {
    label: "os_timezone"
    description: "Client operating system timezone e.g. ‘Europe/London’"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_timezone ;;
  }

  dimension: os_version {
    label: "os_version"
    description: "Operation system full version"
    group_label: "OS"
    type: string
    sql: ${TABLE}.os_version ;;
  }


# Page Views
  dimension: page_views {
    label: "page_views"
    description: "The number of distinct page views within a session"
    group_label: "Page Views"
    type: number
    sql: ${TABLE}.page_views ;;
  }


# Bots
  dimension: primary_impact {
    label: "primary_impact"
    description: "Whether the spider or robot would affect page impression measurement, ad impression measurement, both or none"
    group_label: "Bots"
    type: string
    sql: ${TABLE}.primary_impact ;;
  }

  dimension: reason {
    label: "reason"
    description: "Type of failed check if the IP/UA is a spider or robot, PASSED_ALL otherwise"
    group_label: "Bots"
    type: string
    sql: ${TABLE}.reason ;;
  }


# Referrer
  dimension: referrer {
    label: "referrer"
    description: "The referrer associated with the first page view of the session"
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

  dimension: spider_or_robot {
    label: "spider_or_robot"
    description: "True if the IP address or user agent checked against the list is a spider or robot, false otherwise"
    group_label: "Bots"
    type: yesno
    sql: ${TABLE}.spider_or_robot ;;
  }

  dimension_group: start_tstamp {
    label: "start_tstamp"
    description: "Timestamp for the start of the session, based on derived_tstamp"
    group_label: "Time Stamp"
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
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }


# User Agent
  dimension: user_ipaddress {
    label: "user_ipaddress"
    description: "User IP address e.g. ‘92.231.54.234’"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.user_ipaddress ;;
  }

  dimension: useragent {
    label: "useragent"
    description: "Raw useragent"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent ;;
  }

  dimension: useragent_family {
    label: "useragent_family"
    description: "Useragent family (browser) name"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent_family ;;
  }

  dimension: useragent_major {
    label: "useragent_major"
    description: "Useragent major version"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent_major ;;
  }

  dimension: useragent_minor {
    label: "useragent_minor"
    description: "Useragent minor version"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent_minor ;;
  }

  dimension: useragent_patch {
    label: "useragent_patch"
    description: "Useragent patch version"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent_patch ;;
  }

  dimension: useragent_version {
    label: "useragent_version"
    description: "Full version of the useragent"
    group_label: "User Agent"
    type: string
    sql: ${TABLE}.useragent_version ;;
  }

# dimension_group: sesssion {
#   type: duration
#   sql_start: ${start_tstamp_time} ;;
#   sql_end: ${end_tstamp_time} ;;
#   intervals: [second]
# }

dimension: first_session_or_returning_session {
  label: "first_session_or_returning_session"
  type: string
  case: {
    when: {
      sql: ${domain_sessionidx}=1 ;;
      label: "First Session"
    }
    when: {
      sql: ${domain_sessionidx}>1 ;;
      label: "Returning Session"
    }
    else: "Error"
  }
  group_label: "Session"
}

  dimension: session_period {
    label: "session_period"
    case: {
      when: {
        sql: ${start_tstamp_time} >= DATEADD(day, -28, GETDATE()) ;;
        label: "30 days period"
      }
      when: {
        sql: ${start_tstamp_time} >= DATEADD(day, -56, GETDATE()) AND ${start_tstamp_time} < DATEADD(day, -28, GETDATE()) ;;
        label: "60 days period"
      }
      else: "Past 60 days"
    }
    group_label: "Session"
  }

  dimension: user_engaged {
    label: "user_engaged"
    type: yesno
    description: "If the user engaged for a certain amount of time and page views"
    sql: ${engaged_time_in_s} >= 60 AND ${page_views} >= 3 ;;
    group_label: "Engaged Time"
  }

# Measures

  measure: Count {
    type: count
    hidden: yes
    drill_fields: [count*]
  }
  set: count {
    fields: [
      domain_sessionid,
      start_tstamp_time,
      end_tstamp_time,
      page_views
    ]
  }

  measure: Count_User {
    type: count
    hidden: yes
    drill_fields: [count_user*]
  }
  set: count_user {
    fields: [
      domain_sessionid,
      page_views,
      geo_country,
      geo_timezone,
      first_page_title,
      domain_sessionidx
    ]
  }

  dimension: user_bounced {
    label: "user_bounced"
    type: yesno
    description: "User stopped the activity and left the page"
    #sql: ${page_views_in_session}=1 and ${engaged_time_in_s} = 0;;
    sql: ${page_views} =1 and ${engaged_time_in_s} = 0;;
    group_label: "User"
  }

  dimension: new_user {
    label: "new_user"
    type: yesno
    group_label: "User"
    description: "New User interacting for the first time"
    sql: ${domain_sessionidx} =1 ;;
  }


  dimension_group: session_minutes {
    label: "session_minutes"
    type: duration
    group_label: "Session"
    description: "Minutes per session by user"
    sql_start: ${start_tstamp_raw} ;;
    sql_end: ${end_tstamp_raw} ;;
    intervals: [minute]
  }

  dimension: first_session {
    label: "first_session"
    type: yesno
    group_label: "Session"
    description: "whether the session is first session or not"
    sql: ${domain_sessionidx} = 1 ;;
    }


  # Measure

  measure: session_count {
    label: "session_count"
    type: count_distinct
    description: "Total number of sessions"
    group_label: "Count"
    sql: ${domain_sessionid} ;;
    drill_fields: [count*]
  }

  measure: user_count {
    label: "user_count"
    type: count_distinct
    description: "Totla Number of Users"
    group_label: "Count"
    sql: ${domain_userid} ;;
    drill_fields: [count_user*]
  }

  measure: session_per_user {
    label: "session_per_user"
    type: number
    description: "average session per user"
    group_label: "Count"
    sql: ${session_count}/${user_count} ;;
    value_format_name: decimal_2
  }

}
