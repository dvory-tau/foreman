class power5::servers_ssh_keys {

ssh_authorized_key { 'root@power5.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key=> 'AAAAB3NzaC1yc2EAAAABIwAAAQEAx5hG4nmrGnaQDJTwsZvfiDRVFg8psfiT6/80juiTr9KswcvmeD2jVMH/12swVv8ASGtQQacKHBR6hnk1hs1c/6jsgAadQkF4IcFDbwci04hYERpthdhpxtX5LKZjfEOjBTJfj3Wg/72+PnUrMXjBQaJnU7KcNdhMA4P4Po0QxbFmhgyktK+TTft/e9ia9O9eJTxSDaYZ4hdbVHCbCrA+qxjzATEm/bZ269KnqfnWhXhwkYS6ZdZHFRE4Rb9Kdz2MRSCwWw4a6LWddpX5f2l45jio+jQyuHoW1GpEvRJLKqvUghonxFm3rVexDsmz4KcZ7SOWlyp4X1Y8jPxu3bdMtw==',
}

ssh_authorized_key { 'root@power7.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-dss',
  key=>'AAAAB3NzaC1kc3MAAACBAL5nOvv46Kt9LJdAc2Y1x1kwkYO+r2s7KK6XeiIOwfZgWqdl1Yiuw3bJi63ii+C2iNdP2AEbPL7RfyPPeBVsB0ZYy3g/jHzHmZO7kV+EweviPZ0iZci83zdxoEr1kBEcre/hSTHSgs8qzOVg8rxZMDVpY2o/4rq87nFmtO0UDIiVAAAAFQDRwoOSumXr1+mUtd4e4PwQ3JL1VwAAAIEAmA45KvynLv6h28buG7uWS1jALu5KsatSlxqlZj0K5MeLXtX8H4AR4iW3qt9kBLkExHFPG0kayNrkD9ET3GFnH/f13Z2DEGeGdxj/dZ3P6dCoOApJY9u7lZ2erBoSTrOQo+OtIJ7ffVZL80bOyEIcqZQjCtbkqNKoBdRR9Hzb3z8AAACANIT5dF6AAXvYuZAIcne+j8nVegSR6ZvAgxydH9LmbhUgSFUc6iIfVtxD2LXtvAHI2X0f9YIJwb9gOwieh7xl+Y1ULmXeWgNXJ+yU0k5MCChLPKBdjJJzwj7TnoIOrzbY8Fl3ZFEoT99J055oNPNUU5oeoyKVY/9Tw1ielbrUk5A=',
}

ssh_authorized_key { 'root@power8.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key=>'AAAAB3NzaC1yc2EAAAADAQABAAABAQCvxHkWTf9gSGcb9pka/GWHBMLGt22Gv8xOLCcS5uIFeNE/QBsO1s0IcBnyW+vu2yEW97qRmfrB7vCZzLLS38kQj2FXKB1GInscmSasfCcqBUl4WfqxK8j5nFGkn6IKDNE0XV2q/6j6032hpazBQ7VKs0bjxY/xwiGENO047ux2kHyQ044yLcU+gastzlzBXY41GOX9IGB+TPgGrf8WiLPk4ohI6lFq5CSDrnjG9aGJMSbctMrYf+tRkQMuIAyxcWR1yoAy9h2ayWOoXm7gRcEUXeQOjC/nrBvXp3H5mVRTLB7w/dSFNaUgC9PECk5LDzdmkRSTqwoWh69BW12Z6RGV',
}
}#class
