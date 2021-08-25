import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = "Transferências";

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final transferenciaRecebida = await Navigator.push<Transferencia>(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          );

          if (transferenciaRecebida != null) {
            _atualiza(transferenciaRecebida);

            // Future.delayed(Duration(seconds: 3), () {
            //   debugPrint("chegou no futuro!");
            //   setState(() => widget._transferencias.add(transferenciaRecebida));
            // });

            // debugPrint("vai esperar...");
            // await Future.delayed(Duration(seconds: 3));
            // debugPrint("chegou no futuro...");
            // setState(() => widget._transferencias.add(transferenciaRecebida));
          }

          // debugPrint("Antes do future");
          // final Future future =
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return FormularioTransferencia();
          // }));
          // future.then((transferenciaRecebida) {
          //   debugPrint('chegou no then do future');
          //   debugPrint('$transferenciaRecebida');
          //   if (transferenciaRecebida != null) {
          //     setState(() => widget._transferencias.add(transferenciaRecebida));
          //   } else {
          //     print('voltou nulo');
          //   }
          // });
          // debugPrint("Depois do future");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() => widget._transferencias.add(transferenciaRecebida));
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
