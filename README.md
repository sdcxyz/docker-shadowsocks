# docker-shadowsocks
镜像里面安装了shadowsocks 、dnscrypt、privoxy
启动容器的时候shadowsocks客户端会根据启动容器是指定的参数链接ss服务端，并监听在端口1080上，privoxy会开启http代理并把请求转发到刚才ss开启的1080端口,dnscrypt会开启监听在默认的dns端口上
使用方法：
1.先拉取镜像
sudo docker pull sdcxyz/docker-shadowsocks
2.启动容器
sudo docker run --name ss  -p 53:53 -p 53:53/udp  -p 1080:1080 -p 8118:8118 sdcxyz/docker-shadowsocks -s 你的ss服务器  -p 你的ss服务的端口 -k 你的ss密码

如果不想把容器的端口绑定在宿主机上，那么可以直接运行
sudo docker run --name ss   sdcxyz/docker-shadowsocks -s 你的ss服务器  -p 你的ss服务的端口 -k 你的ss密码
如果不想绑定端口，则需要通过docker的 inspect 命令查一下容器的ip，并通过容器的ip来设置代理
