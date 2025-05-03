{% set server_ip = '192.168.88.101' %}

Add Wazuh repository:
  pkgrepo.managed:
    - name: deb https://packages.wazuh.com/4.x/apt/ stable main
    - dist: stable
    - gpgcheck: 1
    - key_url: https://packages.wazuh.com/key/GPG-KEY-WAZUH

Install Wazuh-Agent:
  pkg.installed:
    - name: wazuh-agent
    - refresh: True

Add server IP:
  file.replace:
    - name: /var/ossec/etc/ossec.conf
    - pattern: '<address>.*</address>'
    - repl: '<address>{{ server_ip }}</address>'
    - require:
      - pkg: Install Wazuh-Agent

Enable Wazuh-Agent:
  service.running:
    - name: wazuh-agent
    - enable: True
    - watch:
      - file: /var/ossec/etc/ossec.conf

