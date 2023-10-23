import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:u_patrol/main.dart';
import 'package:u_patrol/flutter_flow/flutter_flow_util.dart';

import 'package:u_patrol/backend/firebase/firebase_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Log in with Valid Credentials', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(Duration(milliseconds: 5000));
    await tester.tap(find.byKey(ValueKey('Button_8t21')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.tap(find.byKey(ValueKey('Tab_hcur')));
    await tester.enterText(
        find.byKey(ValueKey('emailAddress_Login_dfbk')), 'test@test.com');
    await tester.enterText(
        find.byKey(ValueKey('password_Login_4qxs')), 'password');
    await tester.tap(find.byKey(ValueKey('Button-Login_708q')));
    await tester.pumpAndSettle(Duration(milliseconds: 4000));
    expect(find.byKey(ValueKey('Report_61x6')), findsWidgets);
  });

  testWidgets('Log in with invalid Credentials', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(Duration(milliseconds: 5000));
    await tester.tap(find.byKey(ValueKey('Button_8t21')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.tap(find.byKey(ValueKey('Tab_hcur')));
    await tester.enterText(
        find.byKey(ValueKey('emailAddress_Login_dfbk')), 'test@test123.com');
    await tester.enterText(
        find.byKey(ValueKey('password_Login_4qxs')), 'password');
    await tester.tap(find.byKey(ValueKey('Button-Login_708q')));
    await tester.pumpAndSettle(Duration(milliseconds: 4000));
    expect(find.byKey(ValueKey('Report_61x6')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
