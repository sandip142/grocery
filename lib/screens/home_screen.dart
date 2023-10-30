import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/Models/product_model.dart';
import 'package:grocery/const/constss.dart';
import 'package:grocery/innerScreen/feeds_screen.dart';
import 'package:grocery/innerScreen/onSale_screen.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/category_saleCard.dart';
import 'package:grocery/widgets/product_view.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//DarkThemeProvider themeStatus=DarkThemeProvider();
//bool isChange=themeStatus.getDarkTheme;
  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<DarkThemeProvider>(context);
    final Color color = themeStatus.getDarkTheme ? Colors.white : Colors.black;
    Size size = Utils(context).getScreenSize;
    final productProviders = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProviders.getProduct;
    List<ProductModel> saleProduct = productProviders.isOnSaleProduct;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: TextDeco(text: "Home", textsize: 24, color: color),
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Card(
                elevation: 0,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      Constss.offerImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: Constss.offerImages.length,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.red)),
                  // control: const SwiperControl(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, OnsaleScreen.route);
              },
              child: const TextDeco(
                text: "View all",
                textsize: 20,
                color: Colors.blue,
                maxLines: 1,
              ),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextDeco(
                        text: "On Sale".toUpperCase(),
                        textsize: 22,
                        color: Colors.red,
                        istitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: saleProduct.length<10?saleProduct.length:10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: saleProduct[index],
                          child: const CategorySale(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDeco(
                    text: "Our Product",
                    textsize: 22,
                    color: color,
                    istitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FeedsScreen.route);
                    },
                    child: const TextDeco(
                      text: "Browse all",
                      textsize: 20,
                      color: Colors.blue,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(
                  allProducts.length < 4 ? allProducts.length : 4, (index) {
                return ChangeNotifierProvider.value(
                  value: allProducts[index],
                  child: const ProductView(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
