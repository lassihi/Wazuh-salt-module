# Wazuh-Salt-module

Install Wazuh central components (Wazuh Indexer, Wazuh Server, Wazuh Dashboard) and Wazuh Agent on Debian/Ubuntu using Salt.

[Wazuh](https://wazuh.com/) is an open source SIEM and XDR security platform. Its features include threat detection, integrity monitoring, incident responce, and much more.

## Usage

### Wazuh central components:

Install Wazuh central components on minion "server":

    sudo salt 'server' state.apply wazuh.server

Applying this state may take up to 15 minutese depending on minion's system resources.

### Wazuh Agent:

Before applying the state, edit line 1 on file `agent.sls` to point to your Wazuh Indexer's IP-address. If you ran the command above use IP-address of "server" minion.

Install Wazuh Agent on minion "agent":

    sudo salt 'agent' state.apply wazuh.server
