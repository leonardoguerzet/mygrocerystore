// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/custom_colors.dart';
import 'package:my_grocery_store/src/models/item_model.dart';
import 'package:my_grocery_store/src/pages/common_widgets/quantity_widget.dart';
import 'package:my_grocery_store/src/services/utils_services.dart';

import '../cart/cart_tab.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //conteudo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nome e quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            value: cartItemQuantity,
                            suffixText: widget.item.unit,
                            result: (int quantity) {

                              setState(() {
                                cartItemQuantity = quantity;
                              });

                            },
                          )
                        ],
                      ),
                      //Preço
                      Text(
                        utilsServices.priceToCurrency(widget.item.price * cartItemQuantity),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      //Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartTab()));
                          },
                          label: Text(
                            'Adicionar ao carrinho',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
