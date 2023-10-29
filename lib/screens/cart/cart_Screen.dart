import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/cart_widget.dart';
import 'package:grocery/services/global.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/prize_widget.dart';
import 'package:grocery/widgets/text_deco.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethod.signoutDialog(context: context,tittle: 'are You Sure',fct: (){});
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
        title: TextDeco(
          text: "title",
          textsize: 25,
          color: color,
          istitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  print('hii');
                },
                

                child: Container(
                  height: 35,
                  width: 100,
                  margin:const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  child: Center(child: TextDeco(text: 'Order', textsize: 25, color: color,istitle:false,)),
                ),

              ),
              const Spacer(),
              Row(
            children: [
              TextDeco(text: "Total:", textsize: 18, color: color),
              PrizeWidget(salePrize: 2.59, prize: 2.29, textprize: '1', onSale:false)
            ],
          ),
            ],
          ),
          const SizedBox(height: 15,),
          Flexible(
            
            child: ListView.builder(
              
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
