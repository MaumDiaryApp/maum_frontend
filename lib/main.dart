import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _logoSize = 200; // 초기 로고 크기

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _logoSize = 400; // 확대될 로고 크기
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.easeInOut,
          width: _logoSize,
          height: _logoSize,
          child: Image(
            key: Key('splashImage'), // 테스트를 위해 Key 추가
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('마음일기',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                // 로그인 로직 구현
              },
              child: Text('로그인')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text('회원가입')),
        ],
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("회원가입")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: '이름')),
            TextField(decoration: InputDecoration(labelText: '나이')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // 회원가입 로직 구현
                },
                child: Text('회원가입')),
          ],
        ),
      ),
    );
  }
}
