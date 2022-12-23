import 'package:flutter/material.dart';
import 'package:healthcare_perawat/core/const.dart';

class HelperUi {
  static void showAlertDialog(
      BuildContext context, String title, String content) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text(
      //       "Oke",
      //       style: TextStyle(
      //         color: kHealthCareColor,
      //       ),
      //     ),
      //   ),
      // ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
