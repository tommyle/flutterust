import 'package:flutter/material.dart';
import 'package:adder/adder.dart';
import 'package:scrap/scrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final adder = Adder();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Scrap scrap;

  @override
  void initState() {
    super.initState();
    scrap = Scrap();
    Scrap.setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.greenAccent,
              child: Text(
                'Scrape rust-lang.org',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: _showWebPage,
            )
          ],
        ),
      ),
    );
  }

  void _showWebPage() async {
    final html = await scrap.loadPage('https://www.rust-lang.org/');
    print(html);
  }
}
