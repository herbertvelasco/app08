import 'package:flutter/material.dart';

class TaskSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      "Result",
      style: TextStyle(color: Colors.red),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text(
      "Sugges",
      style: TextStyle(color: Colors.red),
    );
  }
}
