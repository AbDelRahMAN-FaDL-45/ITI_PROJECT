import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle clear all notifications
            },
            child: Text(
              'Clear All',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SectionHeader(title: 'Today'),
            NotificationTile(
              imageUrl: 'assets/images/shoes3 (2).png',
              title: 'We Have New Products With Offers',
              price: '\$364.95',
              discountedPrice: '\$260.00',
              timeAgo: '6 min ago',
              isNew: true,
            ),
            NotificationTile(
              imageUrl: 'assets/images/shoes1 (2).png',
              title: 'We Have New Products With Offers',
              price: '\$364.95',
              discountedPrice: '\$260.00',
              timeAgo: '26 min ago',
              isNew: true,
            ),
            SectionHeader(title: 'Yesterday'),
            NotificationTile(
              imageUrl: 'assets/images/shoes4 (2).png',
              title: 'We Have New Products With Offers',
              price: '\$364.95',
              discountedPrice: '\$260.00',
              timeAgo: '4 day ago',
              isNew: false,
            ),
            NotificationTile(
              imageUrl: 'assets/images/shoe3.png',
              title: 'We Have New Products With Offers',
              price: '\$364.95',
              discountedPrice: '\$260.00',
              timeAgo: '4 day ago',
              isNew: false,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String discountedPrice;
  final String timeAgo;
  final bool isNew;

  const NotificationTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.discountedPrice,
    required this.timeAgo,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 100,  // Increased width
                height: 100, // Increased height
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    discountedPrice,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  timeAgo,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 8),
                if (isNew)
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 10,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

