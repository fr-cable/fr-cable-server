# Fr cable server

It's pub/sub bus, connecting any clients with any servers on any protocols.

!!!WARNING!!! The project is at a very early stage of development, it can be used, but there is no guarantee that it works as you expect and that I will not abandon it tomorrow

## Why is this needed

We want join any users between them by web socket, but we want process buisnuess logic in ruby app. 
We cant keep alive 10 000 socket connections in our app.
We made socket server, that handle ws connection and transfet it by http on out ruby app.
But, i have client as server app, that can messaging only on http.
I connect this app as client to out pub/sub bus, and while pub/sub bus transfer messages by websocket on any clients, it also transfer message on my server client by http.

Also i want have many server buisness logic processors, that allow to registry any backends, almost on any protocols: ws, http, amqp

## Installation

Comming soon

## Usage

Comming soon

## Contributing

No needed to contribute now

## License

MIT