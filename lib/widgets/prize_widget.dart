import 'package:flutter/material.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_deco.dart';

class PrizeWidget extends StatelessWidget {
  PrizeWidget({
    super.key,
    required this.salePrize,
    required this.prize,
    required this.textprize,
    required this.onSale,
  });

  final double salePrize, prize;
  String textprize;
  final bool onSale;

  @override
  Widget build(BuildContext context) {
    final userPrize = onSale ? salePrize : prize;
    final Color color = Utils(context).color;
    if (textprize == '') {
      textprize = '1';
    }
    return FittedBox(
      child: Row(
        children: [
          TextDeco(
            text: '\$${(userPrize * double.parse(textprize)).toStringAsFixed(2)}',
            color: Colors.green,
            textsize: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: onSale ? true : false,
            child: Text(
              '\$${prize.toString()}',
              style: TextStyle(
                fontSize: 18,
                color: color,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          )
        ],
      ),
    );
  }
}
