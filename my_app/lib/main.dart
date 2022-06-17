import 'package:flutter/material.dart';

import 'screens/transferencia/lista_transferencia.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaTransferencia());
  }
}
