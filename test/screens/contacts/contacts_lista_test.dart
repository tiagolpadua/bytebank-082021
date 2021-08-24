import 'package:bytebank/screens/contacts/contacts_lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ContactsList deve ser renderizado', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ContactsList(),
      ),
    );

    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.text('Contacts'), findsOneWidget);
  });
}
