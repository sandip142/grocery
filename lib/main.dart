import 'package:flutter/material.dart';
import 'package:grocery/const/style.dart';
import 'package:grocery/innerScreen/cat_screen.dart';
import 'package:grocery/innerScreen/feeds_screen.dart';
import 'package:grocery/innerScreen/onSale_screen.dart';
import 'package:grocery/innerScreen/single_screen.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/providers/cart_provider.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/screens/auth/forget_pass.dart';
import 'package:grocery/screens/auth/login_screen.dart';
import 'package:grocery/screens/auth/register.dart';
import 'package:grocery/screens/btm_bar.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/viewed/history_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';
//import 'package:grocery/screens/wishlist/wishlist_widget.dart';
//import 'package:grocery/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  DarkThemeProvider dp = DarkThemeProvider();

  void getCurrentappTheme() async {
    dp.setDarkTheme = await dp.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentappTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // bool isDark = false;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return dp;
          },
        ),
         ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: Style.themeData(themeProvider.getDarkTheme, context),
              home: const BottomBar(),
              routes: {
                 OnsaleScreen.route:(context) =>const OnsaleScreen(),
                 FeedsScreen.route:(context) => const FeedsScreen(),
                 SingleScreen.route:(context)=>const SingleScreen(),
                 WishlistScreen.route:(context) => const WishlistScreen(),
                 HistoryScreen.route:(context)=>const HistoryScreen(),
                 OrderScreen.route:(context)=>const OrderScreen(),
                 LoginScreen.route:(context)=> const LoginScreen(),
                 RegisterScreen.route:(context)=> const RegisterScreen(),
                 ForgetPasswordScreen.route:(context) => const ForgetPasswordScreen(),
                 BottomBar.route:(context) => const BottomBar(),
                 CategoryScreen.route:(context) => const CategoryScreen()

              },
              );
        },
      ),
    );
  }
}
