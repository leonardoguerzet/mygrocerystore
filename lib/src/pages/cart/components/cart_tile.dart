import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/custom_colors.dart';
import 'package:my_grocery_store/src/models/cart_item_model.dart';
import 'package:my_grocery_store/src/pages/common_widgets/quantity_widget.dart';
import 'package:my_grocery_store/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 50,
          width: 50,
        ),
        //titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        //total
        subtitle: Text(utilsServices.priceToCurrency(widget.cartItem.totalPrice(),),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //quantidade
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if(quantity == 0){
                widget.remove(widget.cartItem);
              }

            });

          },
          isRemovable: true,
        ),
      ),
    );
  }
}
