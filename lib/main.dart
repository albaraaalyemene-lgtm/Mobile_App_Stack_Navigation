 import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.orange),
    home: ProductListScreen(),
  ));
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('شاشة المنتجات  '), // تأكد من كتابة اسمك هنا
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 60, color: Colors.orange),
            SizedBox(height: 20),
            buildProductButton(context, 'Smart Watch', Colors.orange[900]!),
            buildProductButton(context, 'Headphones', Colors.orange[700]!),
          ],
        ),
      ),
    );
  }

  Widget buildProductButton(BuildContext context, String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text('View $name Details', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(productName: name, themeColor: color),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productName;
  final Color themeColor;
  ProductDetailsScreen({required this.productName, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$productName Details'), backgroundColor: themeColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Item: $productName', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to List'),
            ),
          ],
        ),
      ),
    );
  }
}
