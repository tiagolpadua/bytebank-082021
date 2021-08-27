import 'package:bytebank/models/dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cabecalho extends StatelessWidget {
  final String title;

  Cabecalho(this.title);

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(builder: (
      context,
      darkModeModel,
      child,
    ) {
      return Row(
        children: [
          Text(title),
          Spacer(),
          IconButton(
            key: const Key("toggleDarkMode"),
            onPressed: () => darkModeModel.toggleDarkMode(),
            icon: Icon(darkModeModel.isDark
                ? Icons.lightbulb_outline
                : Icons.lightbulb),
          )
        ],
      );
    });
  }
}
