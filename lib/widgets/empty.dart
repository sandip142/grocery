import 'package:flutter/material.dart';
import 'package:grocery/services/utils.dart';

class EmptyShow extends StatelessWidget {
  const EmptyShow({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color; 
    return  Center(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Image.asset('assets/images/box.png'),
                    Text(
                      "No product is on sale!\n    please Stay tuned",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}