import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/const/constss.dart';
import 'package:grocery/screens/auth/forget_pass.dart';
import 'package:grocery/screens/auth/register.dart';
import 'package:grocery/screens/btm_bar.dart';
import 'package:grocery/widgets/text_deco.dart';

import '../../widgets/auth_button.dart';
import '../../widgets/google_button.dart';


class LoginScreen extends StatefulWidget {
   static const route = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('THe form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Swiper(
          duration: 800,
          autoplayDelay: 8000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              Constss.authImagesPaths[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: Constss.authImagesPaths.length,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 120.0,
                ),
                 const TextDeco(
                  text: 'Welcome Back',
                  color: Colors.white,
                  textsize: 30,
                  istitle: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextDeco(
                  text: "Sign in to continue",
                  color: Colors.white,
                  textsize: 18,
                  istitle: false,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        //Password

                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitFormOnLogin();
                          },
                          controller: _passTextController,
                          focusNode: _passFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,ForgetPasswordScreen.route);
                    },
                    child: const Text(
                      'Forget password?',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  fct: () {
                    Navigator.pushNamed(context,BottomBar.route);
                  },
                  buttonText: 'Login',
                ),
                const SizedBox(
                  height: 20,
                ),
                const GoogleButton(),
                const SizedBox(
                  height: 10,
                ),
               const Row(
                  children: [
                     Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                     SizedBox(
                      width: 5,
                    ),
                    TextDeco(
                      text: 'OR',
                      color: Colors.white,
                      textsize: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                     Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  fct: () {},
                  buttonText: 'Continue as a guest',
                  primary: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        children: [
                      TextSpan(
                          text: '  Sign up',
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushNamed(context, RegisterScreen.route); 
                          }),
                    ]))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
