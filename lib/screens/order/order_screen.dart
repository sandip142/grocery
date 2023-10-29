import 'package:flutter/material.dart';
import 'package:grocery/screens/order/order_widget.dart';
import 'package:grocery/services/backwidget.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/empty_screen.dart';
import 'package:grocery/widgets/text_deco.dart';

class OrderScreen extends StatefulWidget {
  static const route = '/orderScreen';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    final Color color = Utils(context).color;
    if (isEmpty == true) {
      return const EmptyScreen(
        title: 'You didnt place any order yet',
        subtitle: 'order something and make me happy :)',
        buttonText: 'Shop now',
        imagePath: 'assets/images/cart.png',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: const Backwidget(),
          elevation: 0,
          centerTitle: false,
          title: TextDeco(
            text: 'Your orders (2)',
            color: color,
            textsize: 24.0,
            istitle: true,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: OrderWidget(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: color,
              thickness: 1,
            );
          },
        ),
      );
    }
  }
}
