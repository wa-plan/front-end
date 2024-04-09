import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 도미노', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.redAccent,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blueAccent,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}
