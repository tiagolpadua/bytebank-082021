import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/transaction_webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var nf = NumberFormat.simpleCurrency(locale: 'pt_BR');

class TransactionsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionsListState();
  }
}

class TransactionsListState extends State<TransactionsList> {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = "Transactions";

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Transaction>>(
          // future:
          //     Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
          future: _webClient.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Progress();
              case ConnectionState.done:
                final List<Transaction>? transactions = snapshot.data;

                if (transactions == null) {
                  return CenteredMessage(
                    'Unkown Error',
                    icon: Icons.error,
                  );
                }

                if (transactions.isEmpty) {
                  return CenteredMessage(
                    'No transactions found',
                    icon: Icons.warning,
                  );
                }

                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, indice) {
                    final transaction = transactions[indice];
                    return TransactionItem(transaction);
                  },
                );
            }
          }),
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
        title: Text(nf.format(_transaction.value)),
        subtitle: Text(_transaction.contact.accountNumber.toString()),
      ),
    );
  }
}
