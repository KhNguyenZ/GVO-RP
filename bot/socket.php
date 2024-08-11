<?php

set_time_limit(0);
ob_implicit_flush();
$socket = socket_create(AF_INET, SOCK_STREAM, getprotobyname('tcp')) or die("Error in socket_create: " . socket_strerror(socket_last_error($socket)) . "\n");
socket_bind($socket, "127.0.0.1", 7778) or die("Error in socket_bind: " . socket_strerror(socket_last_error($socket)) . "\n");
socket_listen($socket, 5) or die("Error in socket_listen: " . socket_strerror(socket_last_error($socket)) . "\n");
while(true)
{
    // Accept an incoming connection!
    $spawn = socket_accept($socket);
    
    // Send a welcoming notice
    $welcome = "I'm your humble host today, dear gameserver!";
    socket_write($spawn, $welcome, strlen($welcome));
    while(true)
    {
        // Try to read the input
        $input = socket_read($spawn, 1024, PHP_NORMAL_READ);
        if($input === false)
        {
            // Return to the first loop and look for a new connection to accept.
            break;
        }
        if($input == "Hi, server!")
        {
            $response = "Hello to you as well, dear Sir!";
            socket_write($spawn, $response, strlen($response));
        }
    }
}
socket_close($socket); 