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
      floatingActionButton: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
          decoration: BoxDecoration(
              color: kBrandPrymaryColor,
              borderRadius: BorderRadius.circular(14.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Nueva Tarea",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
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
           Padding(padding: EdgeInsets.all(14),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
              " Toda mi tarea",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: kBrandPrymaryColor.withOpacity(0.85),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                  //margin: const ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(4, 4),
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0,),
                    decoration: BoxDecoration(color: Color(0xff3E80FF), 
                    borderRadius: BorderRadius.circular (6.0),),
                    child: Text("Personal",
                    style: TextStyle(color: Colors.white, fontSize: 13.0,),
                    ),
                  ),
            ],
           ),
           ),
                  divider3(),
                  Text(
                    "lorem Lorem Ipsum es simplemente el texto de relleno ",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: kBrandPrymaryColor.withOpacity(0.85),
                    ),
                  ),
                  Text(
                    "lorem Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum relleno estándar de las industrias",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: kBrandPrymaryColor.withOpacity(0.75),
                    ),
                  ),
                  divider6(),
                  Text(
                    "11/11/1034",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: kBrandPrymaryColor.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
