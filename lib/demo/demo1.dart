import 'package:flutter/material.dart';

class Product
{
  final String name;

  const Product({this.name});
}

void main() {
 runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
   title: 'Shopping App',
   home: ShoppingList(
     products: <Product>[
       Product(name: 'Eggs'),
       Product(name: 'Flour'),
       Product(name: 'chocolate chips'),
     ]
   )
 ));
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}):super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) _shoppingCart.add(product);
      else _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged
          );
        }).toList()
      ),
    );
  }
}

typedef void CardChangedCallBack(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CardChangedCallBack onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged}):product = product, super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}