import 'package:flutter/material.dart';
import 'homepage.dart';

class OrderedPage extends StatefulWidget {
  const OrderedPage ({super.key});

  @override
  State<OrderedPage> createState() => _OrderedPage();
}

class _OrderedPage extends State<OrderedPage> {

  final List<Map<String, dynamic>> _orderedItems = [
    {
      'image': 'assets/images/Pain Brie.jpg',
      'name': 'Pain Brie',
      'description': 'A delicious pastry filled with creamy brie cheese and a hint of sweetness.',
      'price': 4.99,
      'oldPrice': 6.99,
    },
    {
      'image': 'assets/images/Pain Brie.jpg',
      'name': 'Pain Brie',
      'description': 'A delicious pastry filled with creamy brie cheese and a hint of sweetness.',
      'price': 4.99,
      'oldPrice': 6.99,
    },
    {
      'image': 'assets/images/Pain Brie.jpg',
      'name': 'Pain Brie',
      'description': 'A delicious pastry filled with creamy brie cheese and a hint of sweetness.',
      'price': 4.99,
      'oldPrice': 6.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Ordered',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _orderedItems.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Divider(color: Colors.grey.shade300, thickness: 1),
        ),
        itemBuilder: (context, index) {
          final item = _orderedItems[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['image'],
                  width: 80,
                  height: 55,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 55,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          '€${item['price'].toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '€${item['oldPrice'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const Text(
                'Successful',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(seatNumber: '23', diners: 2)),
              (route) => false,
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Ordered'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          )
        ],
      ),
    );
  }
}
