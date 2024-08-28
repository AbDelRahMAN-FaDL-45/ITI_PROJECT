
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

class Favoutir extends StatefulWidget {
  @override
  _Favoutir createState() => _Favoutir();
}

class _Favoutir extends State<Favoutir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Use Get.back() or Navigator.pop(context) to go back to the previous screen
            Get.back();
          },
        ),
        title: Text(
          'Favourite',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Two cards per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75, // Adjusted aspect ratio for larger cards
          children: [
            ProductCard(
              image: 'assets/images/shoe1.png',
              title: 'Nike Jordan',
              price: '\$58.7',
              colors: [Colors.yellow, Colors.lightBlueAccent, Colors.green],
              isBestSeller: true,
            ),
            ProductCard(
              image: 'assets/images/shoe2.png',
              title: 'Nike Air Max',
              price: '\$37.8',
              colors: [Colors.lightBlue, Colors.grey],
              isBestSeller: true,
            ),
            ProductCard(
              image: 'assets/images/shoe3.png',
              title: 'Nike Club Max',
              price: '\$47.7',
              colors: [Colors.blueAccent, Colors.yellow],
              isBestSeller: true,
            ),
            ProductCard(
              image: 'assets/images/shoes1.png',
              title: 'Nike Air Max',
              price: '\$57.6',
              colors: [Colors.lightBlueAccent, Colors.blue],
              isBestSeller: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final List<Color> colors;
  final bool isBestSeller;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.colors,
    required this.isBestSeller,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Adjusted padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (widget.isBestSeller)
                  Text(
                    'BEST SELLER',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8), // Adjusted spacing
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: widget.colors
                      .map((color) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
