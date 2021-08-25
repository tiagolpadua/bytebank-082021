import 'package:bytebank/screens/contacts/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ContactForm deve ser renderizado', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ContactForm(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('New contact'), findsOneWidget);
  });
}
