# Analytics engineering with dbt

Template repository for the projects and environment of the course: Analytics engineering with dbt

> Please note that this sets some environment variables so if you create some new terminals please load them again.

## License
GPL-3.0

# Working locally

## Docker

```
docker pull ghcr.io/dbt-labs/dbt-snowflake:1.3.0

docker run -it \
    --network=host \
    -v /Users/oleg/corise/course-dbt/greenery:/usr/app/dbt \
    -v /Users/oleg/.dbt/:/root/.dbt/ \
    --entrypoint=bash \
    ghcr.io/dbt-labs/dbt-snowflake:1.3.0
```

## Python virtualenv

```
python3 -m venv venv
source venv/bin/activate

pip install dbt-snowflake

dbt debug
```
