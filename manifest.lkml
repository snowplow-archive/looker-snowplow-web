constant: connection {
  value: "string"
  export: override_required
}

constant: schema {
  value: "derived"
  export: override_optional
}

constant: page_views_table {
  value: "page_views"
  export: override_optional
}

constant: sessions_table {
  value: "sessions"
  export: override_optional
}

constant: users_table {
  value: "users"
  export: override_optional
}

constant: model_name {
  value: "snowplow_looker"
  export: override_optional
}
