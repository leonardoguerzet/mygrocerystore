// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/app_data.dart' as appData;
import 'package:my_grocery_store/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => OrderTile(order: appData.orders[index],),
        separatorBuilder: (_, index) => SizedBox(height: 10,),
        itemCount: appData.orders.length,
      ),
    );
  }
}
