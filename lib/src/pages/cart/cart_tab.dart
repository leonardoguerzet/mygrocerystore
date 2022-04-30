// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/custom_colors.dart';
import 'package:my_grocery_store/src/models/cart_item_model.dart';
import 'package:my_grocery_store/src/pages/cart/components/cart_tile.dart';
import 'package:my_grocery_store/src/services/utils_services.dart';
import 'package:my_grocery_store/src/config/app_data.dart' as appData;

import '../common_widgets/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({
    Key? key,
  }) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
      utilsServices.showToast(message: '${cartItem.item.itemName} removido(a) do carrinho');
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
              itemCount: appData.cartItems.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total geral',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(
                    cartTotalPrice(),
                  ),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                     bool? result = await showOrderConfirmation();

                     if(result ?? false){
                       showDialog(
                         context: context,
                         builder: (_) {
                           return PaymentDialog(
                             order: appData.orders.first,
                           );
                         },
                       );
                     }
                     else{
                      utilsServices.showToast(message: 'Pedido não confirmado', isError: true,);
                     }
                    },
                    child: Text(
                      'Finalizar pedido',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text('Confirmar pedido'),
            content: Text(
              'Deseja realmente concluir seu pedido?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Não'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Sim'),
              ),
            ],
          );
        });
  }
}
