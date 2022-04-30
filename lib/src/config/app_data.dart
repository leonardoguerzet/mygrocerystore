import 'package:my_grocery_store/src/models/item_model.dart';
import 'package:my_grocery_store/src/models/user_model.dart';
import 'package:my_grocery_store/src/models/cart_item_model.dart';
import 'package:my_grocery_store/src/models/order_model.dart';

ItemModel apple = ItemModel(
  itemName: 'Maçã',
  imgUrl: 'assets/fruits/apple.png',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
  unit: 'kg',
  price: 5.5,
);

ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/fruits/grape.png',
  description: 'Desc Uva',
  unit: 'kg',
  price: 12.85,
);

ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/fruits/guava.png',
  description: 'Desc Goiaba',
  unit: 'kg',
  price: 5.39,
);

ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/fruits/kiwi.png',
  description: 'Desc Kiwi',
  unit: 'kg',
  price: 23.62,
);

ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/fruits/mango.png',
  description: 'Desc Manga',
  unit: 'unid',
  price: 3.12,
);

ItemModel papaya = ItemModel(
  itemName: 'Mamão',
  imgUrl: 'assets/fruits/papaya.png',
  description: 'Desc Mamão',
  unit: 'kg',
  price: 5.5,
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
];

UserModel user = UserModel(
  name: 'Leonardo G',
  email: 'leonardofernandesg@gmail.com',
  phone: '27 99225-2235',
  cpf: '123.123.123-12',
  password: 'caved',
);

List<OrderModel> orders = [

  //pedido 1
  OrderModel(
    id: 'asd14aj53128kgjs',
    createdDateTime: DateTime.parse('2022-04-19 20:00:15.123'),
    overdueDateTime: DateTime.parse('2022-04-19 20:00:15.123'),
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
    status: 'pending_payment',
    copyAndPaste: 'copyAndPaste',
    total: 11,
  ),

  //pedido 2
  OrderModel(
    id: 'aklfjb14aj5sdfa5',
    createdDateTime: DateTime.parse('2022-04-19 20:00:15.123'),
    overdueDateTime: DateTime.parse('2022-04-19 20:00:15.123'),
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
    status: 'delivered',
    copyAndPaste: 'copyAndPaste',
    total: 11,
  ),
];
