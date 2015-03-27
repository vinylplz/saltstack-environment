apache:
  sites:
    jira-proxy: # must be unique; used as an ID declaration in Salt.
      template_file: salt://apache/vhosts/proxy.tmpl # or redirect.tmpl or proxy.tmpl
      template_engine: jinja
      interface: '*'
      port: '80'
      ServerName: example.com # uses the unique ID above unless specified
      ServerAlias: www.example.com
      ServerAdmin: webmaster@example.com
      DocumentRoot: /var/www/
      LogLevel: warn
      ErrorLog: /var/log/apache2/jira-proxy-error.log # E.g.: /var/log/apache2/example.com-error.log
      CustomLog: /var/log/apache2/jira-proxy-access.log # E.g.: /var/log/apache2/example.com-access.log
      ProxyPreserveHost: 'On'
      ProxyRoute: 
        myroute:
           ProxyPassSource: '/'
           ProxyPassTarget: 'http://localhost:8080'
           ProxyPassReverseSource: '/'
           ProxyPassReverseTarget: 'localhost:8080'

  # ``apache.debian_full`` formula additional configuration:
  register-site:
    # any name as an array index, and you can duplicate this section
    UNIQUE_VALUE_HERE:
      name: 'my name'
      path: 'salt://path/to/sites-available/conf/file'
      state: 'enabled'
      # Optional - use managed file as Jinja Template
      #template: true
      #defaults:
      #  custom_var: "default value"

  modules:
    enabled:  # List modules to enable
      - ldap
      - ssl
    disabled:  # List modules to disable
      - rewrite
