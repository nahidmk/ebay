import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/Student.dart';
import 'package:untitled1/provider/firebase_crud_provider.dart';
import 'package:untitled1/provider/profile_provider.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();


  _saveUser() async {

    Student student = Student(
      email: _emailController.text,
      name: _nameController.text,
      age: int.parse(_ageController.text),
      address: _addressController.text
    );
   await Provider.of<FirebaseCrudProvider>(context,listen: false).createStudent(student);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase sotre'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: "Name", border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),


            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                  labelText: "Age", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                  labelText: "Address", border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),
            MaterialButton(
              onPressed: () {
                _saveUser();
              },
              child: const Text('Save'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
