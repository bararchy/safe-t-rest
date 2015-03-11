# safe-t-rest
A ruby gem for Safe-T Box REST API

Basic usage:
================

* Install the gem
```
gem install safe-t-rest
```

* Require the gem
```ruby
require 'safe-t-rest'
```

* Initialize a new instance (can be empty or set via parameters)
empty:
```ruby
client = SafeTRest.new
```
set using hash:
```ruby
client = SafeTRest.new(url: 'https://Safe-T/ui_api/login.aspx', user_name: 'test', password: '123', extension_id: '1', role_id: '0')
```

* Configure the client (if you initialized empty)
```ruby
client.url = 'https://Safe-T_Box_Site.com/ui_api/login.aspx'
client.username = 'test'
client.password = '12345'
client.extension_id = '435-34534-24-234-6'
client.role_id = '00006'
```

* Send requests
```ruby
puts client.get_apps_process_state('my_packge_GUID.123123')

puts client.get_package_file_list('my_packge_GUID.123123')
```

* Safe Share
```ruby
args = {
	:files => 'file.txt', # name of file to share
	:recipients => 'alexander.dan@safe-t.com', # Email address of the one you want to share with
	:sender_name => 'Bar Hofesh', 
	:sender_address => 'bar.hofesh@safe-t.com',
	:subject => 'Testing Ruby API', # Email Subject
	:message => 'This is a Test message, just checking the Ruby API using REST', # Email body message
	:message_encryption_level => '0', # 0 = high, 1 = normal, 2 = low
	:delivery_method => '0',
	:mobile_recipient => '',
	:return_receipt => true, # get back a notification when the file was downloaded
	:safe_reply => true, # send an safe reply invitation
	:max_downloads => '3', # maximum number of allowed downloads
	:package_expiry => '1440', # in minutes
	:folder_path => '', # empty means root folder
	:root_folder_id => '417' # My Storage ID
}

client.safe_share_file(args)
```

* File Upload
```ruby
args = {
	:file_base64 => 'V29ya2luZyA6KQo=', # the file as a base64 string Base64.encode64(File.read(file))
	:file_name => 'file.txt', # the name of the file
	:folder_path => '', # empty means root folder
	:root_folder_id => 417 # My Storage ID
}

client.file_upload(args)
```

* File Download
```ruby
args = {
	:file_name => 'file.txt', # The name of the file to download
	:folder_path => '', # The path of the file
	:root_folder_id => 417 # My Storage ID
}

file = client.file_download(args) # Get back the file as a base64 string
file = Base64.decode64(file) # decode the string
File.write('file.txt', file) # write decoded file
```

# RubyDoc
http://www.rubydoc.info/github/bararchy/safe-t-rest/SafeTRest

* Added example client under /bin