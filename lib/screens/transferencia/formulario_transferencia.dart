import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  void dispose() {
    _controladorCampoNumeroConta.dispose();
    _controladorCampoValor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = "Criando Transferência";

    const _rotuloCampoNumeroConta = 'Numero da conta';
    const _dicaCampoNumeroConta = '0000';
    const _textoBotaoConfirmar = "Confirmar";

    const _rotuloCampoValor = 'Valor';
    const _dicaCampoValor = '0.00';

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              key: const Key('nr_conta'),
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
              key: const Key('valor'),
            ),
            ElevatedButton(
              key: const Key('cria_transf'),
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  _criaTransferencia(BuildContext context) {
    // final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    // final double? valor = double.tryParse(_controladorCampoValor.text);
    //
    // if (numeroConta != null && valor != null) {
    //   final transferenciaCriada = Transferencia(valor, numeroConta);
    //   Navigator.pop(context, transferenciaCriada);
    // } else {
    //   final snackBar = SnackBar(content: Text('Valores Inválidos!'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  }
}