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

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required onClick})
      : this.onClick = onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 140,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  this.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
