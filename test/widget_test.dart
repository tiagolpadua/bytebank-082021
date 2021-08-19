// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bytebank/main.dart';

void main() {
  testWidgets('Inicia a aplicação Bytebank', (WidgetTester tester) async {
    await tester.pumpWidget(BytebankApp());

    expect(find.text('Transferências'), findsOneWidget);
    expect(find.text('Criando Transferência'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Transferências'), findsNothing);
    expect(find.text('Criando Transferência'), findsOneWidget);
  });

  testWidgets('Deve incluir uma transferência', (WidgetTester tester) async {
    await tester.pumpWidget(BytebankApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Digita o nr da conta
    await tester.enterText(find.byKey(Key('nr_conta')), '123');

    // Digita o valor
    await tester.enterText(find.byKey(Key('valor')), '456');

    // Confirma
    await tester.tap(find.byKey(const Key('cria_transf')));

    await tester.pumpAndSettle();

    expect(find.text('123'), findsOneWidget);
  });
}
