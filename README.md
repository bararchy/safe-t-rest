# safe-t-rest
A ruby gem for Safe-T Box Rest integration

Basic usage:
================

* Require the gem
```ruby
require 'safe-t-rest'
```

* Initialize a new instance
```ruby
client = SafeTRest.new
```

* Configure the client
```ruby
client.url = 'https://Safe-T_Box_Site.com/ui_api/login.aspx'
client.username = 'test'
client.password = '12345'
client.extenstion_id = '435-34534-24-234-6'
client.role_id = '00006'
client.guid = 'my_packge_GUID.123123'
```

* Send requests
```ruby
puts client.getAppsProcessState
puts client.getPackageFileList
```