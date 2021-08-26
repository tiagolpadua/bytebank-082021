import 'dart:convert';

import 'package:bytebank/http/logging_interceptor.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

class TransactionWebClient {
  final baseUrl = Uri.parse('http://192.168.0.11:8080/transactions');

  Future<List<Transaction>> findAll() async {
    Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
    ]);

    final Response response =
        await client.get(baseUrl).timeout(const Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response);
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
    ]);

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client
        .post(
          baseUrl,
          headers: {'Content-type': 'application/json', 'password': '1000'},
          body: transactionJson,
        )
        .timeout(const Duration(seconds: 5));

    return _toTransaction(response);
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);

    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactionJson in decodedJson) {
      transactions.add(Transaction.fromJson(transactionJson));
    }
    return transactions;
  }

  Transaction _toTransaction(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }
}
