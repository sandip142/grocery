import 'package:flutter/material.dart';
import 'package:grocery/Models/product_model.dart';
import 'package:grocery/innerScreen/cat_screen.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.imgTittle,
    required this.passColor,
    required this.imgUrl,
  });
  final String imgUrl, imgTittle;
  final Color passColor;
  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<DarkThemeProvider>(context);
    final Color color = themeStatus.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    
    
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,CategoryScreen.route,arguments: imgTittle);
      },
      child: Container(
        decoration: BoxDecoration(
            color: passColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: passColor.withOpacity(0.2), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextDeco(
              text: imgTittle,
              textsize: 18,
              color: color,
              istitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
