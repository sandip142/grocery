import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/screens/wishlist/wishlist_widget.dart';
import 'package:grocery/services/backwidget.dart';
import 'package:grocery/services/global.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_deco.dart';

class WishlistScreen extends StatefulWidget {
  static const route = '/WishlistScreen';
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
 
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading:const Backwidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethod.signoutDialog(context: context,tittle:"are you Sure",fct: (){});
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
        title: TextDeco(
          text: "title",
          textsize: 25,
          color: color,
          istitle: true,
        ),
      ),
      body: MasonryGridView.count(
        itemCount: 7,
          crossAxisCount: 2,
          // mainAxisSpacing: 16,
          // crossAxisSpacing: 20,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        )
    );
  }
}
