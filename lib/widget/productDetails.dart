
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/feature/cart.dart'; // Import GetX

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ValueNotifier<String?> _selectedSize = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _selectedImage = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _selectedSize.dispose();
    _selectedImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Use GetX for navigation
          },
        ),
        title: Text(
          "Men's Shoes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            onPressed: () {
              Get.to(MyCartPage()); // Navigate to MyCartPage
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ValueListenableBuilder<String?>(
                  valueListenable: _selectedImage,
                  builder: (context, selectedImage, child) {
                    return Image.asset(
                      selectedImage ?? 'assets/images/Imag.png',
                      height: 200,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Icon(
                  Icons.circle,
                  size: 40,
                  color: Colors.blue.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'BEST SELLER',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nike Air Jordan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$967.800',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike...',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GalleryImage(
                    imageUrl: 'assets/images/shoe1.png',
                    isSelected: _selectedImage.value == 'assets/images/shoe1.png',
                    onTap: () {
                      _selectedImage.value = 'assets/images/shoe1.png';
                    },
                  ),
                  SizedBox(width: 8),
                  GalleryImage(
                    imageUrl: 'assets/images/shoe2.png',
                    isSelected: _selectedImage.value == 'assets/images/shoe2.png',
                    onTap: () {
                      _selectedImage.value = 'assets/images/shoe2.png';
                    },
                  ),
                  SizedBox(width: 8),
                  GalleryImage(
                    imageUrl: 'assets/images/shoe3.png',
                    isSelected: _selectedImage.value == 'assets/images/shoe3.png',
                    onTap: () {
                      _selectedImage.value = 'assets/images/shoe3.png';
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ValueListenableBuilder<String?>(
                valueListenable: _selectedSize,
                builder: (context, selectedSize, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizeOption(size: '38', isSelected: selectedSize == '38', onTap: () {
                        _selectedSize.value = '38';
                      }),
                      SizeOption(size: '39', isSelected: selectedSize == '39', onTap: () {
                        _selectedSize.value = '39';
                      }),
                      SizeOption(size: '40', isSelected: selectedSize == '40', onTap: () {
                        _selectedSize.value = '40';
                      }),
                      SizeOption(size: '41', isSelected: selectedSize == '41', onTap: () {
                        _selectedSize.value = '41';
                      }),
                      SizeOption(size: '42', isSelected: selectedSize == '42', onTap: () {
                        _selectedSize.value = '42';
                      }),
                      SizeOption(size: '43', isSelected: selectedSize == '43', onTap: () {
                        _selectedSize.value = '43';
                      }),
                    ],
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$849.69',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(MyCartPage()); // Navigate to MyCartPage when pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const GalleryImage({
    Key? key,
    required this.imageUrl,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}

class SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeOption({
    Key? key,
    required this.size,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}


