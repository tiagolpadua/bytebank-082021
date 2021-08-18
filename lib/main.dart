import 'package:flutter/material.dart';

// CTRL+ALT+L
// ALT+ENTER
void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioTransferencia());
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: "Número da Conta",
                hintText: "0000",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                hintText: "0.00",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("Clicou no confirmar!");
              debugPrint("Clicou no confirmar!");

              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferencia = Transferencia(valor, numeroConta);
                debugPrint('$transferencia');
              } else {

                final snackBar = SnackBar(content: Text('Valores Inválidos!'));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // final snackBar = SnackBar(
                //   content: Text('Valores Inválidos!'),
                // );
                // Scaffold.of(context).showSnackBar(snackBar);
              }
              // } else {
              //   debugPrint("Valores devem ser preenchidos!");
              // }
            },
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(500.0, 2000)),
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

// alt + enter

// CTRL + /
