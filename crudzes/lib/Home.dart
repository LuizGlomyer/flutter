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
        title: Text("CRUD"),
        backgroundColor: Colors.grey,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  print("create");
                  Navigator.pushNamed(context, "/create");
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                        )
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Create",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  print("Read");
                  Navigator.pushNamed(context, "/read");
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                        )
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Read",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  print("Update");
                  Navigator.pushNamed(context, "/update");
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 204, 0, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 7,
                        )
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Update",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  print("Delete");
                  Navigator.pushNamed(context, "/delete");
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                        )
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Delete",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),

    );
  }
}
