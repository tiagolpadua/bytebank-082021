import 'package:bytebank/components/cabecalho.dart';
import 'package:bytebank/models/dark_mode_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Cabeçalho deve ser renderizado', (WidgetTester tester) async {
    await tester.pumpWidget(
      montarWidgetCabecalho(DarkModeModel()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Foo'), findsOneWidget);
  });

  testWidgets('Quando clica na lâmpada, altera o darkmode', (WidgetTester tester) async {
    final dmm = DarkModeModel();
    await tester.pumpWidget(
      montarWidgetCabecalho(dmm),
    );

    await tester.pumpAndSettle();

    expect(dmm.isDarkMode, false);

    await tester.tap(find.byKey(Key('iconeDarkMode')));

    await tester.pumpAndSettle();

    expect(dmm.isDarkMode, true);
  });
}

MaterialApp montarWidgetCabecalho(DarkModeModel dmm) {
  return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: ChangeNotifierProvider(
            create: (context) => dmm,
            child: Cabecalho("Foo"),
          ),
        ),
        body: Text("Bar"),
      ),
    );
}
