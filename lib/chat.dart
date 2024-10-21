import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maum_frontend/pages.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("대나무숲"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back-button.svg'),
          onPressed: () {
            // 홈 화면으로 이동
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Pages()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/gpt-diary.svg'),
            onPressed: () {
              // 추후 GPT API 연동 기능 추가 예정
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFF474747),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                // 채팅 메시지를 불러오는 위젯 추가 예정
                ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 42, // 입력창 높이 설정
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xffE8EFCF),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10.0), // 이 부분을 조정
                          suffixIcon: Container(
                            width: 21, // 컨테이너와 아이콘 너비 지정
                            height: 22.992, // 컨테이너와 아이콘 높이 지정
                            alignment: Alignment.center, // 컨테이너 내 아이콘을 중앙에 위치
                            child: GestureDetector(
                              onTap: () {
                                // 메시지 보내기 기능 구현 예정
                              },
                              child: SvgPicture.asset(
                                'assets/send-icon.svg',
                                width: 21, // 아이콘 너비 조정
                                height: 22.992, // 아이콘 높이 조정
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
