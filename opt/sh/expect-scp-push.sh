#!/usr/bin/expect
set timeout -1
set host [lindex $argv 0]
set port [lindex $argv 1]
set username [lindex $argv 2]
set password [lindex $argv 3]
set local_file [lindex $argv 4]
set remote_file [lindex $argv 5]
#puts "${host} ${port}"
spawn scp -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -P $port $local_file $username@$host:$remote_file 
expect {
    "(yes/no)?"
    {
        send "yes\n"
        expect "*assword:" { send "$password\n"}
    }
    "*assword:"
    {
        send "$password\n"
    }
}
expect "100%"
expect eof
