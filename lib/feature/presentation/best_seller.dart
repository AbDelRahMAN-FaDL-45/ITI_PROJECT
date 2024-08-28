// import 'package:flutter/material.dart';

// class BestSellersScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> shoes = [
//     {
//       'name': 'Nike Air Force',
//       'price': 367.76,
//       'image': 'assets/images/nike1.png',
//       'colors': [Colors.blue, Colors.green, Colors.red],
//     },
//     {
//       'name': 'Nike Air Max',
//       'price': 254.89,
//       'image': 'assets/images/nike2.png',
//       'colors': [Colors.orange, Colors.purple, Colors.blue],
//     },
//     {
//       'name': 'Nike Jordan',
//       'price': 367.76,
//       'image': 'assets/images/shoes3.png',
//       'colors': [Colors.blue, Colors.green, Colors.red],
//     },
//     {
//       'name': 'Nike Air Max',
//       'price': 254.89,
//       'image': 'assets/images/nike3.png',
//       'colors': [Colors.pink, Colors.blue, Colors.purple],
//     },
//     {
//       'name': 'Nike Air Force',
//       'price': 367.76,
//       'image': 'assets/images/nike4.png',
//       'colors': [Colors.red, Colors.black, Colors.white],
//     },
//     {
//       'name': 'Nike Air Max',
//       'price': 254.89,
//       'image': 'assets/images/nike5.png',
//       'colors': [Colors.yellow, Colors.green, Colors.blue],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Back button functionality here
//           },
//         ),
//         title: Text('Best Sellers'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_list),
//             onPressed: () {
//               // Filter functionality here
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Search functionality here
//             },
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 4.2,
//           crossAxisSpacing: 8,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: shoes.length,
//         itemBuilder: (context, index) {
//           return ShoeCard(shoe: shoes[index]);
//         },
//       ),
//     );
//   }
// }

// class ShoeCard extends StatelessWidget {
//   final Map<String, dynamic> shoe;

//   ShoeCard({required this.shoe});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Image.asset(
//                 shoe['image'],
//                 fit: BoxFit.contain,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'BEST SELLER',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 12,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               shoe['name'],
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               "Men's Shoes",
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 10,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               '\$${shoe['price'].toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: shoe['colors']
//                   .map<Widget>((color) => Padding(
//                         padding: const EdgeInsets.only(right: 4.0),
//                         child: CircleAvatar(
//                           backgroundColor: color,
//                           radius: 5,
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BestSellersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoes = [
    {
      'name': 'Nike Air Force',
      'price': 367.76,
      'image': 'assets/images/nike1.png',
      'colors': [Colors.blue, Colors.green, Colors.red],
    },
    {
      'name': 'Nike Air Max',
      'price': 254.89,
      'image': 'assets/images/nike2.png',
      'colors': [Colors.orange, Colors.purple, Colors.blue],
    },
    {
      'name': 'Nike Jordan',
      'price': 367.76,
      'image': 'assets/images/shoes3.png',
      'colors': [Colors.blue, Colors.green, Colors.red],
    },
    {
      'name': 'Nike Air Max',
      'price': 254.89,
      'image': 'assets/images/nike3.png',
      'colors': [Colors.pink, Colors.blue, Colors.purple],
    },
    {
      'name': 'Nike Air Force',
      'price': 367.76,
      'image': 'assets/images/nike4.png',
      'colors': [Colors.red, Colors.black, Colors.white],
    },
    {
      'name': 'Nike Air Max',
      'price': 254.89,
      'image': 'assets/images/nike5.png',
      'colors': [Colors.yellow, Colors.green, Colors.blue],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Best Sellers'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality here
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4.2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
        ),
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return ShoeCard(shoe: shoes[index]);
        },
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Map<String, dynamic> shoe;

  ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                shoe['image'],
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'BEST SELLER',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Text(
              shoe['name'],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Men's Shoes",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 10,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '\$${shoe['price'].toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: shoe['colors']
                  .map<Widget>((color) => Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 5,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}