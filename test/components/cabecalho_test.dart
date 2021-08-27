import 'package:bytebank/components/cabecalho.dart';
import 'package:bytebank/screens/contacts/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Cabecalho deve ser renderizado', (WidgetTester tester) async {
    await tester.pumpWidget(
      Cabecalho("Foo Bar")
    );

    await tester.pumpAndSettle();

    expect(find.text('Foo Bar'), findsOneWidget);
  });
}
