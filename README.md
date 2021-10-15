[![actively-maintained]][tracker-classificiation][![License][license-image]][license][![Discourse posts][discourse-image]][discourse]

# looker-snowplow-web

This LookML block makes the derived tables produced by the [Snowplow Web V1 model][snowplow-web-v1-docs] available for exploration in Looker.

The derived tables are:

- Page Views: Aggregates event level data to a page view level, `page_view_id`.
- Sessions: Aggregates page view level data to a session level, `domain_sessionid`.
- Users: Aggregates session level data to a users level, `domain_userid`.

A series of dashboards have also been included to help visualize the data.

## Set Up

1. Fork this repository.
2. Update the `connection` variable in the [snowplow_looker model file](./models/snowplow_looker.model.lkml) to the database connection where your Snowplow data lives.
3. Create a new project within your Looker instance, `snowplow_web_looker_block` for example. Select `Clone Public Git Repository` as your starting point and enter the URL of your fork repository.
4. Verify that the table and schema names, defined by `sql_table_name`, in each of the views files aligns with the table names in your database. If you are using the `snowlow-web` dbt package you will most likely need to update these.
5. Within your main Looker project's manifest file, add the looker project containing the Snowplow Looker Block as local dependency:

```YML
project_name: "<your_project_name>"

local_dependency: {
  project: "<project_name_containing_snowplow_block>" # e.g. snowplow_web_looker_block
}
```

6. Depending on how frequently you run the Snowplow Web V1 model, or how often you want to refresh the data in Looker, you may want to adjust the `datagroup` parameter within the model file. Please refer to Looker's doc on [datagroups][looker-datagroup-docs] for more information.

For more information on setting up Looker blocks please refer to the [Looker docs][looker-block-docs].

# Join the Snowplow community

We welcome all ideas, questions and contributions!

For support requests, please use our community support [Discourse][discourse] forum.

If you find a bug, please report an issue on GitHub.

# Copyright and license

The snowplow-web package is Copyright 2021 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


[tracker-classificiation]: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/tracker-maintenance-classification/
[license]: http://www.apache.org/licenses/LICENSE-2.0
[license-image]: http://img.shields.io/badge/license-Apache--2-blue.svg?style=flat
[actively-maintained]: https://img.shields.io/static/v1?style=flat&label=Snowplow&message=Actively%20Maintained&color=6638b8&labelColor=9ba0aa&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAeFBMVEVMaXGXANeYANeXANZbAJmXANeUANSQAM+XANeMAMpaAJhZAJeZANiXANaXANaOAM2WANVnAKWXANZ9ALtmAKVaAJmXANZaAJlXAJZdAJxaAJlZAJdbAJlbAJmQAM+UANKZANhhAJ+EAL+BAL9oAKZnAKVjAKF1ALNBd8J1AAAAKHRSTlMAa1hWXyteBTQJIEwRgUh2JjJon21wcBgNfmc+JlOBQjwezWF2l5dXzkW3/wAAAHpJREFUeNokhQOCA1EAxTL85hi7dXv/E5YPCYBq5DeN4pcqV1XbtW/xTVMIMAZE0cBHEaZhBmIQwCFofeprPUHqjmD/+7peztd62dWQRkvrQayXkn01f/gWp2CrxfjY7rcZ5V7DEMDQgmEozFpZqLUYDsNwOqbnMLwPAJEwCopZxKttAAAAAElFTkSuQmCC
[snowplow-web-v1-docs]: https://docs.snowplowanalytics.com/docs/modeling-your-data/the-snowplow-web-data-model/
[discourse-image]: https://img.shields.io/discourse/posts?server=https%3A%2F%2Fdiscourse.snowplowanalytics.com%2F
[discourse]: http://discourse.snowplowanalytics.com/
[looker-block-docs]: https://docs.looker.com/data-modeling/looker-blocks
[looker-datagroup-docs]: https://docs.looker.com/reference/model-params/datagroup
