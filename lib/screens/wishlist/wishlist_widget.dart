import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/innerScreen/single_screen.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/heart_btn.dart';
import 'package:grocery/widgets/text_deco.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});
  
  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {

  bool isColor=true;
  void onLike() {
    setState(() {
      if (isColor) {
        isColor = false;
      } else {
        isColor = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,SingleScreen.route);
        },
        child: Container(
          height: size.height * 0.18,
          decoration: BoxDecoration(
              border: Border.all(color: color, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                height: size.height * 0.2,
                width: size.width * 0.2,
                child: FancyShimmerImage(
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  boxFit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: color,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          HeartBtn(onLike: (){})
                        ],
                      ),
                      const SizedBox(height: 5,),
                      TextDeco(text: 'tittle', textsize: 20, color: color,istitle: false,maxLines: 2,),
                      const SizedBox(height: 5,),
                      TextDeco(text: "\$2.59", textsize:20, color: color,istitle: false,)
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
