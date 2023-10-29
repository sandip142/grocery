
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/services/utils.dart';

class Backwidget extends StatelessWidget {
  const Backwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
 
    return InkWell(
         
            borderRadius: BorderRadius.circular(12),
            onTap: () =>
                Navigator.canPop(context) ? Navigator.pop(context) : null,
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
              size: 24,
            ),
          );
  }
}