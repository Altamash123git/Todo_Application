

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  DBhelper._();

 static  DBhelper getinstance()=> DBhelper._();
 Database? mdb;
 static final String Table_note_name="notes";
  static final String Table_note_id="id";
  static final String Table_note_title="title";
  static final String Table_note_desc="description";
  static final String Table_note_time="notes";


 Future<Database> getDB() async{
   if (mdb!=null){
     return mdb!;
   } else{
     mdb= await opendb();
     return mdb!;
   }
 }
 Future<Database> opendb() async{
var appdir=  await getApplicationDocumentsDirectory();
var dbpath= join(appdir.path, "notes");
return openDatabase(dbpath, version: 1, onCreate: (db,version){
  db.execute(" create table $Table_note_name ($Table_note_id integer primary key autoincrement, $Table_note_title text, $Table_note_desc string, $Table_note_time int)");

});

 }
 Future<bool> createNotes({required String title,required String desc, }) async{
   var db= await getDB();
    int rowseffected= await db.insert(Table_note_name, {
      Table_note_title:title,
      Table_note_desc: desc,
      //Table_note_time: time,
    }
    );
    return rowseffected>0;
 }
  Future<List<Map<String,dynamic>>> getnotes() async {
   var db= await getDB();
   List<Map<String, dynamic>> mdata = await db.query(Table_note_name);
   return mdata;


  }



}