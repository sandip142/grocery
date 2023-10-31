import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/Models/product_model.dart';

import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/empty.dart';
import 'package:grocery/widgets/product_view.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  static const route = '/onCategoryScreen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  final _searchController = TextEditingController();
  final FocusNode _searchTextfocusNode = FocusNode();
  

  @override
  
  void dispose() {
    // TODO: implement dispose
    _searchController!.dispose();
    _searchTextfocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final productProviders = Provider.of<ProductProvider>(context);
    final categoryId=ModalRoute.of(context)!.settings.arguments as String;
    List<ProductModel> allProducts = productProviders.categoryInfo(categoryId);
    
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
      body: allProducts.isEmpty?const EmptyShow(): SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextfocusNode,
                  controller: _searchController,
                  onChanged: (valuee){
                    setState(() {
                      
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.greenAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.greenAccent),
                    ),
                    hintText: 'search Something',
                    hintMaxLines: 1,
                    prefixIcon: const Icon(IconlyLight.search),
                    suffix: IconButton(
                      onPressed: () {
                        _searchController!.clear();
                        _searchTextfocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close,
                        color: _searchTextfocusNode
                                .hasFocus //.hasFocus is type boolean
                            ? Colors.red
                            : color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(
                allProducts.length, // number of items
                (index) {
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: const ProductView(
                  
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}