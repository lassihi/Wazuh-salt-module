# Wazuh-Salt-module

Install and configure Wazuh central components (Wazuh Indexer, Wazuh Server, Wazuh Dashboard) and Wazuh Agent on Debian/Ubuntu using Salt.

[Wazuh](https://wazuh.com/) is an open source SIEM and XDR security platform. Its features include threat detection, integrity monitoring, incident response, and more.

## Supported Operating systems

State `wazuh.server`: 
* Ubuntu 24.04
* Debian 12 (works, but is NOT RECOMMENDED BY WAZUH so you might run into issues not related to this module)

State `wazuh.agent`: 
* Ubuntu 24.04

Tested with:
* Ubuntu 24.04, Debian 12
* Salt 3009
* Wazuh 4.x

## Usage

Before continuing you must have [Salt](https://docs.saltproject.io/salt/install-guide/en/latest/) installed and configured on your environment.

### Download repository with Git:

        git clone https://github.com/lassihi/Wazuh-salt-module.git

After downloading the repository, copy included `wazuh` folder to `/srv/salt/`.

### Install Wazuh central components on minion 'server':

        sudo salt 'server' state.apply wazuh.server

Applying this state may take up to 15 minutes, depending on minion's system resources.

Dashboard admin username and password will be printed under the function "Run install script".

### Install Wazuh Agent on minion 'agent':

Before running the command, edit line 1 in file `agent.sls` to point to your Wazuh Server's IP address. If you ran the command above, use IP address of 'server' minion. Otherwise, you will have to apply it later in the configuration file.

    sudo salt 'agent' state.apply wazuh.agent

## Screenshots
Wazuh Dashboard overview with one agent configured:

![image](https://github.com/user-attachments/assets/df30854d-b981-4055-93f5-a01b410fd7f6)

View "Endpoints" with one agent configured:

![image](https://github.com/user-attachments/assets/5a258f9c-272b-441c-9d5b-41973fa4001e)


## Other

This project was created as a part of the course [Palvelinten Hallinta](https://terokarvinen.com/palvelinten-hallinta/).

The file [h5.md](https://github.com/lassihi/Wazuh-salt-module/blob/main/h5.md) is a report I wrote about this project in Finnish. It includes a demo using Vagrant virtual machines.

Made by: Lassi Hirvonen
