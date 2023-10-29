import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/innerScreen/single_screen.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_deco.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        Navigator.pushNamed(context,SingleScreen.route);
      },
      leading: FancyShimmerImage(
        width: size.width * 0.2,
        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
        boxFit: BoxFit.fill,
      ),
      title: TextDeco(text: 'Title  x12', color: color, textsize: 18),
      trailing: TextDeco(text: '03/08/2022', color: color, textsize: 18),
    );
  }
}