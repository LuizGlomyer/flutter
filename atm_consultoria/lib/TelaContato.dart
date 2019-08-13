import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Image.asset("imagens/detalhe_contato.png"),
                  Padding(padding: EdgeInsets.only(top: 10, right: 10)),
                  Text(
                    "Onde nos encontrar",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  )
                ],
              ),
            ),


            Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),

            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In bibendum maximus convallis. Cras dignissim condimentum feugiat. Duis feugiat mollis nibh, nec feugiat magna eleifend ac. Aliquam tincidunt lorem urna, sit amet feugiat ante placerat eu. Aenean pretium erat nisl, tristique sollicitudin purus suscipit nec. Maecenas nulla velit, rhoncus sed feugiat sed, tristique fringilla urna. Quisque lacinia ultrices mauris vitae dapibus. Curabitur faucibus lacinia metus, ac dignissim sem aliquam eget. Vestibulum placerat quam at sapien condimentum, faucibus porttitor risus imperdiet. Nulla non eleifend massa. Fusce efficitur, dolor sed cursus elementum, lacus lacus egestas dolor, ac lacinia nisi erat placerat lacus. Fusce turpis mi, condimentum vel fermentum vel, interdum at lorem. Donec at lectus sed lacus fringilla dapibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla sit amet tincidunt ligula. Etiam vitae ligula nec ex eleifend egestas vel in eros. "
                  + "\n\n Nulla pellentesque odio ut posuere pulvinar. Quisque sollicitudin, felis sed tincidunt porta, sapien ligula laoreet magna, eu aliquam eros augue a arcu. Praesent varius lacus nisl, at scelerisque nunc lacinia at. Nunc accumsan interdum imperdiet. Donec quis eleifend dolor. Donec aliquam neque libero, ut vestibulum tortor fermentum tempus. Phasellus vestibulum facilisis leo. Maecenas mattis vel enim quis ultrices. Morbi cursus leo purus, nec hendrerit mauris tristique vitae. Nunc malesuada eros ac libero vestibulum vulputate. Vestibulum eu vestibulum tellus. Nunc sed pulvinar ipsum. Duis odio ligula, dapibus eget libero ut, elementum imperdiet justo. Donec quis iaculis risus. "
                  + "\n\n Duis eget orci id dolor accumsan lacinia. Sed porttitor placerat aliquet. Pellentesque enim felis, tristique eu libero at, semper malesuada dui. Nullam et massa et magna iaculis volutpat. Morbi fringilla aliquet commodo. Sed et ex arcu. Pellentesque convallis feugiat erat vitae mollis. Fusce tincidunt nec est id bibendum. Suspendisse quis lobortis metus. Duis non ligula eu ante sagittis euismod congue vitae mi. Pellentesque et nisi sem. Vivamus dictum odio ut euismod egestas. Donec pretium purus eu semper scelerisque. Nam ac imperdiet metus. ",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),


    );
  }
}
