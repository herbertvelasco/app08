import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/general_witget.dart';
import 'package:tasks/ui/widgets/textfield_search_widget.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tasks');
  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  Future<int> getNumber() async {
    return 1000;
  }

  @override
  Widget build(BuildContext context) {
    counter().listen((event) {
      print(event);
    });
    return Scaffold(
      backgroundColor: kBrandSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido Ramon",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: kBrandPrymaryColor,
                      ),
                    ),
                    Text(
                      "Mis Tareas",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                        color: kBrandPrymaryColor,
                      ),
                    ),
                    divider10(),
                    TextFieldSearchWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
