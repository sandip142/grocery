import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/Models/product_model.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/category_saleCard.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class OnsaleScreen extends StatelessWidget {
  static const route = '/onSaleScreen';
  const OnsaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // bool isEmpty = true;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    //provider for sale widget to fetch the equichangeble data that shows the State managment
    final productProviders = Provider.of<ProductProvider>(context);
    List<ProductModel> saleProduct = productProviders.isOnSaleProduct;

    return Scaffold(
      appBar: AppBar(
        title: TextDeco(
          text: 'Product on Sale',
          textsize: 22,
          color: color,
          istitle: true,
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyBold.arrowLeft2,
            color: color,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: saleProduct.isEmpty
          ? Center(
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
            )
          : GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(saleProduct.length, (index) {
                return ChangeNotifierProvider.value(
                  value: saleProduct[index],
                  child: const CategorySale(),
                );
              }),
            ),
    );
  }
}
