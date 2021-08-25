import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transferencia/formulario_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionsListState();
  }
}

class TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = "Transactions";

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Transaction>>(
          future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Loading'),
                    ],
                  ),
                );
              case ConnectionState.done:
                final List<Transaction>? transactions = snapshot.data;
                if (transactions != null) {
                  return ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, indice) {
                      final transaction = transactions[indice];
                      return TransactionItem(transaction);
                    },
                  );
                } else {
                  return Text("Erro ao carregar transactions...");
                }
                break;
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final receivedTransaction = await Navigator.push<Transaction>(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.contact.accountNumber.toString()),
      ),
    );
  }
}
