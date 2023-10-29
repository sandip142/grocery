//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/viewed/history_widget.dart';
import 'package:grocery/services/backwidget.dart';
import 'package:grocery/services/global.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/empty_screen.dart';
import 'package:grocery/widgets/text_deco.dart';

class HistoryScreen extends StatefulWidget {
  static const route = '/HistoryScreen';
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    bool _isEmpty =true;
    Color color = Utils(context).color;
     if (_isEmpty == true) {
      return const EmptyScreen(
        title: 'Your history is empty',
        subtitle: 'No products has been viewed yet!',
        buttonText: 'Shop now',
        imagePath: 'assets/images/history.png',
      );
    } else {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethod.signoutDialog(
                    tittle: 'Empty your history?',                    
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            )
          ],
          leading: const Backwidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: TextDeco(
            text: 'History',
            color: color,
            textsize: 24.0,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: HistoryWidget(),
            );
          }),
    );
  }
}
}