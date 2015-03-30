base:
  '*':
    - users
    - edit.vim

dev:
  '*jira*.dev.*':
    - jira
    - jira.proxy
  '*db*.dev.* and G@roles:jira_db':
    - match: grain
    - postgres
  'packer-debian-7.7-amd64':
    - postgres
    - jira
    - jira.proxy

