import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _email = ""; 
  String _password = "";
  String _univ = "";

  String get email => _email;
  String get password => _password;
  String get univ => _univ;

  void set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  void set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  void set univ(String input_univ) {
    _univ = input_univ;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: MaterialApp(
            title: 'Domino',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.orange),
            routes: {
              '/login': (BuildContext context) => LoginWidget(),
              '/main': (BuildContext context) => MainGridView(),
              '/setUniv': (BuildContext context) => AddInfoWidget(),
              '/enrollPassword': (BuildContext context) =>
                  EnrollPasswordWidget()
            },
            home: LoginWidget()));
  }
}

// 프로바이더 인스턴스 생성
late UserProvider _userProvider;

// 프로바이더 사용
_userProvider = Provider.of<UserProvider>(context);

// set
String email = _userProvider.email;

// get
_userProvider.email = _emailConroller.text;

  void _submit() {
    _userProvider.email = _emailConroller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => EnrollPasswordWidget())));
  }

  void _checkEmail() async {
 	// 정규표현식
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
	
    // 중복 이메일 검사
    bool duplicate = false;
    try {
      var duplicate_email =
          await _firestore.get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          print(doc["email"]);
          if (_emailConroller.text == doc["email"]) {
            duplicate = true;
          }
        });
      });
    } catch (e) {
      print(e);
      duplicate = false;
    }
    if (duplicate) {
      setState(() {
        _errorMsg = "이미 이메일이 존재합니다.";
      });
    } else if (!regExp.hasMatch(_emailConroller.text)) {
      setState(() {
        _errorMsg = "올바르게 이메일을 입력하세요";
      });
    } else {
      setState(() {
        _errorMsg = "";
      });
      _userProvider.email = _emailConroller.text;
      _submit();
    }
  }
