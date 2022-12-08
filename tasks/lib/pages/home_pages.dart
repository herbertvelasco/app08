import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  // QuerySnapshot collection = value;
                  // List<QueryDocumentSnapshot> docs = collection.docs;
                  // QueryDocumentSnapshot doc = docs[0];
                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                  });
                });
              },
              child: Text(
                "Obtener Data",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference
                    .add({
                      "title": "Ir de compras al super",
                      "description":
                          "Debemos de comprar comida para todo el mes",
                    })
                    .then((DocumentReference value) {})
                    .catchError((error) {
                      print("Ocurrio un error en el registro");
                    })
                    .whenComplete(() {
                      print("El registro a terminado");
                    });
              },
              child: Text(
                "Agregar",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("").update(
                  {
                    "title": "Ir de paseo",
                    "description": "tenemos que salir muy temprano",
                  },
                ).catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("Actualizacion terminada");
                  },
                );
              },
              child: Text(
                "Actualizar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("").delete().catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("Eliminacion completada");
                  },
                );
              },
              child: Text(
                "Eliminar",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("").set(
                  {
                    "title": "Ir al concierto",
                    "description": "este fin de semana",
                  },
                ).catchError((error) {
                  print(error);
                }).whenComplete(() {
                  print("Creacion completada");
                });
              },
              child: Text(
                "Agregar doc peronalizado",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
