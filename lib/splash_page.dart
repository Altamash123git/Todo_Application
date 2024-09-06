import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/notes_ui.dart';

class  splash extends StatefulWidget{
  @override
 
  State<splash> createState() => _splashState();
}


class _splashState extends State<splash> {

  @override


  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3 ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> notes_home()));
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          //color: Colors.pinkAccent,
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(50),
          child:  Column(
            children: [
              Text("No need to remeber everything\njust Write it down ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(
                height: 20,
              ),
              Image.network("https://cdn5.vectorstock.com/i/1000x1000/58/64/notes-app-icon-vector-19605864.jpg")
            ],
          ),
        ),
      ),
    );
  }
}