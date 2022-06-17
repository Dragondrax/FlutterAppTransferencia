import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

import 'formulario_transferencia.dart';

class ListaTransferenciasState extends State<ListaTransferencia>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if(transferenciaRecebida != null)
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
          });
        },
      ),
    );
  }
}

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}



class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}