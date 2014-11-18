### PM ( private messaging )

 ```
 client.messages_list

 # Reads all messages from user 'ouna-'
 client.messages_read(:param1 => 'ouna-')

 # delete all messages from user 'ouna-'
 client.messages_delete(:param1 => 'ouna-')

 # send message 'test wykop gem' to user 'ouna-' with wykop.pl logo attached
 client.message_send(:param1 => 'ouna-', :body => 'test wykop gem', :embed => 'http://wykop.pl/logo.png')