import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;



const String URI = "http://192.168.1.160:9091/";

class SocketPage extends StatefulWidget {
  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  List<String> toPrint = ["trying to conenct"];
  bool isProbablyConnected = false;

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  initSocket() async {
    IO.Socket socket = IO.io('http://192.168.1.160:3000?userId=1231231', <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'userId': '123'},
    });
    socket.on('connect', (_) {
      print('connect');
    });
    socket.on('news', (data) => print(data[0]));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

 

  pprint(data) {
    setState(() {
      if (data is Map) {
        data = json.encode(data);
      }
      print(data);
      toPrint.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white),
            headline: TextStyle(color: Colors.white),
            subtitle: TextStyle(color: Colors.white),
            subhead: TextStyle(color: Colors.white),
            body1: TextStyle(color: Colors.white),
            body2: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            overline: TextStyle(color: Colors.white),
            display1: TextStyle(color: Colors.white),
            display2: TextStyle(color: Colors.white),
            display3: TextStyle(color: Colors.white),
            display4: TextStyle(color: Colors.white),
          ),
          buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              disabledColor: Colors.lightBlueAccent.withOpacity(0.5),
              buttonColor: Colors.lightBlue,
              splashColor: Colors.cyan
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adhara Socket.IO example'),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Center(
                    child: ListView(
                      children: toPrint.map((String _) => Text(_ ?? "")).toList(),
                    ),
                  )),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: RaisedButton(
                      child: Text("Connect"),
                      onPressed: isProbablyConnected?null:initSocket,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0,)
            ],
          ),
        ),
      ),
    );
  }
}