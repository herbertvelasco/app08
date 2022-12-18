import 'package:flutter/material.dart';
import 'package:tasks/services/my_service_firestore.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general_witget.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final formKey = GlobalKey<FormState>();
  MyServiceFirestore taskService = MyServiceFirestore(collection: "tasks");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String categorySelected = "Personal";

  showSelectDate() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
        cancelText: "Cancelar",
        confirmText: "Aceptar",
        helpText: "Seleccionar fecha",
        builder: (BuildContext context, Widget? widget) {
          return Theme(
            data: ThemeData.light().copyWith(
              dialogBackgroundColor: Colors.white,
              dialogTheme: DialogTheme(
                elevation: 0,
                backgroundColor: kBrandSecondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
              ),
              colorScheme: ColorScheme.light(
                primary: kBrandPrymaryColor,
              ),
            ),
            child: widget!,
          );
        });
    if (dateTime != null) {
      _dateController.text = dateTime.toString().substring(0, 10);
      setState(() {});
    }
  }

  registerTask() {
    if (formKey.currentState!.validate()) {
      taskService.addTask();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Form(
        key: formKey,
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
              controller: _titleController,
            ),
            divider10(),
            TextFieldNormalWidget(
              hintText: "Description",
              icon: Icons.description,
              controller: _descriptionController,
            ),
            divider10(),
            Text("Categorias: "),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10.0,
              children: [
                FilterChip(
                  selected: categorySelected == "Personal",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelected],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Personal"
                        ? Colors.white
                        : kBrandPrymaryColor,
                  ),
                  label: Text("Personal"),
                  onSelected: (bool value) {
                    categorySelected = "Personal";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Trabajo",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor["Trabajo"],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Trabajo"
                        ? Colors.white
                        : kBrandPrymaryColor,
                  ),
                  label: Text("Trabajo"),
                  onSelected: (bool value) {
                    categorySelected = "trabajo";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Otro",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor["Otro"],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Otro"
                        ? Colors.white
                        : kBrandPrymaryColor,
                  ),
                  label: Text("Otro"),
                  onSelected: (bool value) {
                    categorySelected = "Otro";
                    setState(() {});
                  },
                ),
              ],
            ),
            divider10(),
            TextFieldNormalWidget(
              hintText: "Fecha",
              icon: Icons.date_range,
              onTap: () {
                showSelectDate();
              },
              controller: _dateController,
            ),
            divider20(),
            ButtonNormalWidget(
              onPressed: () {
                registerTask();
              },
            ),
          ],
        ),
      ),
    );
  }
}
