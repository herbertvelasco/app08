import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/item_category_widget.dart';

import '../general/colors.dart';
import 'general_witget.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
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
          ItemCategoryWidget(
            text: "Personal",
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
    );
  }
}
