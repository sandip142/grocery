import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/viewed/history_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';
//import 'package:grocery/screens/wishlist/wishlist_widget.dart';
import 'package:grocery/widgets/text_deco.dart';
import 'package:provider/provider.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final TextEditingController _adressController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _adressController.dispose();
    super.dispose();
  }
  //final String salt="\";
  //final String url="assets\images\warning-sign.png";

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<DarkThemeProvider>(context);
    final Color color = themeStatus.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hii,  ",
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "My Name",
                          style: TextStyle(
                            fontSize: 25,
                            color: color,
                            fontWeight: FontWeight.normal,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //method for make text tappeable
                              print("my name is Hanuman");
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextDeco(
                  text: "user@gmail.com",
                  textsize: 18,
                  color: color,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 15,
                ),
                _listuser(
                  tittle: "Address",
                  subtitle: "subtitle",
                  icon: IconlyLight.profile,
                  onchanged: () async {
                    await _showAdressDialog();
                  },
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                _listuser(
                  tittle: "Order",
                  icon: IconlyLight.buy,
                  onchanged: () {
                    Navigator.pushNamed(context,OrderScreen.route);
                  },
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                _listuser(
                  tittle: "WishList",
                  icon: IconlyLight.heart,
                  onchanged: () {
                    Navigator.pushNamed(context,WishlistScreen.route);
                  },
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                _listuser(
                  tittle: "Viewed",
                  icon: IconlyLight.show,
                  onchanged: () {
                    Navigator.pushNamed(context,HistoryScreen.route);
                  },
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                _listuser(
                  tittle: "Forgot Password",
                  icon: IconlyLight.unlock,
                  onchanged: () {},
                  color: color,
                ),
                const SizedBox(
                  height: 10,
                ),
                SwitchListTile(
                  title: TextDeco(
                    text: themeStatus.getDarkTheme ? "Dark Theme" : "Light Theme",
                    textsize: 18,
                    color: color,
                  ),
                  secondary: Icon(
                    themeStatus.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  ),
                  value: themeStatus.getDarkTheme,
                  onChanged: (bool value) {
                    setState(
                      () {
                        themeStatus.setDarkTheme = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                _listuser(
                  tittle: "logout",
                  icon: IconlyLight.logout,
                  onchanged: () async {
                    await _signoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Sign Out")
              ],
            ),
            content: const Text("do you want to signout"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const TextDeco(
                  text: "cancel",
                  textsize: 20,
                  color: Colors.cyan,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const TextDeco(
                  text: "OK",
                  textsize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAdressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update"),
            content: TextField(
              // onChanged: (value) {
              //    print('_addressTextController.text ${_adressController.text}');
              // },
              controller: _adressController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: " your Address"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Update"),
              ),
            ],
          );
        });
  }

  Widget _listuser({
    required String tittle,
    String? subtitle,
    required IconData icon,
    required Function onchanged,
    required Color color,
  }) {
    return ListTile(
      title: TextDeco(
        text: tittle,
        textsize: 22,
        color: color,
        istitle: true,
      ),

      subtitle: TextDeco(
        text: subtitle == null ? '' : subtitle!,
        color: color,
        textsize: 18,
      ), //remember this  to see on youtube
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onchanged();
      },
    );
  }
}
