import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/Models/product_model.dart';
import 'package:grocery/innerScreen/single_screen.dart';
import 'package:grocery/providers/cart_provider.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/heart_btn.dart';
import 'package:grocery/widgets/prize_widget.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:provider/provider.dart';

class CategorySale extends StatefulWidget {
  const CategorySale({super.key});

  @override
  State<CategorySale> createState() => _CategorySaleState();
}

class _CategorySaleState extends State<CategorySale> {
  @override
  bool isColor = false;
  void onLike() {
    setState(() {
      if (isColor) {
        isColor = false;
      } else {
        isColor = true;
      }
    });
  }

  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final allProducts = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(context, SingleScreen.route,
                arguments: allProducts.id);
          },
          onDoubleTap: onLike,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: allProducts.imageUrl,
                      width: size.width * 0.22,
                      height: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextDeco(
                          text: allProducts.isPiece ? '1Piece' : '1KG',
                          color: color,
                          textsize: 22,
                          istitle: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                cartProvider.addProductToCart(
                                  productId: allProducts.id,
                                  quantity: 1,
                                );
                              },
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            HeartBtn(onLike: onLike, value: isColor)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                PrizeWidget(
                    salePrize: allProducts.salePrice,
                    prize: allProducts.price,
                    textprize: '1',
                    onSale: allProducts.isOnSale),
                const SizedBox(
                  height: 5,
                ),
                FittedBox(
                  child: TextDeco(
                    text: allProducts.title,
                    textsize: 20,
                    color: color,
                    istitle: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
