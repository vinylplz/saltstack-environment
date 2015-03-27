{% for user, data in pillar.get('users', {}).items() %}
group-{{user}}:
  group.present:
    - name: {{user}}
    - gid: {{ data['gid'] }}

user-{{user}}:
  user.present:
    - name: {{user}}
    - uid: {{ data['id'] }}
    - gid: {{ data['gid'] }}
    - home: {{ data.get('home', '/home/%s' % user) }}
    - shell: {{ data.get('shell', '/bin/false') }}
{% endfor %}
