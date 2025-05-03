curl:
  pkg.installed

Download install script:
  cmd.run:
    - name: 'curl -sO https://packages.wazuh.com/4.11/wazuh-install.sh'
    - cwd: /root
    - creates: /root/wazuh-install.sh
    - require:
      - pkg: curl

Run install script:
  cmd.run:
    - name: 'bash /root/wazuh-install.sh -a'
    - cwd: /root
    - creates: 
      - /etc/wazuh-indexer/
      - /etc/filebeat/
      - /etc/wazuh-dashboard/
    - require:
      - cmd: Download install script

Enable wazuh-indexer:
  service.running:
    - name: wazuh-indexer
    - enable: true
    - require:
      - cmd: Run install script
      
Enable wazuh-manager:
  service.running:
    - name: wazuh-manager
    - enable: true
    - require:
      - cmd: Run install script
      
Enable wazuh-dashboard:
  service.running:
    - name: wazuh-dashboard
    - enable: true
    - require:
      - cmd: Run install script

