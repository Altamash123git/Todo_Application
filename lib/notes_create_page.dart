
import 'package:flutter/material.dart';
import 'package:todo_application/db_helper.dart';

class createnote extends StatefulWidget {
  const createnote({super.key});

  @override
  State<createnote> createState() => _createnoteState();
}

class _createnoteState extends State<createnote> {
   DBhelper dbhelper= DBhelper.getinstance();
   List<Map<String,dynamic>> allnotes=[];

  TextEditingController titlecontroller=TextEditingController();
  TextEditingController desccontroller= TextEditingController();
  void initState(){
    super.initState();
    getmynotes();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     /*  Center(
         child: Column(
           children: [TextField(
             controller: titlecontroller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),

             ),


           ),
             TextField(
               controller: desccontroller,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),

               ),
             ),
             Row(
               children: [Expanded(child: TextButton(
                 onPressed: (){
                   if
                 },
                 child: Text("add"),
               ))],
             )
           ],
         ),
       )*/
    Center(
       child: Center(
         child: Column(
           children: [
             TextField(
               controller: titlecontroller,


               decoration: InputDecoration(
                 hintText: "Enter title",
                 label: Text("title"),
                 focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),

                 )

               ),
             ),
             SizedBox(
               height: 15,
             ),
             TextField(
               controller:desccontroller,
               maxLines: 10,
               minLines: 1,


               decoration: InputDecoration(
                   hintText: "Enter Note's",

                   label: Text("description"),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),

                   )

               ),
             ),
             Row(
               children: [
                Expanded(child: TextButton(onPressed: () async{
                  addnotes();
                  Navigator.pop(context);
                  setState(() {

                  });
                }, child: Text("add",style: TextStyle(fontSize: 19,color: Colors.black),))),
                 Expanded(child: TextButton(onPressed: (){
                   Navigator.pop(context);
                   setState(() {

                   });
                 }, child: Text("cancel",style: TextStyle(fontSize: 19,color: Colors.black),)))
               ],
             )
           ],
         ),
       ),
     ),

   );

  }
  void getmynotes() async{
    allnotes=  await dbhelper.getnotes();
    setState(() {

    });

  }
  void addnotes() async{

    if(titlecontroller.text.isNotEmpty&& desccontroller.text.isNotEmpty){
      bool check =await  dbhelper.createNotes(title: titlecontroller.text, desc: desccontroller.text);
      if(check){
        getmynotes();

      }



    }
  }
}
