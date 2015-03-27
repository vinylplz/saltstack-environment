jira:
  # uncomment this if you have a local atlassian-jira.tar.gz in /srv/salt/jira
  # for much faster deploys
  #source: salt://jira

  source_hash: 'md5=1321c995b9cbddef79c146cdc42f95fb'
  version: 6.4

  lf:
    gadget:
      color1: '#3b73aa'

  jvm_Xms: 768m
  jvm_Xmx: 768m
