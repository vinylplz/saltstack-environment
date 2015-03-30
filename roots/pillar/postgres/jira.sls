postgres:
  pg_hba.conf: salt://postgres/pg_hba.conf

  users:
    jira:
      password: 'jira'
      createdb: True 

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['local', 'jira', 'jira']

  databases:
    jira:
      owner: 'jira'
      user: 'jira'
      template: 'template0'
      encoding: 'UTF8'
      lc_ctype: 'C'
      lc_collate: 'C'

  # This section will append your configuration to postgresql.conf.
  postgresconf: |
    listen_addresses = 'localhost,*'

