import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPage();
}

class _ShoppingCartPage extends State<ShoppingCartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/Duck confit.jpg',
      'name': 'Duck confit',
      'description': 'Delicious, tasty',
      'price': 29.99,
      'oldPrice': 39.99,
      'quantity': 1,
    },
    {
      'image': 'assets/images/Duck confit.jpg',
      'name': 'Duck confit',
      'description': 'Delicious, tasty',
      'price': 49.99,
      'oldPrice': 39.99,
      'quantity': 2,
    },
  ];

  double get totalPrice {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  void _increment(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final panelTopGap = MediaQuery.of(context).padding.top + 20;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: Colors.black45),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight - panelTopGap,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 108,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/icon_44.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.only(bottom: 100),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return _buildCartItem(cartItems[index], index);
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Material(
                              elevation: 8,
                              shadowColor: Colors.black26,
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Text(
                                        '€${totalPrice.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // 'заглушка'
                                      },
                                      child: Container(
                                        height: 60,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow.shade600,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  (item['description'] as String?) ?? 'Delicious, tasty',
                  style: const TextStyle(fontSize: 19, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '€${item['price']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '€${item['oldPrice']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => _decrement(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Image.asset(
                      'assets/icons/icon_44.png',
                      width: 21,
                      height: 21,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  child: Text(
                    '${item['quantity']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _increment(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Image.asset(
                      'assets/icons/icon_43.png',
                      width: 21,
                      height: 21,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
