global
        log 127.0.0.1   local1
        maxconn 4096
 
defaults
        log     global
        mode    tcp
        option  tcplog
        retries 3
        option redispatch
        maxconn 2000
        timeout connect 5000
        timeout client 50000
        timeout server 50000
 
listen  stats
        bind *:1936
        mode http
        stats enable
        stats hide-version
        stats realm Haproxy\ Statistics
        stats uri /
 
listen rabbitmq
        bind *:5672
        mode            tcp
        balance         roundrobin
        timeout client  3h
        timeout server  3h
        option          clitcpka
        server          rabbitmq1 rabbitmq1:5672  check inter 5s rise 2 fall 3
        server          rabbitmq2 rabbitmq2:5672  check inter 5s rise 2 fall 3
