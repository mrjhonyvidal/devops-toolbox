# Monitoring Docker containers
Run: `docker-compose up or docker-compose up -d (daemon mode)` 
Stop: `docker-compose down`

### Our Analytics Toolset
- Influxdb
- Prometheus background Node_exporter
- Cadvisor
- Prometheus      
- Grafana      

### Prometheus
- http://localhost:9090

### Grafana
http://localhost:3000

### InfluxDB
- http://localhost:8083

EXPOSES port: 8086

### [CAdvisor](https://github.com/google/cadvisor)
http://localhost:9500/containers

#### Add Grafana new InfluxDB add source
```
Connect to Grafana (http://locahost:3000/)

Click on Data Sources -> Add new

Add the following data:

Name: influxdb
Type: InfluxDB 0.9.x

Note: Check default option. So Grafana do not create random data.

Http settings
Url: http://localhost:8086
Access: 
    proxy (Grafana Backend will proxy the request) - still testing to use this option
    direct (via Browser)
Basic Auth: Enabled
User: admin
Password: admin

InfluxDB Details
Database: cadvisor
User: root
Password: root

Test Connection (should be successful) -> Save  
```

### What is running on docker monitor analytics combo?
```
docker-compose up                                                                                                                    
Creating devops_monitoring_node_exporter  ... done
Creating docker-monitoring_cadvisor_1     ... done
Creating devops_monitoring_prometheus     ... done
Creating docker-monitoring_grafana_1      ... done
Attaching to docker-monitoring_influxdbData_1, docker-monitoring_influxdb_1, devops_monitoring_node_exporter, docker-monitoring_cadvisor_1, devops_monitoring_prometheus, docker-monitoring_grafana_1
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.483Z caller=main.go:310 msg="No time or size retention was set so using the default time retention" duration=15d
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.483Z caller=main.go:346 msg="Starting Prometheus" version="(version=2.21.0, branch=HEAD, revision=e83ef207b6c2398919b69cd87d2693cfc2fb4127)"
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.483Z caller=main.go:347 build_context="(go=go1.15.2, user=root@a4d9bea8479e, date=20200911-11:35:02)"
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.483Z caller=main.go:348 host_details="(Linux 4.19.76-linuxkit #1 SMP Tue May 26 11:42:35 UTC 2020 x86_64 86696da2e7f2 (none))"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.182Z caller=node_exporter.go:177 msg="Starting node_exporter" version="(version=1.0.1, branch=HEAD, revision=3715be6ae899f2a9b9dbfd9c39f3e09a7bd4559f)"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.182Z caller=node_exporter.go:178 msg="Build context" build_context="(go=go1.14.4, user=root@1f76dbbcfa55, date=20200616-12:44:12)"
cadvisor_1       | W1012 17:23:01.141542       1 manager.go:349] Could not configure a source for OOM detection, disabling OOM events: open /dev/kmsg: no such file or directory
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.483Z caller=main.go:349 fd_limits="(soft=1048576, hard=1048576)"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:105 msg="Enabled collectors"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=arp
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=bcache
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=bonding
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=btrfs
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.484Z caller=main.go:350 vm_limits="(soft=unlimited, hard=unlimited)"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=conntrack
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=cpu
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=cpufreq
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=diskstats
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=edac
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=entropy
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=filefd
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=filesystem
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=hwmon
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=infiniband
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=ipvs
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.493Z caller=main.go:701 msg="Starting TSDB ..."
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.493Z caller=web.go:523 component=web msg="Start listening for connections" address=0.0.0.0:9090
docker-monitoring_influxdbData_1 exited with code 0
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.508Z caller=head.go:644 component=tsdb msg="Replaying on-disk memory mappable chunks if any"
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.508Z caller=head.go:658 component=tsdb msg="On-disk memory mappable chunks replay completed" duration=23.8µs
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.508Z caller=head.go:664 component=tsdb msg="Replaying WAL, this may take a while"
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=loadavg
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=mdadm
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=meminfo
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=netclass
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=netdev
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=netstat
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=nfs
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=nfsd
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=powersupplyclass
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=pressure
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=rapl
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=schedstat
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.183Z caller=node_exporter.go:112 collector=sockstat
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=softnet
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=stat
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=textfile
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=thermal_zone
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=time
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=timex
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=udp_queues
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=uname
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=vmstat
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=xfs
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:112 collector=zfs
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=node_exporter.go:191 msg="Listening on" address=:9100
devops_monitoring_node_exporter | level=info ts=2020-10-12T17:22:49.184Z caller=tls_config.go:170 msg="TLS is disabled and it cannot be enabled on the fly." http2=false
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.513Z caller=head.go:716 component=tsdb msg="WAL segment loaded" segment=0 maxSegment=2
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.514Z caller=head.go:716 component=tsdb msg="WAL segment loaded" segment=1 maxSegment=2
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.517Z caller=head.go:716 component=tsdb msg="WAL segment loaded" segment=2 maxSegment=2
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.517Z caller=head.go:719 component=tsdb msg="WAL replay completed" checkpoint_replay_duration=1.2322ms wal_replay_duration=7.7102ms total_replay_duration=9.1054ms
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.521Z caller=main.go:721 fs_type=65735546
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.521Z caller=main.go:724 msg="TSDB started"
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.521Z caller=main.go:850 msg="Loading configuration file" filename=/etc/prometheus/prometheus.yml
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.523Z caller=main.go:881 msg="Completed loading of configuration file" filename=/etc/prometheus/prometheus.yml totalDuration=1.7044ms remote_storage=5.5µs web_handler=6.7µs query_engine=4.2µs scrape=236.1µs scrape_sd=28.4µs notify=5µs notify_sd=4µs rules=4.8µs
devops_monitoring_prometheus | level=info ts=2020-10-12T17:23:07.523Z caller=main.go:673 msg="Server is ready to receive web requests."
influxdb_1       | => The initialization script had been executed before, skipping ...
influxdb_1       | => Starting InfluxDB in foreground ...
influxdb_1       | 
influxdb_1       |  8888888           .d888 888                   8888888b.  888888b.
influxdb_1       |    888            d88P"  888                   888  "Y88b 888  "88b
influxdb_1       |    888            888    888                   888    888 888  .88P
influxdb_1       |    888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
influxdb_1       |    888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
influxdb_1       |    888   888  888 888    888 888  888   X88K   888    888 888    888
influxdb_1       |    888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
influxdb_1       |  8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"
influxdb_1       | 
influxdb_1       | 2020/10/12 17:21:39 InfluxDB starting, version 0.9.6.1, branch 0.9.6, commit 6d3a8603cfdaf1a141779ed88b093dcc5c528e5e, built 2015-12-10T23:40:23+0000
influxdb_1       | 2020/10/12 17:21:39 Go version go1.4.2, GOMAXPROCS set to 8
influxdb_1       | 2020/10/12 17:21:39 Using configuration at: /config/config.toml
influxdb_1       | [metastore] 2020/10/12 17:21:39 Using data dir: /data/meta
influxdb_1       | [metastore] 2020/10/12 17:21:39 Node at localhost:8088 [Follower]
influxdb_1       | [metastore] 2020/10/12 17:21:39 Skipping cluster join: already member of cluster: nodeId=1 raftEnabled=true peers=[localhost:8088]
influxdb_1       | [metastore] 2020/10/12 17:21:40 Node at localhost:8088 [Leader]. peers=[localhost:8088]
influxdb_1       | [metastore] 2020/10/12 17:21:40 Updated node id=1 hostname=localhost:8088
influxdb_1       | [metastore] 2020/10/12 17:21:40 spun up monitoring for 1
influxdb_1       | [store] 2020/10/12 17:21:40 Using data dir: /data/db
influxdb_1       | [wal] 2020/10/12 17:21:40 WAL starting with 30720 ready series size, 0.50 compaction threshold, and 52428800 partition size threshold
influxdb_1       | [wal] 2020/10/12 17:21:40 WAL writing to /data/wal/cadvisor/default/2
influxdb_1       | [wal] 2020/10/12 17:21:40 WAL starting with 30720 ready series size, 0.50 compaction threshold, and 52428800 partition size threshold
influxdb_1       | [wal] 2020/10/12 17:21:40 WAL writing to /data/wal/_internal/monitor/1
influxdb_1       | [wal] 2020/10/12 17:21:40 reading WAL files to flush to index
influxdb_1       | [wal] 2020/10/12 17:21:40 writing 7 series from WAL file /data/wal/_internal/monitor/1/01.000003.wal to index
influxdb_1       | [handoff] 2020/10/12 17:21:40 Starting hinted handoff service
influxdb_1       | [monitor] 2020/10/12 17:21:40 'hh' registered for diagnostics monitoring
influxdb_1       | [handoff] 2020/10/12 17:21:40 Using data dir: /data/hh
influxdb_1       | [subscriber] 2020/10/12 17:21:40 opened service
influxdb_1       | [monitor] 2020/10/12 17:21:40 Starting monitor system
influxdb_1       | [monitor] 2020/10/12 17:21:40 'build' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:21:40 'runtime' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:21:40 'network' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:21:40 'system' registered for diagnostics
```

### Open Source Resources

- https://github.com/prometheus/prometheus
- https://github.com/vegasbrianc/prometheus
- https://github.com/RiFi2k/dockerize-your-dev
- https://grafana.com/grafana/dashboards/893
- https://github.com/vegasbrianc/prometheus/blob/master/docker-compose.yml
- https://github.com/alerta/prometheus-config/blob/master/docker-compose.yml

## Known issues
- https://github.com/helm/charts/issues/2712 
```
 command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.local.path=/prometheus' <!--- Error parsing commandline arguments: unknown long flag '--storage.local.path'
      - '--alertmanager.url=http://alertmanager:9093'
```

- https://github.com/prometheus/prometheus/issues/2878
[New rule format](https://prometheus.io/blog/2017/06/21/prometheus-20-alpha3-new-rule-format/)
```
monitoring_prometheus | prometheus: error: unknown short flag '-c'
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:105 msg="Enabled collectors"
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=arp
influxdb_1       | => Starting InfluxDB in background ...
influxdb_1       | => Waiting for confirmation of InfluxDB service startup ...
influxdb_1       | 
influxdb_1       |  8888888           .d888 888                   8888888b.  888888b.
influxdb_1       |    888            d88P"  888                   888  "Y88b 888  "88b
influxdb_1       |    888            888    888                   888    888 888  .88P
influxdb_1       |    888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
influxdb_1       |    888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
influxdb_1       |    888   888  888 888    888 888  888   X88K   888    888 888    888
influxdb_1       |    888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
influxdb_1       |  8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"
influxdb_1       | 
influxdb_1       | 2020/10/12 16:49:20 InfluxDB starting, version 0.9.6.1, branch 0.9.6, commit 6d3a8603cfdaf1a141779ed88b093dcc5c528e5e, built 2015-12-10T23:40:23+0000
influxdb_1       | 2020/10/12 16:49:20 Go version go1.4.2, GOMAXPROCS set to 8
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=bcache
influxdb_1       | 2020/10/12 16:49:21 Using configuration at: /config/config.toml
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=bonding
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=btrfs
influxdb_1       | [metastore] 2020/10/12 16:49:21 Using data dir: /data/meta
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=conntrack
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=cpu
influxdb_1       | [metastore] 2020/10/12 16:49:21 Node at localhost:8088 [Follower]
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=cpufreq
influxdb_1       | [metastore] 2020/10/12 16:49:22 Node at localhost:8088 [Leader]. peers=[]
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=diskstats
```
