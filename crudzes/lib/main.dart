import 'package:flutter/material.dart';

import 'Create.dart';
import 'Delete.dart';
import 'Home.dart';
import 'Read.dart';
import 'Update.dart';



void main() => runApp(
  MaterialApp(
    home: Update(),
    initialRoute: "/",
    routes: {
      "/create" : (context) => Create(),
      "/read" : (context) => Read(),
      "/update" : (context) => Update(),
      "/delete" : (context) => Delete()
    },
  )
);
