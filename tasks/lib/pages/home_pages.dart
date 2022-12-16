import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general_witget.dart';
import 'package:tasks/ui/widgets/item_task_widget.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tasks');

  showTaskForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Agregar tarea",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                divider6(),
                TextFieldNormalWidget(
                  hintText: "Titulo",
                  icon: Icons.text_fields,
                ),
                divider6(),
                TextFieldNormalWidget(
                  hintText: "Description",
                  icon: Icons.description,
                ),
                divider10(),
                Text("Categoria"),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 10.0,
                  children: [
                    FilterChip(
                      selected: true,
                      backgroundColor: kBrandSecondaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      selectedColor: categoryColor["Personal"],
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      label: Text("Personal"),
                      onSelected: (bool value) {},
                    ),
                    FilterChip(
                      selected: true,
                      backgroundColor: kBrandSecondaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      selectedColor: categoryColor["Trabajo"],
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      label: Text("Trabajo"),
                      onSelected: (bool value) {},
                    ),
                    FilterChip(
                      selected: true,
                      backgroundColor: kBrandSecondaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      selectedColor: categoryColor["Otro"],
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      label: Text("Otro"),
                      onSelected: (bool value) {},
                    ),
                  ],
                ),
                divider10(),
                ButtonNormalWidget(),
              ],
            ),
          );
        });
  }

  // Stream<int> counter() async* {
  //   for (int i = 0; i < 10; i++) {
  //     await Future.delayed(Duration(seconds: 2));
  //     yield i;
  //   }
  // }

  // Future<int> getNumber() async {
  //   return 1000;
  // }

  @override
  Widget build(BuildContext context) {
    // counter().listen((event) {
    //   print(event);
    // });
    return Scaffold(
      backgroundColor: kBrandSecondaryColor,
      floatingActionButton: InkWell(
        onTap: () {
          showTaskForm(context);
        },
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
                    TextFieldNormalWidget(
                      hintText: "Buscar tarea...",
                      icon: Icons.search,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
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
                  //ItemTaskWidget(),
                  StreamBuilder(
                    stream: tasksReference.snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        List<TaskModel> tasks = [];
                        QuerySnapshot collection = snap.data;
                        // collection.docs.forEach((element) {
                        //   Map<String, dynamic> myMap =
                        //       element.data() as Map<String, dynamic>;
                        //   tasks.add(TaskModel.fromJson(myMap));
                        // });
                        tasks = collection.docs
                            .map((e) => TaskModel.fromJson(
                                e.data() as Map<String, dynamic>))
                            .toList();
                        return ListView.builder(
                          itemCount: tasks.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemTaskWidget(
                              taskModel: tasks[index],
                            );
                          },
                        );
                      }
                      return loadingWidget();
                    },
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
