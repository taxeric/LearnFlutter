
import 'package:flutter/material.dart';

class MRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child:
        Text("new page 1"),
      ),
    );
  }
}

class ParamsRoute extends StatelessWidget {

  ParamsRoute({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Params Page"),
      ),
      body: Column(
        children: [
          Text(text),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, "return value");
              },
              icon: Icon(Icons.arrow_back_ios),
              label: Text("To params page")
          ),
        ],
      ),
    );
  }
}

class Logged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Text("logged!"),
      ),
    );
  }
}
