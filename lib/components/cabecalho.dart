import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cabecalho extends StatelessWidget {
  final bool darkMode;
  final VoidCallback toggleDarkMode;
  final String titulo;

  const Cabecalho(this.titulo, this.darkMode, this.toggleDarkMode);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(titulo),
        Spacer(),
        IconButton(
          onPressed: () => toggleDarkMode(),
          icon: Icon(
              darkMode ? Icons.lightbulb_outline : Icons.lightbulb),
        )
      ],
    );
  }
}