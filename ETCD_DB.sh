ETCDCTL="etcdctl --timeout 15s --total-timeout 30s --endpoints http://etcdsystem.servicebroker.dataos.io:2379 --username asiainfoLDP:6ED9BA74-75FD-4D1B-8916-842CB936AC1A"
API_NAME=asiainfoLDP
API_PASSWORD=2016asia

$ETCDCTL mkdir /servicebroker/databaseshare
$ETCDCTL set /servicebroker/databaseshare/username $API_NAME
$ETCDCTL set /servicebroker/databaseshare/password $API_PASSWORD
$ETCDCTL mkdir /servicebroker/databaseshare/instance
$ETCDCTL mkdir /servicebroker/databaseshare/catalog



###创建服务 AWS-MongoDB
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/name "MongoDB"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/description "MongoDB是一个基于分布式文件存储的数据库。"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/bindable true
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/planupdatable false
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/tags 'nosql,MongoDB,DataBase'
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/metadata '{"displayName": "MongoDB","imageUrl": "pub/assets/MongoDB.png","longDescription": "MongoDB unleashes the power of software and data for innovators everywhere","providerDisplayName": "Asiainfo","documentationUrl": "https://docs.mongodb.org/manual/","supportUrl": "https://www.mongodb.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/257C6C2B-A376-4551-90E8-82D4E619C852
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/257C6C2B-A376-4551-90E8-82D4E619C852/name "ShareandCommon"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/257C6C2B-A376-4551-90E8-82D4E619C852/description "单独MongoDB实例以及数据共享区"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/257C6C2B-A376-4551-90E8-82D4E619C852/metadata '{"displayName": "Big Bunny","bullets": ["20 GB of Disk", "20 connections"],"costs": [{"amount": {"eur": 49,"usd": 99},"unit": "MONTHLY"}, {"amount": {"eur": 0.49,"usd": 0.99},"unit": "1GB of messages over 20GB"}]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/257C6C2B-A376-4551-90E8-82D4E619C852/free false
###创建套餐2
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/E28FB3AE-C237-484F-AC9D-FB0A80223F85
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/E28FB3AE-C237-484F-AC9D-FB0A80223F85/name "Experimental"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/E28FB3AE-C237-484F-AC9D-FB0A80223F85/description "单独MongoDB实例"
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/E28FB3AE-C237-484F-AC9D-FB0A80223F85/metadata '{"displayName": "Shared and Free","bullets": ["20 GB of Disk", "20 connections"]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/A25DE423-484E-4252-B6FE-EA4F347BCE3D/plan/E28FB3AE-C237-484F-AC9D-FB0A80223F85/free true





###创建服务 AWS-PostgreSQL
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/name "PostgreSQL"
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/description "PostgreSQL对象关系型数据库。"
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/bindable true
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/planupdatable false
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/tags 'postgresql,database'
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/metadata '{"displayName": "Postgresql","imageUrl": "pub/assets/PostgreSQL.png","longDescription": "the world most advanced open source database","providerDisplayName": "Asiainfo","documentationUrl": "http://www.postgresql.org/docs/","supportUrl": "http://www.postgresql.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan/bd9a94f2-5718-4dde-a773-61ff4ad9e843
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan/bd9a94f2-5718-4dde-a773-61ff4ad9e843/name "Experimental"
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan/bd9a94f2-5718-4dde-a773-61ff4ad9e843/description "单独PostgreSQL实例"
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan/bd9a94f2-5718-4dde-a773-61ff4ad9e843/metadata '{"displayName": "Shared and Free","bullets": ["20 GB of Disk", "20 connections"]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/cb2d4021-5fbc-45c2-92a9-9584583b7ce5/plan/bd9a94f2-5718-4dde-a773-61ff4ad9e843/free false








###创建服务 AWS-Mysql
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/name "Mysql"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/description "MySQL是WEB应用方面最好的关系数据库管理系统应用软件之一。"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/bindable true
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/planupdatable false
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/tags 'mysql,database'
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/metadata '{"displayName": "Mysql","imageUrl": "pub/assets/Mysql.png","longDescription": "OpenSoure RDMBS Mysql","providerDisplayName": "Asiainfo","documentationUrl": "http://docs.mysql.com","supportUrl": "http://www.mysql.com"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/56660431-6032-43D0-A114-FFA3BF521B66
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/56660431-6032-43D0-A114-FFA3BF521B66/name "Experimental"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/56660431-6032-43D0-A114-FFA3BF521B66/description "单独Mysql实例（区分大小写）"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/56660431-6032-43D0-A114-FFA3BF521B66/metadata '{"displayName": "Shared and Free","bullets": ["20 GB of Disk", "20 connections"]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/56660431-6032-43D0-A114-FFA3BF521B66/free true
###创建套餐2
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/F6A1B0F6-878E-43CA-B2CA-1134239D0675
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/F6A1B0F6-878E-43CA-B2CA-1134239D0675/name "NoCase"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/F6A1B0F6-878E-43CA-B2CA-1134239D0675/description "单独Mysql实例（不区分大小写）"
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/F6A1B0F6-878E-43CA-B2CA-1134239D0675/metadata '{"displayName": "Shared and Free","bullets": ["20 GB of Disk", "20 connections"]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/b90d0bd4-7be9-4000-b255-378bea4adf68/plan/F6A1B0F6-878E-43CA-B2CA-1134239D0675/free true




###创建服务 AWS-Greenplum
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/name "Greenplum"
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/description "Greenplum是Pivotal开源的MPP数据库。"
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/bindable true
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/planupdatable false
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/tags 'Greenplum,mpp,database'
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/metadata '{"displayName": "Greenplum","imageUrl": "pub/assets/Greenplum.png","longDescription": "The First Open SourceMassively Parallel Data Warehouse","providerDisplayName": "Asiainfo","documentationUrl": "http://gpdb.docs.pivotal.io","supportUrl": "http://greenplum.org"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan/B48A3972-536F-47A6-B04F-A5344F4DC5E0
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan/B48A3972-536F-47A6-B04F-A5344F4DC5E0/name "Experimental"
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan/B48A3972-536F-47A6-B04F-A5344F4DC5E0/description "单独Greenplum实例"
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan/B48A3972-536F-47A6-B04F-A5344F4DC5E0/metadata '{"displayName": "Shared and Free","bullets": ["20 GB of Disk", "20 connections"]}'
$ETCDCTL set /servicebroker/databaseshare/catalog/98E2AFE3-7279-40CA-B04E-74276B3FF4B2/plan/B48A3972-536F-47A6-B04F-A5344F4DC5E0/free false




###创建服务 AWS-Oracle
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/name "Oracle"
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/description "亚马逊AWS提供的Oracle关系型数据库。版本：v11.2"
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/bindable true
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/planupdatable false
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/tags 'oracle,aws'
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/metadata '{"displayName":"Oracle","imageUrl":"pub/assets/Oracle.png","longDescription":"Managed, highly available Oracle RDS on AWS.","providerDisplayName":"Asiainfo","documentationUrl":"https://www.oracle.com","supportUrl":"https://www.oracle.com"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan/190ede6b-dd42-4e09-9235-ba8be5030eff
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan/190ede6b-dd42-4e09-9235-ba8be5030eff/name "Experimental"
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan/190ede6b-dd42-4e09-9235-ba8be5030eff/description "HA Oracle on AWS"
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan/190ede6b-dd42-4e09-9235-ba8be5030eff/metadata '{"bullets":["256 MB of Disk","1 connection"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/databaseshare/catalog/A4CF964D-4530-465A-8F70-C7F17209AF68/plan/190ede6b-dd42-4e09-9235-ba8be5030eff/free true

