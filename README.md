Based on **rabbitmq:3.5.3-management**
  

This docker image is a poor man workaround to limit rabbitmq memory usage when you run it in docker with memory limit. Simply define the environment variable ``MEM`` to the amount of memory you set.

Example with marathon:
```
{
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "sheepkiller/rabbitmq",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 5672, "hostPort": 0, "protocol": "tcp" },
        { "containerPort": 15672, "hostPort": 0, "protocol": "tcp"}
      ]
    },
    "forcePullImage": false,
    "volumes": []
  },
  "env" :
    {
      "MEM": "2048"
    },
  "id": "rabbitmq",
  "instances": 1,
  "cpus": 2,
  "mem": 2048
}
```
On a 6GB VM, with 40% watermark
```
rabbitmq@41a84f7f2ed2:/$ /usr/sbin/rabbitmqctl status
Status of node rabbit@41a84f7f2ed2 ...
[{pid,1},
[...]
 {vm_memory_high_watermark,0.139974},
 {vm_memory_limit,858994055},
[...]
```


