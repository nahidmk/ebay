


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/model/Student.dart';

class FirebaseCrudProvider extends ChangeNotifier{
  
  bool _loadCreateStudent = false;

  bool get loadCreateStudent => _loadCreateStudent;

  set loadCreateStudent(bool value) {
    _loadCreateStudent = value;
    notifyListeners();
  }




  Future createStudent(Student student) async {
    try{
      loadCreateStudent = true;
      print('====>${student.toJson()}');
      final docStudent = FirebaseFirestore.instance.collection("Students").doc();
      student.id = docStudent.id;
      final json = student.toJson();
      await docStudent.set(json);
      loadCreateStudent  = false;

    }catch(err){
      loadCreateStudent = false;
      print('create student err =====>$err');
    }

  }
}