# UsageWatch to Influx DB

![screenshot](https://cloud.githubusercontent.com/assets/80459/22616085/60744084-ea6b-11e6-948f-f5c939072585.png)

Proof of concept to populate an InfluxDB database with system measurements so I could build Grafana charts.

## Setup

- Docker containers for Grafana and InfluxDB
- `curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE grafana"`
- Configure authentication-less data source in a the Grafana container
- `bundle install --path=vendor/bundle`
- `bundle exec data_collector.rb` (runs in an infinite loop)

## Notes

- Definitely not intended to do actual metric collection. Consider using something like `collectd` in a real environment.
