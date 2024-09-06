import 'package:flutter/material.dart';
import 'package:todo_application/db_helper.dart';
import 'package:todo_application/notes_create_page.dart';

class notes_home extends StatefulWidget {
  const notes_home({super.key});


  @override


  State<notes_home> createState() => _notes_homeState();
}

class _notes_homeState extends State<notes_home> {
  DBhelper dBhelper= DBhelper.getinstance();
  var timestamp= DateTime.now();

  List<Map<String, dynamic>> allnotes = [

  ];
  @override
  void initState(){
    super.initState();
    getmynotes();
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Notes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
        actions: [
          Icon(Icons.search, color:  Colors.black,size: 40,)
        ],
      ),
      body:   allnotes.isNotEmpty? Container(
        height: double.infinity,
        child: ListView.builder(
          //shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemCount: allnotes.length,
            itemBuilder: (c,index){
            return Container(

              margin: EdgeInsets.all(15),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2
                ),
              ),
              //height: double.infinity,
              child: Column(
                children: [
                  Text(allnotes[index][DBhelper.Table_note_title],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text(allnotes[index][DBhelper.Table_note_desc]),
                  Text(timestamp.toString()),

                ],
              ),

            );
            }),
      )://:Container(color: Colors.yellow,),
      Center(
            child: Container(child: Column(
            children: [
              Text("No Notes yet"),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>createnote()));
              }, child: Text("add notes"))
            ],
                    ),
                  ),
          ),
      floatingActionButton: allnotes.isNotEmpty? FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:(){

        Navigator.push(context, MaterialPageRoute(builder: (c)=>createnote()));
      }):null,

    );

  }
  void getmynotes() async {
    allnotes= await dBhelper.getnotes();
    print(allnotes);
    setState(() {

    });

  }
}
