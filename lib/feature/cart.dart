import 'package:flutter/material.dart';
import 'package:my_app/home.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartItemData> cartItems = [
    CartItemData(
      productName: 'Nike Club Max',
      imagePath: 'assets/images/shoes3.png',
      size: 'L',
      price: 64.95,
      quantity: 1,
    ),
    CartItemData(
      productName: 'Nike Air Max 200',
      imagePath: 'assets/images/shoes2.png',
      size: 'XL',
      price: 64.95,
      quantity: 1,
    ),
    CartItemData(
      productName: 'Nike Air Max',
      imagePath: 'assets/images/shoes1.png',
      size: 'XXL',
      price: 64.95,
      quantity: 1,
    ),
  ];

  double get subtotal => cartItems.fold(0, (total, item) => total + item.price * item.quantity);

  void updateQuantity(int index, int delta) {
    setState(() {
      cartItems[index].quantity += delta;
      if (cartItems[index].quantity < 1) {
        cartItems[index].quantity = 1;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ...cartItems.asMap().entries.map((entry) {
            int index = entry.key;
            CartItemData item = entry.value;
            return CartItem(
              productName: item.productName,
              imagePath: item.imagePath,
              size: item.size,
              price: item.price,
              quantity: item.quantity,
              onAdd: () => updateQuantity(index, 1),
              onRemove: () => updateQuantity(index, -1),
              onDelete: () => removeItem(index),
            );
          }).toList(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CostItem(label: 'Subtotal', cost: subtotal),
                    CostItem(label: 'Shipping', cost: 40.90),
                    SizedBox(height: 8.0),
                    Divider(),
                    SizedBox(height: 8.0),
                    CostItem(
                      label: 'Total Cost',
                      cost: subtotal + 40.90,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String productName;
  final String imagePath;
  final String size;
  final double price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  CartItem({
    required this.productName,
    required this.imagePath,
    required this.size,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.contain, // Adjusted to make the image look good
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text('Size: $size'),
                SizedBox(height: 4.0),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: onRemove,
              ),
              Text(
                '$quantity',
                style: TextStyle(fontSize: 16.0),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: onAdd,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class CostItem extends StatelessWidget {
  final String label;
  final double cost;
  final bool isTotal;

  CostItem({
    required this.label,
    required this.cost,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18.0 : 16.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '\$${cost.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18.0 : 16.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemData {
  String productName;
  String imagePath;
  String size;
  double price;
  int quantity;

  CartItemData({
    required this.productName,
    required this.imagePath,
    required this.size,
    required this.price,
    required this.quantity,
  });
}