import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'To do List',
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'To do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _textList = new List();
  List<bool> boolValues = new List();
  // AnimationController animationController;
  // TickerProvider provider;
  // Animation animation;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext ontext) => new SimpleDialog(
              title: new Text('Add a note'),
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'New Note', hintText: "eg. Don't forget doing your homework"
                    ),
                    onSubmitted: (_para){
                      setState((){
                        _textList.add(_para);
                        boolValues.add(false);
                      });
                      Navigator.pop(context,_para);
                    },
                  ),
                )
              ]
            )
            

        );
        }
      ),
      body: new Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: new Center(
              child: new ListView.builder(
                itemCount: _textList.length,
                itemBuilder: (BuildContext cont,int index){
                  return new Column(
                    children: <Widget>[
                      new Row(
                        
                        children: <Widget>[
                          new Checkbox(
                              value: boolValues[index],
                              tristate: false,
                              activeColor: Colors.green,
                              onChanged: (bool newValue) {
                                setState(() {
                                  boolValues[index] = newValue;
                                });
                              },
                          ),
                          new Text(
                            _textList[index],
                            style: new TextStyle(fontSize: 18.0,fontFamily: 'Helvetica')
                          ),
                          new Divider(height: 12.0,)
                        ],
                      ),
                      new Divider(height: 10.0)
                    ],
                  );
                },     
             ),
    ),
      )
    );
  }
}
