import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisições json"),
        backgroundColor: Colors.redAccent,
      ),

      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Posts"),
              onPressed: (){
                Navigator.pushNamed(context, "/posts");
              },
            ),

            RaisedButton(
              child: Text("Comments"),
              onPressed: (){
                Navigator.pushNamed(context, "/comments");
              },
            ),

            /*
            RaisedButton(
              child: Text("Albums"),
              onPressed: (){},
            ),
            */

            RaisedButton(
              child: Text("Photos"),
              onPressed: (){
                Navigator.pushNamed(context, "/photos");
              },
            ),
          ],
        ),
      )

    );
  }
}
