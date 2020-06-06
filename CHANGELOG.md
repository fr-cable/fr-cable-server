=== 6.06.2020 ===

Total:
  Added multiserver connection feature, 
  that allow to consumer be connected on many servers through one socket connection

Major: 
  Added "client in connect", that will get 'payload that mean uuid of conencting server  
  Added "server in add_server", it will get 'url' key in payload
  Added "server out server_added", it will send payload that meand uuid of added server
  Changed "client in subscribe message", now it will wait 'connection' key in payload param, that mean connection_uuid

Minor:
  Added socket structure class
  Added server structure class
  Added socket list class
  Added server list class

  Added association between socket and connection
  Added association between server and connection
  Added association between server nad room
  
  Added full_name method in room
  
  Deleted get_or_create in list rooms

  Refactor creacting room in client in request processor

  It's big refactor, some minor changes was hide