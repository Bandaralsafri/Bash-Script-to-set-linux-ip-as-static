this script was tested on ubutnu live server version 24

Please follow the steps below to run the script:

1- make sure the file has executable permission using either of the two commands (chmod x+ networkStaticIP.sh or chmod 777 networkStaticIP.sh) "the first command only grant the execute permission while the second give all permission Read\Write\execute".

2- use either of the two commands (ip a  or ifconfig) to check the network interface "required to specify which adapter you will working on" (usually, the interface name is eth0 or enp0s3, you do not want to change the local ip interface which has the ip 127.0.0.1).

3- after getting the interface name you can run the script using either way (sudo ./networkStaticIP.sh  or sudo bash ./networkStaticIP.sh).
