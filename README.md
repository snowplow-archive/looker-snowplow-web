[![maintained]][tracker-classificiation][![License][license-image]][license][![Discourse posts][discourse-image]][discourse]

# looker-snowplow-web

This LookML block makes the derived tables produced by the [Snowplow Web V1 model][snowplow-web-v1-docs] available for exploration in Looker.

The derived tables are:

- Page Views: Aggregates event level data to a page view level, `page_view_id`.
- Sessions: Aggregates page view level data to a session level, `domain_sessionid`.
- Users: Aggregates session level data to a users level, `domain_userid`.

A series of dashboards have also been included to help visualize the data.

## Set Up

There are two ways to use this block. Either as a fork of this repository and as a `local_dependency`, or by including it as a `remote_dependency`.

Forking this repository will allow you to customize this block beyond the available configurable properties in the `manifest.lkml`. Including this as a `remote_dependency` means you can use the block as-is and benefit from any future updates we publish directly in Looker without having to update your fork.

### Using a fork

- Fork this repository.
- Create a new project within your Looker instance, `snowplow_web_looker_block` for example. Select `Clone Public Git Repository` as your starting point and enter the URL of your forked repository.
- Within your main Looker project's manifest file, you can add the looker project containing the Snowplow Looker Block as local dependency.
- Overwrite the `connection` constant in the [manifest file](./manifest.lkml) to the database connection where your Snowplow data lives.

```YML
project_name: "<your_project_name>"

local_dependency: {
  project: "<project_name_containing_snowplow_block>" 
  override_constant: connection {
    value: "<your_connection_name>"
  }
}
```

- Verify that the table and schema names, defined in the [manifest file](./manifest.lkml), aligns with the table names in your database. If you are using the `snowlow-web` dbt package you will most likely need to update these. Overwrite these if that is not the case.

```YML
project_name: "<your_project_name>"

local_dependency: {
  project: "<project_name_containing_snowplow_block>" 
  override_constant: connection {
    value: "<your_connection_name>"
  }
  override_constant: schema {
    value: "derived"
  }
  override_constant: page_views_table {
    value: "page_views"
  }
  override_constant: sessions_table {
    value: "sessions"
  }
  override_constant: users_table {
    value: "users"
  }
}
```

- You can then reference the views and dashboards in your model by including the files from the local dependency:

```YML
connection: "<your_connection_name>"

include: "//snowplow_block/views/*.view.lkml"
include: "//snowplow_block/dashboards/*.lookml"
```

- The LookML dashboards assume a model name of `snowplow_looker`. If your model name is different your should override the `model_name` constant.

```YML
  override_constant: model_name {
    value: "<my_model_name>"
  }
```

- Depending on how frequently you run the Snowplow Web V1 model, or how often you want to refresh the data in Looker, you may want to adjust the `datagroup` parameter within the model file. Please refer to Looker's doc on [datagroups][looker-datagroup-docs] for more information.

### Using as a remote_dependency

- Include this repository as a remote dependency in a new or existing project within your Looker instance.
- Overwrite the `connection` constant in the [manifest file](./manifest.lkml) to the database connection where your Snowplow data lives.

```YML
project_name: "<your_project_name>"

remote_dependency: snowplow_block {
  url: "https://github.com/snowplow/looker-snowplow-web"
  ref: "master"
  override_constant: connection {
    value: "<your_connection_name>"
  }
}
```

- Verify that the table and schema names, defined in the [manifest file](./manifest.lkml), aligns with the table names in your database. If you are using the `snowlow-web` dbt package you will most likely need to update these. Overwrite these if that is not the case.

```YML
remote_dependency: snowplow_block {
  url: "https://github.com/snowplow/looker-snowplow-web"
  override_constant: connection {
    value: "<your_connection_name>"
  }
  override_constant: schema {
    value: "derived"
  }
    override_constant: page_views_table {
    value: "page_views"
  }
    override_constant: sessions_table {
    value: "sessions"
  }
  override_constant: users_table {
    value: "users"
  }
}
```

- You can then reference the views and dashboards in your model by including the files from the remote dependency:

```YML
connection: "your_connection_name"

include: "//snowplow_block/views/*.view.lkml"
include: "//snowplow_block/dashboards/*.lookml"
```

- The LookML dashboards assume a model name of `snowplow_looker`. If your model name is different your should override the `model_name` constant.

```YML
  override_constant: model_name {
    value: "<my_model_name"
  }
```

- Depending on how frequently you run the Snowplow Web V1 model, or how often you want to refresh the data in Looker, you may want to adjust the `datagroup` parameter within the model file. Please refer to Looker's doc on [datagroups][looker-datagroup-docs] for more information.

For more information on setting up Looker blocks please refer to the [Looker docs][looker-block-docs].

# Join the Snowplow community

We welcome all ideas, questions and contributions!

For support requests, please use our community support [Discourse][discourse] forum.

If you find a bug, please report an issue on GitHub.

# Copyright and license

The looker-snowplow-web block is Copyright 2021 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


[tracker-classificiation]: https://github.com/snowplow/snowplow/wiki/Tracker-Maintenance-Classification
[maintained]: https://img.shields.io/static/v1?style=flat&label=Snowplow&message=Maintained&color=9e62dd&labelColor=9ba0aa&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAeFBMVEVMaXGXANeYANeXANZbAJmXANeUANSQAM+XANeMAMpaAJhZAJeZANiXANaXANaOAM2WANVnAKWXANZ9ALtmAKVaAJmXANZaAJlXAJZdAJxaAJlZAJdbAJlbAJmQAM+UANKZANhhAJ+EAL+BAL9oAKZnAKVjAKF1ALNBd8J1AAAAKHRSTlMAa1hWXyteBTQJIEwRgUh2JjJon21wcBgNfmc+JlOBQjwezWF2l5dXzkW3/wAAAHpJREFUeNokhQOCA1EAxTL85hi7dXv/E5YPCYBq5DeN4pcqV1XbtW/xTVMIMAZE0cBHEaZhBmIQwCFofeprPUHqjmD/+7peztd62dWQRkvrQayXkn01f/gWp2CrxfjY7rcZ5V7DEMDQgmEozFpZqLUYDsNwOqbnMLwPAJEwCopZxKttAAAAAElFTkSuQmCC 
[license]: http://www.apache.org/licenses/LICENSE-2.0
[license-image]: http://img.shields.io/badge/license-Apache--2-blue.svg?style=flat
[snowplow-web-v1-docs]: https://docs.snowplowanalytics.com/docs/modeling-your-data/the-snowplow-web-data-model/
[discourse-image]: https://img.shields.io/discourse/posts?server=https%3A%2F%2Fdiscourse.snowplowanalytics.com%2F
[discourse]: http://discourse.snowplowanalytics.com/
[looker-block-docs]: https://docs.looker.com/data-modeling/looker-blocks
[looker-datagroup-docs]: https://docs.looker.com/reference/model-params/datagroup
