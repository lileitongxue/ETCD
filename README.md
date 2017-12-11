ETCD脚本 <br/>
============
1.配置etcd的endpoint地址用户名和密码，设置service-broker的api用户名和密码

2.如果是第一次执行脚本，必须要先执行初始化参数<br>

sh ETCD.sh Init <br>

3.你可以执行脚本通过传递参数（一个参数或多个参数）的方式，来写入service-broker的套餐配置<br>

sh ETCD.sh Redis <br> 

sh ETCD.sh Kafka Neo4j Zookeeper 
             
4.如果想一次写入所有的套餐服务直接传入参数ALL <br>

sh ETCD.sh ALL <br>

5.修改Redis.json文件 可以对Redis 套餐中的plan4，做定制配置 <br>

