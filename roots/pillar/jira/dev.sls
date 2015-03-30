#include 'jira/common.sls'

jira:
  # uncomment this if you have a local atlassian-jira.tar.gz in /srv/salt/jira
  # for much faster deploys
#  source_url: salt://jira

  source_hash: 'md5=1321c995b9cbddef79c146cdc42f95fb'
  version: 6.4

  jvm_Xms: 768m
  jvm_Xmx: 768m

  properties:
    jira.lf.top.bgcolour: '#169e2b'
    jira.lf.top.hilightcolour: '#76c748'
    jira.lf.top.separator.bgcolor: '#329441'
    jira.lf.top.textcolour: '#fff426'
    jira.lf.top.texthilightcolour: '#f0f0f0'
    jira.lf.menu.bgcolour: '#f20505'
    jira.lf.menu.textcolour: '#ffffff'
    jira.lf.hero.button.base.bg.colour: '#ff6b6b'
    jira.lf.hero.button.text.colour: '#ffffff'
    jira.lf.text.activelinkcolour: '#3b73af'
    jira.lf.text.headingcolour: '#292929'
    jira.lf.text.linkcolour: '#3b73af'
    jira.lf.gadget.color1: '#169e2b'


