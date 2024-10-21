import 'package:flutter/material.dart';
import 'package:maum_frontend/pages.dart';
import 'package:maum_frontend/signup-info.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _canSignup = false;

  void _handleFieldsFilled(bool filled) {
    setState(() {
      _canSignup = filled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "마음일기에",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "오신 것을 환영합니다!",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 17),
            Text(
              "회원이 되어 서비스를 마음껏 이용하세요!",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xff474747),
              ),
            ),
            SizedBox(height: 29),
            SignupInfo(
              onFieldsFilled: _handleFieldsFilled,
            ),
            SizedBox(height: 53),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4F6F52),
                foregroundColor: Colors.white,
                shadowColor: Color(0x40000000),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(150, 44.118),
              ),
              onPressed: _canSignup
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Pages()),
                      );
                    }
                  : null,
              child: Text(
                "회원가입하기",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
