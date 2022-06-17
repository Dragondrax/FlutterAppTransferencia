import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/editor.dart';
import 'package:my_app/screens/transferencia/lista_transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoConta = 'Número da Conta';
const _dicaCampoConta = '0000';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<FormularioTransferencia> createState() => _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoConta,
              dica: _dicaCampoConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text('Confirmar'))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta =
    int.parse(_controladorCampoNumeroConta.text);
    final double? valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}