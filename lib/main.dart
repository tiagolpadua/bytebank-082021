import 'package:flutter/material.dart';

// CTRL+ALT+L
// ALT+ENTER
void main() {
  runApp(
    MaterialApp(
      home: ListaTransferencias()
    ),
  );
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferênciasas"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 2000)),
          ItemTransferencia(Transferencia(200.0, 3000)),
          ItemTransferencia(Transferencia(300.0, 4000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressionou o botão");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

// alt + enter

// CTRL + /
