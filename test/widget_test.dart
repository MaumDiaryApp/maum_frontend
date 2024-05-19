import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maum_frontend/main.dart'; // 이 부분은 실제 프로젝트의 구조에 맞게 조정해야 할 수 있습니다.

void main() {
  testWidgets('Splash screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));

    // Verify that our logo is displayed.
    expect(find.byKey(Key('splashImage')), findsOneWidget);

    // Waiting for 2 seconds animation
    await tester.pumpAndSettle(Duration(seconds: 2));

    // After animation, it should show the LoginScreen
    expect(find.text('로그인'), findsOneWidget);
    expect(find.text('회원가입'), findsOneWidget);
  });
}
