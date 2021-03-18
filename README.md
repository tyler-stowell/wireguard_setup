# wireguard_setup

Setup Network Manager and Modem Manager to get the modem working. Then:

Put the three scripts given into /etc/wireguard/

Start the service using wireguards built in service functionality:
sudo systemctl start wg-quick@wg0.service

Reboot
