import 'package:flutter/material.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/widgets/catregory_widget.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff53B175),
    const Color(0xffD3B0E0),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
       {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<DarkThemeProvider>(context);
    final Color color =
        themeStatus.getDarkTheme ? Colors.white : const Color(0xFF00001a);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextDeco(text: "Categories", textsize: 24, color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(catInfo.length, (index) {
            return CategoryWidget(
              imgTittle: catInfo[index]['catText'],
              passColor: gridColors[index],
              imgUrl: catInfo[index]['imgPath'],
            );
          },),
        ),
      ),
    );
  }
}
