import 'package:bytebank/models/dark_mode_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cabecalho extends StatelessWidget {
  final String titulo;

  const Cabecalho(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
      builder: (context, darkModeModel, child) {
        return Row(
          children: [
            Text(titulo),
            Spacer(),
            IconButton(
              key: const Key("iconeDarkMode"),
              onPressed: () => darkModeModel.toggleDarkMode(),
              icon: Icon(darkModeModel.isDarkMode
                  ? Icons.lightbulb_outline
                  : Icons.lightbulb),
            )
          ],
        );
      },
    );
  }
}
