base:
  '*':
    - users
    - edit.vim
#   'roles:webserver':
#     - match: grain
#     - apache
  'roles:jira':
    - match: grain
    - jira
    - jira.proxy
  'roles:jira_db':
    - match: grain
    - postgres
