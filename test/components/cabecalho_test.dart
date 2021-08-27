import 'package:bytebank/components/cabecalho.dart';
import 'package:bytebank/models/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('Testes do Cabecalho', () {
    testWidgets('Cabecalho deve ser renderizado', (WidgetTester tester) async {
      await tester.pumpWidget(
        getWidgetComCabecalho(DarkModeModel()),
      );

      await tester.pumpAndSettle();

      expect(find.text('Foo'), findsOneWidget);
    });

    testWidgets('Ao clicar na lâmpada, alterar darkMode',
        (WidgetTester tester) async {
      var dmm = DarkModeModel();

      await tester.pumpWidget(
        getWidgetComCabecalho(dmm),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('toggleDarkMode')));

      await tester.pumpAndSettle();

      expect(dmm.isDark, true);
    });
  });
}

ChangeNotifierProvider<DarkModeModel> getWidgetComCabecalho(DarkModeModel dmm) {
  return ChangeNotifierProvider(
    create: (context) => dmm,
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Cabecalho("Foo"),
        ),
        body: Text("Bar"),
      ),
    ),
  );
}
