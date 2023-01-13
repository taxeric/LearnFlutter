
import 'dart:math';

import 'package:flutter/material.dart';

class MRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _NewPage();
}

class _NewPage extends State<MRoute> {

  String textFieldValue1 = "label";
  String textFieldValue2 = "label";
  bool checkState = false;
  bool switchState = false;
  var progressValue = 0.4;

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(focusNode1);
      FocusScope.of(context).requestFocus(focusNode2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is a new page"),
            Row(
              children: [
                Checkbox(
                  value: checkState,
                  onChanged: (value) {
                    setState(() {
                      checkState = value!;
                    });
                  },
                ),
                Text("选中 >> $checkState")
              ],
            ),
            Row(
              children: [
                Switch(
                  value: switchState,
                  activeColor: Colors.redAccent,
                  onChanged: (value) {
                    setState(() {
                      switchState = value;
                    });
                  },
                ),
                Text("切换 >> $switchState")
              ],
            ),
            TextField(
              focusNode: focusNode1,
              decoration: InputDecoration(
                labelText: textFieldValue1,
                hintText: "hint text",
                prefixIcon: Icon(Icons.android_outlined)
              ),
              onChanged: (value) {
                setState(() {
                  textFieldValue1 = value;
                });
              },
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: textFieldValue2,
                  hintText: "hint text",
                  prefixIcon: Icon(Icons.android_outlined)
              ),
              onChanged: (value) {
                setState(() {
                  textFieldValue2 = value;
                });
              },
            ),
            FloatingActionButton(
              onPressed: () {
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
            LinearProgressIndicator(
              value: progressValue,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  progressValue = Random.secure().nextInt(100) / 100.0;
                });
              },
            ),
            CircularProgressIndicator(),
          ],
        ),
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

class ImgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片显示"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Container>[
              Container(
                color: Colors.green,
                child: Image(
                  image: AssetImage("images/roco.png"),
                  width: 200,
                  height: 200,
                  alignment: Alignment.bottomRight,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.green,
                child: Image.network(
                  "https://bkimg.cdn.bcebos.com/pic/ac345982b2b7d0a20cf45d6220a761094b36adaf2cb1",
                  width: 200,
                  height: 200,
                  fit: BoxFit.none,
                ),
              ),
            ].map((e) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: e,
                  ),
                ),
                Text((e.child as Image).fit.toString()),
              ],
            )).toList(),
          ),
        )
    );
  }
}
