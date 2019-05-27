import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> items = [
    {
      'title':'socket_flutter',
      'subtitle':'可以通过http开头的链接和服务端进行长连接',
      'index':'A',
      'router':'/socketPage'
    },
    
  ];
  var clickText;

  Iterable<Widget> listTitles = [];
  @override
  void initState() {
    super.initState();
  
    listTitles = items.map((dynamic item){
      return buildListTitle(context, item);
    });
    listTitles = ListTile.divideTiles(context: context,tiles: listTitles);
  }

  Widget buildListTitle(BuildContext context,dynamic item){
    var title = item['title'];
    var subtitle = item['subtitle'];
    var index = item['index'];
    var router = item['router'];
    return new ListTile(
      isThreeLine: true,
      dense: false,
      leading: new CircleAvatar(child: new Text(index),),
      title: new Text(title),
      subtitle: new Text(subtitle),
      trailing: new Icon(Icons.arrow_right),
      onTap: (){
        clickText = router;
        print('ListView点击事件$router');
        Navigator.of(context).pushNamed(router);
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterDemo'),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Scrollbar(
           child: ListView(
            children: listTitles.toList(),
          ),
        )
      )
    );
  }
}