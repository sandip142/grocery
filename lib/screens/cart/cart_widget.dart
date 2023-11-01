import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/Models/cat_model.dart';
import 'package:grocery/innerScreen/single_screen.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/heart_btn.dart';
//import 'package:grocery/widgets/prize_widget.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _itemcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _itemcontroller.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _itemcontroller.dispose();
    super.dispose();
  }

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

  void _addnumber() {
    setState(() {
      _itemcontroller.text = (int.parse(_itemcontroller.text) + 1).toString();
    });
  }

  void _minusnumber() {
    setState(() {
      if (int.parse(_itemcontroller.text) != 1) {
        _itemcontroller.text = (int.parse(_itemcontroller.text) - 1).toString();
      } else {
        _itemcontroller.text = '1';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final productProviders = Provider.of<ProductProvider>(context);
     final cartModal = Provider.of<CartModel>(context);
    final getCurrent =productProviders.detailedProduct(cartModal.productId); //put id which get from parent class
    double usedPrice=getCurrent.isOnSale?getCurrent.salePrice:getCurrent.price;
    
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, SingleScreen.route); //add path of SingleScree here
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FancyShimmerImage(
                        imageUrl: getCurrent.imageUrl,
                        height: size.width * 0.25,
                        width: size.width * 0.25,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextDeco(
                          text: getCurrent.title,
                          textsize: 22,
                          color: color,
                          istitle: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              buttonForOPeration(
                                color: Colors.red,
                                icon: CupertinoIcons.minus,
                                fct: _minusnumber,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _itemcontroller,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _itemcontroller.text = '1';
                                    } else {}
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              buttonForOPeration(
                                color: Colors.green,
                                icon: Icons.plus_one,
                                fct: _addnumber,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          HeartBtn(
                            onLike: onLike,
                            value: isColor,
                          ),
                          TextDeco(
                            text: '\$${usedPrice.toStringAsFixed(2)}',
                            color: color,
                            textsize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buttonForOPeration({
    required Color color,
    required IconData icon,
    required Function() fct,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
