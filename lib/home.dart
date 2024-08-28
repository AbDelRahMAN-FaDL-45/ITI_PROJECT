import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:my_app/core/widget/api.dart';
import 'package:my_app/core/widget/bloc.dart';
import 'package:my_app/core/widget/bloc2.dart';
import 'package:my_app/feature/cart.dart';
import 'package:my_app/feature/favoutir.dart'; // Ensure this path and class name are correct
import 'package:my_app/feature/presentation/best_seller.dart';
import 'package:my_app/feature/presentation/notifications.dart';
import 'package:my_app/feature/presentation/profile.dart';
import 'package:my_app/login_page.dart';
import 'package:my_app/widget/productDetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(apiService: ApiService(baseUrl: 'https://jsonplaceholder.typicode.com/posts'))
        ..add(FetchData()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer when menu icon is clicked
              },
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store location',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 16),
                  Text(
                    'EGYPT, Port Said',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.lock, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blueGrey.shade900,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Abdelrahman Ali',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  accountEmail: Text(''),
                  currentAccountPicture: GestureDetector(
                    onTap: () {
                      // Navigate to ProfileScreen when the profile picture is clicked
                      Get.to(() => ProfileScreen(
                            name: 'abdelrahman ali',
                            email: 'abdelrahmanfal05@gmail.com',
                            password: 'fadl5454',
                          ));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_picture.png'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('Profile', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Navigate to ProfileScreen when the Profile option is clicked
                    Get.to(() => ProfileScreen(
                          name: 'abdelrahman ali',
                          email: 'abdelrahmanfal05@gmail.com',
                          password: 'fadl5454',
                        ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Home Page', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle navigation here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.white),
                  title: Text('My Cart', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Get.to(() => MyCartPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text('Favorite', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Get.to(() => Favoutir());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag, color: Colors.white),
                  title: Text('Orders', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle navigation here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.white),
                  title: Text('Notifications', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Get.to(() => NotificationPage()); // Navigate to NotificationPage
                  },
                ),
                Divider(color: Colors.white70),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text('Sign Out', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Navigate to LoginPage when the Sign Out option is clicked
                    Get.to(() => LoginPage());
                  },
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DataLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Looking for shoes',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryButton(icon: 'assets/icons/nike.png', isActive: true),
                          CategoryButton(icon: 'assets/icons/puma.png'),
                          CategoryButton(icon: 'assets/icons/underarmour.png'),
                          CategoryButton(icon: 'assets/icons/adidas.png'),
                          CategoryButton(icon: 'assets/icons/converse.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Shoes',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductCard(
                            imageUrl: 'assets/images/shoe1.png',
                            title: 'Nike Jordan',
                            price: '\$493.00',
                            isBestSeller: true,
                          ),
                          SizedBox(width: 16), // Added spacing between images
                          ProductCard(
                            imageUrl: 'assets/images/shoe2.png',
                            title: 'Nike Air Max',
                            price: '\$897.99',
                            isBestSeller: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrivals',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ProductCard(
                      imageUrl: 'assets/images/shoe3.png',
                      title: 'Nike Air Jordan',
                      price: '\$849.69',
                      isBestSeller: false,
                      isBestChoice: true, // Added for "BEST CHOICE" label
                    ),
                  ],
                ),
              );
            } else if (state is DataError) {
              return Center(child: Text('Failed to load data'));
            } else {
              return Container(); // Placeholder for other states
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Use Get.to to navigate to ProductDetailPage
            Get.to(() => ProductDetailPage());
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.shopping_bag, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  // Navigate to FavouritePage when the heart icon is clicked
                  Get.to(() => Favoutir());
                },
              ),
              SizedBox(width: 48), // Space for the FAB
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Navigate to BestSellersScreen when the search icon is clicked
                  Get.to(() => BestSellersScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Get.to(() => NotificationPage()); // Navigate to NotificationPage
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigate to ProfileScreen when the profile icon is clicked
                  Get.to(() => ProfileScreen(
                        name: 'abdelrahman ali',
                        email: 'abdelrahmanfal05@gmail.com',
                        password: 'fadl5454',
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final bool isBestSeller;
  final bool isBestChoice; // Added for "BEST CHOICE" label

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.isBestSeller = false,
    this.isBestChoice = false, // Added for "BEST CHOICE" label
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailPage when the product card is clicked
        Get.to(() => ProductDetailPage());
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(imageUrl),
                if (isBestSeller)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'BEST SELLER',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                if (isBestChoice) // Added for "BEST CHOICE" label
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'BEST CHOICE',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String icon;
  final bool isActive;

  CategoryButton({
    required this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(icon, width: 24, height: 24),
    );
  }
}
