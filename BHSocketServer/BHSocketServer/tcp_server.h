//
//  tcp_server.h
//  BHSocketServer
//
//  Created by chendi on 15/8/8.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#ifndef __BHSocketServer__tcp_server__
#define __BHSocketServer__tcp_server__

#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <iostream>

#include <stdio.h>
#define MAXSIZE 1024

class tcp_server
{
private:
    int socket_fd,accept_fd;
    sockaddr_in myserver;
    sockaddr_in remote_addr;
public:
    tcp_server(int listen_port);
    int recv_msg();
    
};
#endif /* defined(__BHSocketServer__tcp_server__) */
