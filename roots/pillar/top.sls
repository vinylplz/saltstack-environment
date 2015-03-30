base:
  '*':
    - users
    - pkgs

  'packer-debian-7.7-amd64':
    - postgres.jira
    - jira.common
    - jira.dev
    - java
    - apache
