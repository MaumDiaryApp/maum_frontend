import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Diary extends StatefulWidget {
  final DateTime selectedDate;
  const Diary({Key? key, required this.selectedDate}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<Diary> {
  Color _heartColor = Colors.grey;
  final TextEditingController _diaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy년 MM월 dd일').format(widget.selectedDate);
    String dayOfWeek = DateFormat('EEEE', 'ko_KR').format(widget.selectedDate);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/back-button.svg'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('일기'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // Ensure the content is scrollable to avoid overflow.
        child: Column(
          children: [
            SizedBox(height: 48),
            Text(
              formattedDate,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff474747)),
            ),
            Text(dayOfWeek,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff474747))),
            SizedBox(height: 24),
            _colorSelectionArea(),
            _diaryTextArea(),
            _saveButton(),
          ],
        ),
      ),
    );
  }

  Widget _colorSelectionArea() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("기분을 색깔로 표현해주세요!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GestureDetector(
            onTap: _showColorPicker,
            child: SvgPicture.asset(
              'assets/maum-heart.svg',
              color: _heartColor,
              width: 50,
              height: 42.22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _diaryTextArea() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: _boxDecoration(),
      child: TextField(
        controller: _diaryController,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: '오늘은 어땠나요?',
          border: InputBorder.none,
        ),
        maxLength: 500,
      ),
    );
  }

  Widget _saveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        onPressed: _saveDiary,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF739072), // Background color
        ),
        child: Text('저장하기'),
      ),
    );
  }

  void _saveDiary() {
    // Implement saving logic here
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('저장 완료!')));
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Color(0xFFE8EFCF),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Color(0xFF739072), width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 35),
              Wrap(
                spacing: 23,
                runSpacing: 33,
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
                      setState(() {
                        _heartColor = colors[index];
                      });
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/maum-heart.svg',
                      width: 50,
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
}
