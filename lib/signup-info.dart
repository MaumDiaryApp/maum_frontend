import 'package:flutter/material.dart';

class SignupInfo extends StatefulWidget {
  final Function(bool) onFieldsFilled; // 입력 필드 상태를 부모 위젯에 전달하는 콜백

  const SignupInfo({Key? key, required this.onFieldsFilled}) : super(key: key);

  @override
  State<SignupInfo> createState() => _SignupInfoState();
}

class _SignupInfoState extends State<SignupInfo> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  String? _selectedAge;

  final List<String> _ages =
      List.generate(100, (index) => (index + 1).toString());

  @override
  void initState() {
    super.initState();
    // 리스너 추가
    _nicknameController.addListener(_updateFieldsFilled);
    _occupationController.addListener(_updateFieldsFilled);
  }

  @override
  void dispose() {
    // 리스너 제거
    _nicknameController.removeListener(_updateFieldsFilled);
    _occupationController.removeListener(_updateFieldsFilled);
    _nicknameController.dispose();
    _occupationController.dispose();
    super.dispose();
  }

  void _updateFieldsFilled() {
    bool fieldsFilled = _nicknameController.text.isNotEmpty &&
        _selectedAge != null &&
        _occupationController.text.isNotEmpty;
    widget.onFieldsFilled(fieldsFilled); // 상태 변경을 부모 위젯에 알림
  }

  Widget build(BuildContext context) {
    return Container(
      // 컨테이너 및 기타 스타일 설정...
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildRow('닉네임', _buildTextField(_nicknameController, '깜찍한 마음이')),
          _buildRow('나이', _buildDropdown()),
          _buildRow('직업', _buildTextField(_occupationController, '교사')),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String placeholder) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholder,
          // 입력란 스타일 설정
        ),
        onChanged: (value) => _updateFieldsFilled(),
      ),
    );
  }

  Widget _buildDropdown() {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: _selectedAge,
        items: _ages.map((age) {
          return DropdownMenuItem(
            value: age,
            child: Text(age),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedAge = value;
          });
          _updateFieldsFilled(); // 드롭다운 변경 시 호출
        },
        decoration: InputDecoration(
            // 드롭다운 스타일 설정
            ),
      ),
    );
  }

  Widget _buildRow(String label, Widget field) {
    return Row(
      children: [Text(label), SizedBox(width: 10), field],
    );
  }
}
