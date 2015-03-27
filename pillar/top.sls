base:
  '*':
    - users
    - pkgs
  'roles:jira':
    - match: grain
    - jira
    - java
    - apache
  'roles:jira_db':
    - match: grain
    - postgres.jira
