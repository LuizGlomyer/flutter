import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Image.asset("imagens/detalhe_cliente.png"),
                  Padding(padding: EdgeInsets.only(top: 10, right: 10)),
                  Text(
                    "Nosso relacionamento com você",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  )
                ],
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            Image.asset("imagens/cliente1.png"),
            Text("Empresa de software"),
            Image.asset("imagens/cliente2.png"),
            Text("Empresa de auditoria"),

          ],
        ),
      ),


    );
  }
}
