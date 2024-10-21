import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _heartColor = Colors.grey; // 초기 SVG 색상
  String _formattedDate = "";

  void _changeHeartColor(Color newColor) {
    setState(() {
      _heartColor = newColor;
    });
  }

  @override
  void initState() {
    super.initState();
    _formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());
  }

  void _showColorPicker() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(50),
          width: MediaQuery.of(context).size.width,
          height: 296,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("기분을 색깔로 골라보세요!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF474747))),
              SizedBox(height: 35),
              Wrap(
                spacing: 23, // 아이콘 간의 수평 간격
                runSpacing: 33, // 아이콘 간의 수직 간격
                children: List.generate(8, (index) {
                  List<Color> colors = [
                    Color(0xffF50202),
                    Color(0xffFF9DAE),
                    Color(0xffFFDB5C),
                    Color(0xffD9EC03),
                    Color(0xff5ABBDB),
                    Color(0xffAD88C6),
                    Color(0xffC4C3C3),
                    Color(0xff776B5D)
                  ];
                  return GestureDetector(
                    onTap: () {
                      _changeHeartColor(colors[index]);
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/maum-heart.svg',
                      width: 50, // 조정 가능
                      height: 42.22,
                      color: colors[index],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _sendColorChoice(Color color, int userId) async {
    String colorValue =
        color.value.toRadixString(16).padLeft(8, '0'); // ARGB 형식의 색상값
    Uri uri = Uri.http(
        'http://3.34.61.82:8080', '/color', {'userId': userId.toString()});
    try {
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
          'name': colorValue,
        }),
      );
      if (response.statusCode == 200) {
        print("Color saved successfully!");
      } else {
        print("Failed to save color: ${response.body}");
      }
    } catch (e) {
      print("Error sending color choice: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("홈"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFF474747),
            height: 1.0,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(38, 38, 0, 0),
          child: Text(
            _formattedDate,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff474747)),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(38, 9, 0, 0),
          child: Text(
            "깜찍한 마음이 님, 어서오세요!",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 41,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(38, 0, 35, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "오늘의 기분을 색깔로 표현하고\n그림을 완성해주세요!",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff474747)),
              ),
              GestureDetector(
                onTap: _showColorPicker,
                child: SvgPicture.asset(
                  'assets/maum-heart.svg',
                  width: 50,
                  height: 42.22,
                  color: _heartColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset('assets/home-image.png'),
        ),
      ]),
    );
  }
}
