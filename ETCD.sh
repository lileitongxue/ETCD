#!/bin/bash

#连接etcd服务 定义API用户名和密码
export ETCDCTL="etcdctl --timeout 15s --total-timeout 30s --endpoints http://localhost:2379 --username root:tiger123"
API_NAME=citic
API_PASSWORD=2016citic

#获取执行方法的参数 执行相应的方法体
command=$@
use_command="you can use command: sh `basename $0`  one or more  parameter from Init,Cassandra,Elasticsearch,Kafka,Kettle,MongoDB,Neo4j,NiFi,PySpider,RabbitMQ,Redis,Spark,Storm,TensorlFlow,Zookeeper,ALL"

function Init(){
#创建service-broker容器化需要的文件
$ETCDCTL mkdir /servicebroker
$ETCDCTL mkdir /servicebroker/openshift
$ETCDCTL set /servicebroker/openshift/username $API_NAME
$ETCDCTL set /servicebroker/openshift/password $API_PASSWORD
$ETCDCTL mkdir /servicebroker/openshift/instance
$ETCDCTL mkdir /servicebroker/openshift/catalog

}

function Neo4j(){
###创建服务 neo4j
$ETCDCTL mkdir /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/name "Neo4j"
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/description "A Sample Neo4j (v3.2.1) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/tags 'neo4j,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/metadata '{"displayName":"Neo4j","imageUrl":"https://neo4j.com/wp-content/themes/neo4jweb/assets/images/neo4j-logo-2015.png","longDescription":"Managed, highly available neo4j clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://neo4j.com/docs/","supportUrl":"https://neo4j.com/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/description "HA neo4j on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free", "customize":{"volumeSize":{"default":2, "max":5, "price":10, "unit":"GB", "step":1, "desc":"volume size "}} }'
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/free true
{"bullets":["10 GB of Disk","20 connections"],"displayName":"Shared and Free", "customize":{"volumeSize":{"default":10, "max":40, "price":10, "unit":"GB", "step":10, "desc":"volume size "}} }


$ETCDCTL get /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/metadata
$ETCDCTL set /servicebroker/openshift/catalog/3c208518-5583-460c-baeb-1c0082fee307/plan/0e59b258-4e3d-46fa-8b87-9892895383b1/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free", "customize":{"volumeSize":{"default":10, "max":200, "price":10, "unit":"GB", "step":10, "desc":"volume size "}} }'

###创建套餐目录2(pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/5E397661-1385-464A-8DB7-9C4DF8CC0662/plan/256D56C0-B83D-11E6-B227-2714EF851DCA
$ETCDCTL set /servicebroker/openshift/catalog/5E397661-1385-464A-8DB7-9C4DF8CC0662/plan/256D56C0-B83D-11E6-B227-2714EF851DCA/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/5E397661-1385-464A-8DB7-9C4DF8CC0662/plan/256D56C0-B83D-11E6-B227-2714EF851DCA/description "HA etcd on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/5E397661-1385-464A-8DB7-9C4DF8CC0662/plan/256D56C0-B83D-11E6-B227-2714EF851DCA/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/5E397661-1385-464A-8DB7-9C4DF8CC0662/plan/256D56C0-B83D-11E6-B227-2714EF851DCA/free true

}

function Spark(){
###创建服务 spark
$ETCDCTL mkdir /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/name "Spark"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/description "A Sample Spark (v1.5.2) cluster on Openshift with one worker node"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/tags 'spark,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/metadata '{"displayName":"Spark","imageUrl":"http://spark.apache.org/images/spark-logo-trademark.png","longDescription":"Managed, highly available Spark clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"http://spark.apache.org/docs/latest/","supportUrl":"http://spark.apache.org"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/CB00754C-11FF-444F-8419-9AA9B1E04970
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/CB00754C-11FF-444F-8419-9AA9B1E04970/name "One_Worker"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/CB00754C-11FF-444F-8419-9AA9B1E04970/description "Spark on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/CB00754C-11FF-444F-8419-9AA9B1E04970/metadata '{"bullets":["20 GB of Disk","one worker node"],"displayName":"Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/CB00754C-11FF-444F-8419-9AA9B1E04970/free true
###创建套餐2
$ETCDCTL mkdir /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/65242C9B-C266-4F1D-A28B-98B1A2043A84
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/65242C9B-C266-4F1D-A28B-98B1A2043A84/name "Three_Workers"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/65242C9B-C266-4F1D-A28B-98B1A2043A84/description "HA Spark on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/65242C9B-C266-4F1D-A28B-98B1A2043A84/metadata '{"bullets":["20 GB of Disk","three worker nodes"],"displayName":"High Available" }'
$ETCDCTL set /servicebroker/openshift/catalog/0674A0E3-5EE4-425C-BE43-5A61EB3F52A6/plan/65242C9B-C266-4F1D-A28B-98B1A2043A84/free false

}

function Zookeeper(){
###创建服务 zookeeper
$ETCDCTL mkdir /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/name "ZooKeeper"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/description "A Sample ZooKeeper (v3.4.8) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/tags 'zookeeper,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/metadata '{"displayName":"ZooKeeper","imageUrl":"https://zookeeper.apache.org/images/feather_small.gif","longDescription":"Managed, highly available zookeeper clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://zookeeper.apache.org/doc/trunk","supportUrl":"https://zookeeper.apache.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan
###创建套餐1 (emptyDir)
$ETCDCTL mkdir /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/221F1338-96C1-4135-A865-9CDA4C12A185
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/221F1338-96C1-4135-A865-9CDA4C12A185/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/221F1338-96C1-4135-A865-9CDA4C12A185/description "HA ZooKeeper on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/221F1338-96C1-4135-A865-9CDA4C12A185/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/221F1338-96C1-4135-A865-9CDA4C12A185/free true
###创建套餐2 (pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/dffc3555-eb18-4c7b-ac56-bd326b19dcd0
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/dffc3555-eb18-4c7b-ac56-bd326b19dcd0/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/dffc3555-eb18-4c7b-ac56-bd326b19dcd0/description "HA ZooKeeper With Volumes on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/dffc3555-eb18-4c7b-ac56-bd326b19dcd0/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/FA780A47-4AB2-4035-8638-287538B13416/plan/dffc3555-eb18-4c7b-ac56-bd326b19dcd0/free true

}

function RabbitMQ(){
###创建服务 RabbitMQ
$ETCDCTL mkdir /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/name "RabbitMQ"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/description "A Sample RabbitMQ (v3.6.1) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/tags 'rabbitmq,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/metadata '{"displayName":"RabbitMQ","imageUrl":"https://www.rabbitmq.com/img/rabbitmq_logo_strap.png","longDescription":"Managed, highly available rabbitmq clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://www.rabbitmq.com/documentation.html","supportUrl":"https://www.rabbitmq.com/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/CC5ED8A2-1677-43A0-ADE5-27F713C6F51B
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/CC5ED8A2-1677-43A0-ADE5-27F713C6F51B/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/CC5ED8A2-1677-43A0-ADE5-27F713C6F51B/description "HA RabbitMQ on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/CC5ED8A2-1677-43A0-ADE5-27F713C6F51B/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/CC5ED8A2-1677-43A0-ADE5-27F713C6F51B/free true
###创建套餐2(pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/28749ee2-6f30-4967-8311-2bf34f9a5421
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/28749ee2-6f30-4967-8311-2bf34f9a5421/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/28749ee2-6f30-4967-8311-2bf34f9a5421/description "HA RabbitMQ With Volumes on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/28749ee2-6f30-4967-8311-2bf34f9a5421/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" ,"customize":{"volumeSize":{"default":2, "max":5, "price":10, "unit":"GB", "step":1, "desc":"volume size "}} }'
$ETCDCTL set /servicebroker/openshift/catalog/86272DCB-86D5-4039-9E05-894436B8E71D/plan/28749ee2-6f30-4967-8311-2bf34f9a5421/free true

}

function Redis(){
###创建服务 Redis
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/name "Redis"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/description "A Sample Redis (v2.8) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/tags 'redis,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/metadata '{"displayName":"Redis","imageUrl":"http://redis.io/images/redis-300dpi.png","longDescription":"Managed, highly available redis clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"http://redis.io/documentation","supportUrl":"http://redis.io"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan
###创建套餐1 (emptyDir)
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/46ED475B-82A7-4C46-9767-0E3E806848F5
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/46ED475B-82A7-4C46-9767-0E3E806848F5/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/46ED475B-82A7-4C46-9767-0E3E806848F5/description "HA Redis on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/46ED475B-82A7-4C46-9767-0E3E806848F5/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/46ED475B-82A7-4C46-9767-0E3E806848F5/free true
###创建套餐2 (pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f8554827-4f67-4082-84af-6d35475c1ea8
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f8554827-4f67-4082-84af-6d35475c1ea8/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f8554827-4f67-4082-84af-6d35475c1ea8/description "HA Redis With Volumes on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f8554827-4f67-4082-84af-6d35475c1ea8/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f8554827-4f67-4082-84af-6d35475c1ea8/free true
###创建套餐3 (single master pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f0d2e7b8-824e-11e7-8995-d3dba46d9a21
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f0d2e7b8-824e-11e7-8995-d3dba46d9a21/name "volumes_single"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f0d2e7b8-824e-11e7-8995-d3dba46d9a21/description "Single Redis Master Server With Volumes on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f0d2e7b8-824e-11e7-8995-d3dba46d9a21/metadata '{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/f0d2e7b8-824e-11e7-8995-d3dba46d9a21/free true

#读取json文件
###创建套餐4 (4.0+ cluster)
$ETCDCTL mkdir /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb/name "volumes_cluster"
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb/description "Redis Cluster With Volumes on Openshift"

myFile="./Redis.json"
if [ ! -f "$myFile" ];then
  defaultmetadatavalue='{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
  $ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb/metadata "$defaultmetadatavalue"  
else
  jsonword=""
  for i in `sed '1d;$d' Redis.json`
  do
    jsonword=$jsonword$i
  done
  metadatavalue='{"bullets":["1 GB of Disk","20 connections"],"displayName":"Shared and Free",'"$jsonword }"
  $ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb/metadata "$metadatavalue"
fi 
$ETCDCTL set /servicebroker/openshift/catalog/A54BC117-25E3-4E41-B8F7-14FC314D04D3/plan/94bcf092-74e7-49b1-add6-314fb2c7bdfb/free true

}

function Kafka(){
###创建服务 Kafka
$ETCDCTL mkdir /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/name "Kafka"
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/description "A Sample Kafka (v0.9.0) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/tags 'kafka,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/metadata '{"displayName":"Kafka","imageUrl":"http://svn.apache.org/repos/asf/kafka/site/logos/kafka-logo-wide.png","longDescription":"Managed, highly available kafka clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"http://kafka.apache.org/documentation.html","supportUrl":"http://kafka.apache.org"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan/9A14FEF4-FB41-4C84-A175-A80492A50875
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan/9A14FEF4-FB41-4C84-A175-A80492A50875/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan/9A14FEF4-FB41-4C84-A175-A80492A50875/description "HA Kafka on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan/9A14FEF4-FB41-4C84-A175-A80492A50875/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/9972923D-0787-4271-839C-D000BD87E309/plan/9A14FEF4-FB41-4C84-A175-A80492A50875/free true

}

function Cassandra(){
###创建服务 Cassandra
$ETCDCTL mkdir /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/name "Cassandra"
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/description "A Sample Cassandra (v3.4) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/tags 'cassandra,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/metadata '{"displayName":"Cassandra","imageUrl":"https://cassandra.apache.org/media/img/cassandra_logo.png","longDescription":"Managed, highly available cassandra clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://wiki.apache.org/cassandra/GettingStarted","supportUrl":"https://cassandra.apache.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan/7B7EC041-2090-4ACB-AE0F-E8BDF315A778
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan/7B7EC041-2090-4ACB-AE0F-E8BDF315A778/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan/7B7EC041-2090-4ACB-AE0F-E8BDF315A778/description "HA Cassandra on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan/7B7EC041-2090-4ACB-AE0F-E8BDF315A778/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/3D7D7D07-D704-4B22-B492-EE5AE5301A55/plan/7B7EC041-2090-4ACB-AE0F-E8BDF315A778/free true

}

function Storm (){
###创建服务 Storm
$ETCDCTL mkdir /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/name "Storm"
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/description "A Sample Storm (v0.9.2) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/tags 'storm,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/metadata '{"displayName":"Storm","imageUrl":"https://storm.apache.org/images/logo.png","longDescription":"Managed, highly available storm clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://storm.apache.org/releases/1.0.1/index.html","supportUrl":"https://storm.apache.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan/D0B82741-770A-463C-818F-6E99862367DF
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan/D0B82741-770A-463C-818F-6E99862367DF/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan/D0B82741-770A-463C-818F-6E99862367DF/description "HA Storm on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan/D0B82741-770A-463C-818F-6E99862367DF/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/6555DBC1-E6BC-4F0D-8948-E1B5DF6BD596/plan/D0B82741-770A-463C-818F-6E99862367DF/free true

}

function NiFi(){
###创建服务 NiFi
$ETCDCTL mkdir /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/name "NiFi"
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/description "A Sample NiFi (v0.6.1) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/tags 'nifi,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/metadata '{"displayName":"NiFi","imageUrl":"https://nifi.apache.org/assets/images/nifiDrop.svg","longDescription":"Managed, highly available nifi clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://nifi.apache.org/docs.html","supportUrl":"https://nifi.apache.org"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan/4435A93C-6CC9-45F0-AFB0-EA070361DD6A
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan/4435A93C-6CC9-45F0-AFB0-EA070361DD6A/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan/4435A93C-6CC9-45F0-AFB0-EA070361DD6A/description "HA NiFi on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan/4435A93C-6CC9-45F0-AFB0-EA070361DD6A/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/BCC10E77-98B6-4EF0-8AFB-E5FD789F712E/plan/4435A93C-6CC9-45F0-AFB0-EA070361DD6A/free true

}

function Kettle(){
###创建服务 Kettle
$ETCDCTL mkdir /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/name "Kettle"
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/description "A Sample Kettle (v5.0.1) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/tags 'kettle,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/metadata '{"displayName":"Kettle","imageUrl":"http://www.pentaho.com/sites/all/themes/pentaho_resp/_media/logo-pentaho-n.png","longDescription":"Managed, highly available kettle clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"http://wiki.pentaho.com/display/EAI/Latest+Pentaho+Data+Integration+%28aka+Kettle%29+Documentation","supportUrl":"http://community.pentaho.com/projects/data-integration/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan/31B428F8-AA3E-4CAC-85A2-7294C7CAA79D
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan/31B428F8-AA3E-4CAC-85A2-7294C7CAA79D/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan/31B428F8-AA3E-4CAC-85A2-7294C7CAA79D/description "HA Kettle on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan/31B428F8-AA3E-4CAC-85A2-7294C7CAA79D/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/51219A87-E37E-44F5-8E30-4767348D644D/plan/31B428F8-AA3E-4CAC-85A2-7294C7CAA79D/free true

}

function TensorlFlow(){
###创建服务 TensorFlow
$ETCDCTL mkdir /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/name "TensorFlow"
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/description "A Sample TensorFlow (v0.8.0) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/tags 'tensorflow,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/metadata '{"displayName":"TensorFlow","imageUrl":"https://www.tensorflow.org/images/apple-touch-icon-180x180.png","longDescription":"Managed, highly available tensorflow clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://www.tensorflow.org/get_started","supportUrl":"https://www.tensorflow.org/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan/BE1CAAF2-CAB7-4B56-AEB4-2A3111225D50
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan/BE1CAAF2-CAB7-4B56-AEB4-2A3111225D50/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan/BE1CAAF2-CAB7-4B56-AEB4-2A3111225D50/description "HA TensorFlow on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan/BE1CAAF2-CAB7-4B56-AEB4-2A3111225D50/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/2DD1363D-8768-4DAA-BDC3-FB29C10C4A8C/plan/BE1CAAF2-CAB7-4B56-AEB4-2A3111225D50/free true

}

function PySpider(){
###创建服务 PySpider
$ETCDCTL mkdir /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113 #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/name "PySpider"
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/description "A Sample PySpider (v0.3.7) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/tags 'pyspider,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/metadata '{"displayName":"PySpider","imageUrl":"","longDescription":"A Powerful Spider(Web Crawler) System in Python.","providerDisplayName":"Asiainfo","documentationUrl":"https://docs.pyspider.org","supportUrl":"https://github.com/binux/pyspider"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan
###创建套餐1
$ETCDCTL mkdir /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan/1f195802-1642-47e9-be69-9082cc1ceaf5
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan/1f195802-1642-47e9-be69-9082cc1ceaf5/name "standalone"
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan/1f195802-1642-47e9-be69-9082cc1ceaf5/description "HA Spider on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan/1f195802-1642-47e9-be69-9082cc1ceaf5/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/c6ed3cb8-d486-4faa-8185-7262183a1113/plan/1f195802-1642-47e9-be69-9082cc1ceaf5/free true

}

function MongoDB(){
###创建服务 MongoDB
$ETCDCTL mkdir /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f #服务id

###创建服务级的配置
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/name "Mongo"
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/description "A Sample MongoDB cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/tags 'mongodb,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/metadata '{"displayName":"MongoDB","imageUrl":"https://webassets.mongodb.com/_com_assets/global/mongodb-logo-white.png","longDescription":"Managed, highly available MongoDB clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://docs.mongodb.com/","supportUrl":"https://www.mongodb.com/"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan
###创建套餐1 (pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan/3b7fc05d-c630-4c0b-8dda-2cedb271ccb5
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan/3b7fc05d-c630-4c0b-8dda-2cedb271ccb5/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan/3b7fc05d-c630-4c0b-8dda-2cedb271ccb5/description "HA MongoDB With Volumes on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan/3b7fc05d-c630-4c0b-8dda-2cedb271ccb5/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/eac6c8cf-2a63-4120-9e29-30c4b716e37f/plan/3b7fc05d-c630-4c0b-8dda-2cedb271ccb5/free false

}

function Elasticsearch(){
###创建服务 Elasticsearch
$ETCDCTL mkdir /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47

$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/name "Elasticsearch"
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/description "A Sample Elasticsearch (v2.3.0) cluster on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/bindable true
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/planupdatable false
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/tags 'Elasticsearch,openshift'
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/metadata '{"displayName":"Elasticsearch","imageUrl":"https://coreos.com/assets/images/media/etcd2-0.png","longDescription":"Managed, highly available etcd clusters in the cloud.","providerDisplayName":"Asiainfo","documentationUrl":"https://coreos.com/etcd/docs/latest","supportUrl":"https://coreos.com"}'

###创建套餐目录
$ETCDCTL mkdir /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan
###创建套餐(pvc)
$ETCDCTL mkdir /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan/A9537ABE-BD33-11E6-A969-13A2D25B7667
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan/A9537ABE-BD33-11E6-A969-13A2D25B7667/name "volumes_standalone"
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan/A9537ABE-BD33-11E6-A969-13A2D25B7667/description "HA Elasticsearch on Openshift"
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan/A9537ABE-BD33-11E6-A969-13A2D25B7667/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
$ETCDCTL set /servicebroker/openshift/catalog/3626D834-BD32-11E6-8C01-F7A6E255AF47/plan/A9537ABE-BD33-11E6-A969-13A2D25B7667/free true

}

#根据传入的参数执行相应的方法
echo "$command"|awk -F" " '{for(i=1;i<=NF;i++) print$i}'|while read line
do
  echo "执行函数$line"
  case $line in
    (Init)
        Init;;
    (Neo4j)
        Neo4j;;
    (Spark)
        Spark;;
    (Zookeeper)
        Zookeeper;;
    (RabbitMQ)
        RabbitMQ;;
    (Redis)
        Redis;;
    (Kafka)
        Kafka;;
    (Cassandra)
        Cassandra;;
    (Storm)
        Storm;;
    (NiFi)
        NiFi;;
    (Kettle)
        Kettle;;
    (TensorFlow)
        TensortFlow;;
    (PySpider)
        PySpider;;
    (MongoDB)
        MongoDB;;
    (Elasticsearch)
        Elasticsearch;;
    (ALL)
        Init
        declare -F | cut -d ' ' -f 3 | while read line
        do
           if [ "$line"x  !=  "Init"x ];then
              $line
           fi      
        done
        ;;
    (*)
        echo "EORRO COMMAND"
        echo "if you first run the shell script you should be run command: sh `basename $0` Init "
        echo "$use_command"
        echo "for example: sh `basename $0` Redis \n             sh `basename $0` Kafka Neo4j Zookeeper"
  esac
done
# https://www.jcloud.com/help/db_qa.html#qa1
# 目前云数据库只支持通过子网访问
