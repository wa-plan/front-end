import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/add_page2.dart';

class MainAddedPage extends StatefulWidget {
  final String dominoValue;
  const MainAddedPage(this.dominoValue, {super.key});

  @override
  State<MainAddedPage> createState() => _MainAddedPageState();
}

class _MainAddedPageState extends State<MainAddedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Text(
            '오늘의 도미노',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: const Color(0xff262626),
      ),
      backgroundColor: const Color(0xff262626),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(38.0, 30.0, 40.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '더 자세하게 바꿀 수 있어요.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1),
            ),
            Text(
              widget.dominoValue,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
