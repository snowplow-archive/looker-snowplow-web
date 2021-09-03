view: page_views {
  label: "@{page_views_view}"
  sql_table_name: derived.page_views ;;
  drill_fields: [page_view_id]


# Page View
  dimension: page_view_id {
    label: "page_view_id"
    primary_key: yes
    description: "A UUID for each page view e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Page View"
    type: string
    sql: ${TABLE}.page_view_id ;;
  }


# Engaged TIme
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
  dimension: br_colordepth {
    label: "br_colordepth"
    description: "Bit depth of the browser color palette e.g. 24"
    group_label: "Browser"
    type: string
    sql: ${TABLE}.br_colordepth ;;
  }

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

  dimension: br_viewheight {
    label: "br_viewheight"
    description: "Viewport height e.g. 1000"
    group_label: "Browser"
    type: number
    sql: ${TABLE}.br_viewheight ;;
  }

  dimension: br_viewwidth {
    label: "br_viewwidth"
    description: "Viewport width e.g. 1000"
    group_label: "Browser"
    type: number
    sql: ${TABLE}.br_viewwidth ;;
  }


# Category
  dimension: category {
    label: "category"
    description: "Category based on activity if the IP/UA is a spider or robot, BROWSER otherwise"
    group_label: "Category"
    type: string
    sql: ${TABLE}.category ;;
  }


# Time Stamp
  dimension_group: collector_tstamp {
    label: "collector_tstamp"
    description: "Time stamp for the event recorded by the collector e.g. ‘2013-11-26 00:02:05’"
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
    sql: ${TABLE}.collector_tstamp ;;
  }

  dimension_group: derived_tstamp {
    label: "derived_tstamp"
    description: "Timestamp making allowance for innaccurate device clock e.g. ‘2013-11-26 00:02:04’"
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
    sql: ${TABLE}.derived_tstamp ;;
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


# Document
  dimension: doc_height {
    label: "doc_height"
    description: "The page’s height in pixels e.g. 3000"
    group_label: "Document"
    type: number
    sql: ${TABLE}.doc_height ;;
  }

  dimension: doc_width {
    label: "doc_width"
    description: "The page’s width in pixels e.g. 1024"
    group_label: "Document"
    type: number
    sql: ${TABLE}.doc_width ;;
  }


# Session
  dimension: domain_sessionid {
    label: "domain_sessionid"
    description: "A visit / session UUID e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Session"
    type: string
    sql: ${TABLE}.domain_sessionid ;;
  }

  dimension: domain_sessionidx {
    label: "domain_sessionidx"
    description: "A visit / session index e.g. 3"
    group_label: "Session"
    type: number
    sql: ${TABLE}.domain_sessionidx ;;
  }



# User
  dimension: domain_userid {
    label: "domain_userid"
    description: "User ID set by Snowplow using 1st party cookie e.g. ‘bc2e92ec6c204a14’"
    group_label: "User"
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension_group: dvce_created_tstamp {
    label: "dvce_created_tstamp"
    description: "Timestamp event was recorded on the client device e.g. ‘2013-11-26 00:03:57.885’"
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
    sql: ${TABLE}.dvce_created_tstamp ;;
  }

  dimension_group: end_tstamp {
    label: "end_tstamp"
    description: "Timestamp for the end of the page view, based on derived_tstamp"
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
    description: "Time spent by the user on the page calculated using page pings."
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.engaged_time_in_s ;;
  }



# Event
  dimension: event_id {
    label: "event_id"
    description: "A UUID for each event e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Event"
    type: string
    sql: ${TABLE}.event_id ;;
  }



# Geographical
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


# Page Scroll
  dimension: horizontal_percentage_scrolled {
    label: "horizontal_percentage_scrolled"
    description: "Percentage of page scrolled horizontally"
    group_label: "Page Scroll"
    type: number
    sql: ${TABLE}.horizontal_percentage_scrolled ;;
  }

  dimension: horizontal_pixels_scrolled {
    label: "horizontal_pixels_scrolled"
    description: "Distance the user scrolled horizontally in pixels"
    group_label: "Page Scroll"
    type: number
    sql: ${TABLE}.horizontal_pixels_scrolled ;;
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


# Page
  dimension: page_referrer {
    label: "page_referrer"
    description: "URL of the referrer e.g. ‘http://www.referrer.com’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_referrer ;;
  }

  dimension: page_title {
    label: "page_title"
    description: "Web page title e.g. ‘Snowplow Docs – Understanding the structure of Snowplow data’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_url {
    label: "page_url"
    description: "The page URL e.g. ‘http://www.example.com’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_urlfragment {
    label: "page_urlfragment"
    description: "Fragment aka anchor e.g. ‘4-conclusion’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_urlfragment ;;
  }

  dimension: page_urlhost {
    label: "page_urlhost"
    description: "Host aka domain e.g. ‘“www.snowplowanalytics.com’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_urlhost ;;
  }

  dimension: page_urlpath {
    label: "page_urlpath"
    description: "Path to page e.g. ‘/product/index.html’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_urlpath ;;
  }

  dimension: page_urlquery {
    label: "page_urlquery"
    description: "Querystring e.g. ‘id=GTM-DLRG’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_urlquery ;;
  }

  dimension: page_urlscheme {
    label: "page_urlscheme"
    description: "Scheme aka protocol e.g. ‘https’"
    group_label: "Page"
    type: string
    sql: ${TABLE}.page_urlscheme ;;
  }


# Page Views
  dimension: page_view_in_session_index {
    label: "page_view_in_session_index"
    description: "A page view index within a single session"
    group_label: "Page Views"
    type: number
    sql: ${TABLE}.page_view_in_session_index ;;
  }

  dimension: page_views_in_session {
    label: "page_views_in_session"
    description: "Distinct count of page_view_id within a session"
    group_label: "Page Views"
    type: number
    sql: ${TABLE}.page_views_in_session ;;
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
    description: "Timestamp for the start of the page view, based on derived_tstamp"
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

  dimension: vertical_percentage_scrolled {
    label: "vertical_percentage_scrolled"
    description: "Percentage of page scrolled vertically"
    group_label: "Page Scroll"
    type: number
    sql: ${TABLE}.vertical_percentage_scrolled ;;
  }

  dimension: vertical_pixels_scrolled {
    label: "vertical_pixels_scrolled"
    description: "Distance the user scrolled vertically in pixels"
    group_label: "Page Scroll"
    type: number
    sql: ${TABLE}.vertical_pixels_scrolled ;;
  }

  dimension: user_bounced {
    label: "user_bounced"
    type: yesno
    description: "User stopped the activity and left the page"
    sql: ${sessions.user_bounced} ;;
    group_label: "User"
  }

  dimension: exit_page {
    label: "exit_page"
    type: yesno
    description: "if the visited page is also the exit page - yes"
    sql: ${page_views_in_session} = ${page_view_in_session_index} ;;
    group_label: "Page View"
  }

  dimension: new_user {
    label: "new_user"
    type: yesno
    group_label: "User"
    description: "New User interacting for the first time"
    sql: ${sessions.new_user};;
  }

  dimension: user_engaged {
    label: "user_engaged"
    type: yesno
    description: "If the user engaged for a certain amount of time and page views"
    group_label: "User"
    sql: ${sessions.user_engaged} ;;
  }


  dimension: direct_search {
    label: "direct_search"
    group_label: "Traffic"
    type: yesno
    sql: ${refr_medium} = null and ${page_url} not like '%utm_%';;
  }

  dimension: organic_search {
    label: "organic_search"
    group_label: "Traffic"
    type: yesno
    sql: (${refr_medium} = 'search' and ${mkt_medium} is null) OR (${refr_medium} = 'search' and ${mkt_medium} = 'organic') ;;
  }

  dimension: Paid_Search {
    label: "Paid_Search"
    group_label: "Traffic"
    type: yesno
    sql: ${refr_medium} = 'search' and  ${mkt_medium} like '%(cpc|ppc|paidsearch)%' ;;
  }

  dimension: Social {
    label: "Social"
    group_label: "Traffic"
    type: yesno
    sql: ${refr_medium} = 'social' or ${mkt_medium} like '%(social|social-network|social-media|sm|social network|social media)%' ;;
  }

  dimension: email {
    label: "email"
    group_label: "Traffic"
    type: yesno
    sql: ${refr_medium} = 'email' or ${mkt_medium} like 'email' ;;
  }

  dimension: display {
    label: "display"
    group_label: "Traffic"
    type: yesno
    sql: ${mkt_medium} like '%(display|cpm|banner)%' ;;
  }

  dimension: advertising {
    label: "advertising"
    group_label: "Traffic"
    type: yesno
    sql: ${mkt_medium} like '%(cpv|cpa|cpp|content-text|advertising|ads)%' ;;
  }

  dimension: traffic_type {
    label: "traffic_type"
    group_label: "Traffic"
    type: string
    description: "Type of traffic"
    sql:
        CASE WHEN (${refr_medium} = null and ${page_url} not like '%utm_%') THEN 'Direct Search'
             WHEN ((${refr_medium} = 'search' and ${mkt_medium} is null) OR (${refr_medium} = 'search' and ${mkt_medium} = 'organic')) THEN 'Organic Search'
             WHEN (${refr_medium} = 'search' and  ${mkt_medium} like '%(cpc|ppc|paidsearch)%') THEN 'Paid Search'
             WHEN (${refr_medium} = 'social' or ${mkt_medium} like '%(social|social-network|social-media|sm|social network|social media)%') THEN 'Social'
             WHEN (${refr_medium} = 'email' or ${mkt_medium} like 'email') THEN 'Email'
             WHEN (${mkt_medium} like '%(display|cpm|banner)%') THEN 'Display'
             WHEN (${mkt_medium} like '%(cpv|cpa|cpp|content-text|advertising|ads)%') THEN 'Advertising'
             ELSE NULL
             END
    ;;
  }

  # Measures

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }
   # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      page_view_id,
      geo_region_name,
      agent_name,
      device_name,
      layout_engine_name,
      operating_system_name,
      users.domain_userid,
      users.network_userid,
      indicative_export.count,
      pv_marketing_funnel.count,
      website_converted_user_page_views.count,
      website_page_views.count,
      website_qa_converted_user_page_views.count,
      website_qa_page_views.count
    ]
  }

  measure: user_details {
    type: count
    drill_fields: [user_details*]
    hidden: yes
  }
  set: user_details {
    fields: [
      domain_userid,
      geo_country,
      user_ipaddress,
      geo_timezone,
      geo_city
  ]
}

#Measures


  measure: most_engaged_page_in_one_session{
    label: "most_engaged_page_in_one_session"
    type: string
    group_label: "Engagement"
    description: "Most amount of time spent on a page in one session"
    sql: max(${engaged_time_in_s}) ;;
    drill_fields: [engaged_page_details*]
  }

  #update this meaure
  measure: bounce_page_time_spent {
    label: "bounce_page_time_spent"
    type: string
    group_label: "Engagement"
    description: "Time spent on a page before user bounced from the session"
    sql:  min(${engaged_time_in_s}) where ${page_views_in_session} = ${page_view_in_session_index};;
    drill_fields: [engaged_page_details*]
  }
  set: engaged_page_details {
    fields: [
      page_title,
      page_url,
      page_view_id,
      page_referrer
    ]
  }

  measure: session_count {
    label: "session_count"
    type: number
    description: "Total Number of Sessions"
    sql: ${sessions.session_count} ;;
    group_label: "Count"
    drill_fields: [session_count*]
  }
  set: session_count {
    fields: [
      domain_sessionid,
      start_tstamp_time,
      end_tstamp_time,
      page_views_in_session
    ]
  }

  measure: user_count {
    label: "user_count"
    type: number
    description: "Total number of Users"
    sql: ${sessions.user_count} ;;
    group_label: "Count"
    drill_fields: [user_details*]
  }

  measure: bounced_page_view_count {
    label: "bounced_page_view_count"
    type: count_distinct
    description: "Total Number of Pages Views that user bounced from"
    sql: ${page_view_id} ;;
    filters: [
      user_bounced: "yes"
    ]
    group_label: "Count"
  }



  measure: average_time_spent_per_session {
    label: "average_time_spent_per_session"
    type: average_distinct
    group_label: "Engagement"
    description: "Average time engaged per Session"
    sql: ${engaged_time_in_s} ;;
  }

  measure: total_time_engaged_per_user {
    label: "total_time_engaged_per_user"
    type: sum
    group_label: "Engagement"
    description: "Total time engaged per User"
    sql: ${engaged_time_in_s} ;;
    drill_fields: [user_engaged_time_total*]
  }
  set: user_engaged_time_total {
    fields: [
      domain_sessionid,
      domain_sessionidx,
      page_view_id,
      geo_country,
      geo_city,
    ]
  }

  measure: total_user_bounced {
    label: "total_user_bounced"
    type: count_distinct
    description: "Total Number of User bounced"
    group_label: "Count"
    sql: ${user_bounced} ;;
    filters: [
      user_bounced: "Yes"
    ]
  }

  measure: user_bounced_rate{
    label: "user_bounced_rate"
    type: number
    group_label: "Engagement"
    description: "Rate of user bounced"
    sql: (${total_user_bounced}/${user_count})*100 ;;
    value_format: "0.00\"%\""
  }

  dimension: enagagement_score {
    label: "enagagement_score"
    group_label: "Engagement"
    type: number
    description: "User engagement with the webpage in terms of scroll and time"
    sql: (${vertical_percentage_scrolled}/100) * 0.3 + (${engaged_time_in_s}/600) * 0.7 ;;
  }

  dimension: engagement_type {
    label: "engagement_type"
    type: string
    group_label: "Engagement"
    description: "type of engagement"
    sql: CASE WHEN ${enagagement_score} <= .1 THEN 'Low' WHEN ((${enagagement_score} > .1) AND (${enagagement_score} <=.5)) THEN 'Medium' WHEN ${enagagement_score} > .5 THEN 'High' ELSE NULL END  ;;
    drill_fields: [engagement*]
  }
  set: engagement {
    fields: [
      enagagement_score,
      engaged_time_in_s,
      vertical_percentage_scrolled,
      domain_sessionid
    ]
  }

  measure: engaged_user_low {
    type: count_distinct
    label: "engaged_user_low"
    group_label: "Count"
    description: "total number of users with engaged score LOW"
    sql: CASE WHEN ${engagement_type}='Low' THEN ${domain_userid} ELSE NULL END;;
  }

  measure: engaged_user_medium {
    type: count_distinct
    label: "engaged_user_medium"
    group_label: "Count"
    description: "total number of users with engaged score MEDIUM"
    sql: CASE WHEN ${engagement_type}='Medium' THEN ${domain_userid} ELSE NULL END;;
  }

  measure: engaged_user_high {
    type: count_distinct
    label: "engaged_user_high"
    group_label: "Count"
    description: "total number of users with engaged score HIGH"
    sql: CASE WHEN ${engagement_type}='High' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: new_user_count {
    label: "new_user_count"
    type: count_distinct
    description: "total number of new users"
    group_label: "Count"
    sql: ${domain_userid} ;;
    filters: [
      domain_sessionidx: "1"
    ]
    drill_fields: [user_details*]
  }

  measure: returned_user_count {
    label: "returned_user_count"
    type: count_distinct
    description: "total number of returned users"
    group_label: "Count"
    sql: ${domain_userid} ;;
    filters: [
      domain_sessionidx: ">1"
    ]
    drill_fields: [user_details*]
  }
  measure: total_direct_traffic {
    label: "total_direct_traffic"
    description: "Total Traffic from Direct Search"
    group_label: "Traffic Count"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Direct Search' THEN ${domain_userid} ELSE NULL END ;;
  }


  measure: total_organic_traffic{
    label: "total_organic_traffic"
    group_label: "Traffic Count"
    description: "Total number of organic traffic"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Organic Search' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_paid_traffic {
    label: "total_paid_traffic"
    group_label: "Traffic Count"
    description: "Total traffic coming from paid sources"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Paid Search' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_social_traffic {
    label: "total_social_traffic"
    group_label: "Traffic Count"
    description: "Total traffic coming from search"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Social' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_email_traffic {
    label: "total_email_traffic"
    group_label: "Traffic Count"
    description: "Total number of traffic coming from email"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Email' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_display_traffic {
    label: "total_display_traffic"
    group_label: "Traffic Count"
    description: "Total traffic coming from display advert"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Display' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_advert_traffic {
    label: "total_advert_traffic"
    group_label: "Traffic Count"
    description: "Total traffic coming from advertisement"
    type: count_distinct
    sql: CASE WHEN ${traffic_type}='Advertising' THEN ${domain_userid} ELSE NULL END ;;
  }

  measure: total_page_views {
    label: "total_page_views"
    group_label: "Count"
    description: "total number of distinct page views"
    type: count_distinct
    sql: ${page_view_id} ;;
  }


}
