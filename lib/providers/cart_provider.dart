import 'package:flutter/material.dart';
import 'package:grocery/Models/cat_model.dart';

class CartProvider with ChangeNotifier {

  //map where we add our products 
  Map<String, CartModel> cartItems = {};

//getter for getting the cartItem which require in map
  Map<String, CartModel> get getCartItems {
    return cartItems;  
  }  

//for adding product inside of cart
  void addProductToCart({
    required String productId,
    required int quantity,  //parameter of a function
  }) {
    cartItems.putIfAbsent(   //main body
      productId,             // if this  is not in map then map body is not work
      () => CartModel(
        id: DateTime.now().toString(),  //value are require to pass in map
        productId: productId,
        quantity: quantity,
      ),
    );
  }
}
