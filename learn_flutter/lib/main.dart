import 'package:flutter/material.dart';
import 'package:learn_flutter/state/LoginState.dart';

import 'Pages.dart';
import 'RouteMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo A',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter'),
        "page1": (context) => MRoute(),
        "paramsPage": (context) => ParamsRoute()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toNewPage1(BuildContext context) {
    Navigator.pushNamed(context, "page1");
/*    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MRoute();
      }),
    );*/
  }

/*  void _toParamsPage(BuildContext context, String params) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ParamsRoute(text: params);
      })
    );
    if (result != null) {
      print(">>>>> $result");
    }
  }*/

  void _toParamsPage2(BuildContext context, String params) async {
    var result = await Navigator.of(context).pushNamed("paramsPage", arguments: params);
    if (result != null) {
      print(">>>>> $result");
    }
  }

  void _changeLoginState(bool state) {
    loginState = state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,//整体布局
        crossAxisAlignment: CrossAxisAlignment.start,//child布局
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  onPressed: (){ _changeLoginState(true); },
                  label: Text("login")
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  onPressed: (){ _changeLoginState(false); },
                  label: Text("logout")
              ),
            ],
          ),
          ElevatedButton.icon(
              icon: Icon(Icons.send),
              onPressed: (){ _toNewPage1(context); },
              label: Text("To new page")
          ),
          ElevatedButton.icon(
              onPressed: () {
                _toParamsPage2(context, "test params");
              },
              icon: Icon(Icons.send),
              label: Text("To params page")
          ),
          Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                      text: "Github: ",
                    ),
                    TextSpan(
                      text: "https://github.com/",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    )
                  ]
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
