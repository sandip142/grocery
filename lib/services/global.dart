import 'package:flutter/material.dart';
import 'package:grocery/widgets/text_deco.dart';

class GlobalMethod{
   static Future<void> signoutDialog({required BuildContext context,required String tittle,required Function() fct}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Delete")
              ],
            ),
            content: Text(tittle),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const TextDeco(
                  text: "cancel",
                  textsize: 20,
                  color: Colors.cyan,
                ),
              ),
              TextButton(
                onPressed:(){
                  fct(); //change happens in child folder
                  if(Navigator.canPop(context))
                  {
                    Navigator.pop(context);
                  }
                },
                child: const TextDeco(
                  text: "delete",
                  textsize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          );
        });
  }
}