import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late TextEditingController _nicknameController; // 컨트롤러 late로 선언
  late TextEditingController _ageController; // 컨트롤러 late로 선언
  late TextEditingController _jobController; // 컨트롤러 late로 선언

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController(); // 초기화
    _ageController = TextEditingController(); // 초기화
    _jobController = TextEditingController(); // 초기화
  }

  @override
  void dispose() {
    _nicknameController.dispose(); // 자원 해제
    _ageController.dispose(); // 자원 해제
    _jobController.dispose(); // 자원 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("마이페이지", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("마음이님 환영합니다!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("카카오 회원이시네요!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("가입한지 421일 되었어요!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: "닉네임",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: "나이",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _jobController, // 직업 필드
              decoration: InputDecoration(
                labelText: "직업",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 저장 기능 추가
                  print("Profile Updated");
                },
                child: Text("저장하기"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
