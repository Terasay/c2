import 'package:flutter/material.dart';
import 'shopcart.dart';

class HomePage extends StatefulWidget {
  final String seatNumber;
  final int diners;

  const HomePage({super.key, required this.seatNumber, required this.diners});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 1;
  int _selectedCategoryIndex = 0;

  final List<List<String>> _categoryImages = [
    [
      'assets/images/Basque chicken stew.jpg',
      'assets/images/Cassoulet.jpg',
      'assets/images/FrenchSnail.jpg',
      'assets/images/Frog legs.jpg',
    ],
    [
      'assets/images/Croissant.jpg',
      'assets/images/Croissant.jpg',
      'assets/images/Croissant.jpg',
      'assets/images/Croissant.jpg',
    ],
    [
      'assets/images/Pumpkin Soup.jpg',
      'assets/images/Pumpkin Soup.jpg',
      'assets/images/Pumpkin Soup.jpg',
      'assets/images/Pumpkin Soup.jpg',
    ],
  ];

  final List<List<Map<String, dynamic>>> _categoryFoods = [
    [
      //первый список - главные блюда
      {
        'image': 'assets/images/Basque chicken stew.jpg',
        'name': 'Basque chicken stew',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Basque chicken stew.jpg',
        'name': 'Basque chicken stew',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Basque chicken stew.jpg',
        'name': 'Basque chicken stew',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Basque chicken stew.jpg',
        'name': 'Basque chicken stew',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
    ],

    [
      //второй список - выпечка
      {
        'image': 'assets/images/Croissant.jpg',
        'name': 'Croissant',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Croissant.jpg',
        'name': 'Croissant',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Croissant.jpg',
        'name': 'Croissant',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Croissant.jpg',
        'name': 'Croissant',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
    ],

    [
      //третий список - супы
      {
        'image': 'assets/images/Pumpkin Soup.jpg',
        'name': 'Pumpkin Soup',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Pumpkin Soup.jpg',
        'name': 'Pumpkin Soup',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Pumpkin Soup.jpg',
        'name': 'Pumpkin Soup',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/Pumpkin Soup.jpg',
        'name': 'Pumpkin Soup',
        'description': 'delicious, tasty',
        'price': 15.99,
        'oldPrice': 19.99,
        'rating': 4.5,
      },
    ],
  ];

  Widget _buildCategoryItem(int index, String title, Widget iconWidget) {
    bool isSelected = _selectedCategoryIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,

          if (isSelected) ...[
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(38),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              food['image'],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        food['description'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 17),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '€${food['price']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '€${food['oldPrice']}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: 120,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 60),

                _buildCategoryItem(
                  0,
                  'Main dishes',
                  Image.asset(
                    'assets/icons/icon_90.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(height: 90),

                _buildCategoryItem(
                  1,
                  'Pasteries',
                  Image.asset(
                    'assets/icons/icon_92.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(height: 90),

                _buildCategoryItem(
                  2,
                  'Soups',
                  Image.asset(
                    'assets/icons/icon_91.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ],
            ),
          ),

          const VerticalDivider(width: 1, thickness: 1, color: Colors.black12),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,

                      children: _categoryImages[_selectedCategoryIndex].map((
                        imagePath,
                      ) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            child: Image.asset(
                              imagePath,
                              width: 400,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _categoryFoods[_selectedCategoryIndex].map((
                          food,
                        ) {
                          return _buildFoodCard(food);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_39.png',
              width: 32,
              height: 32,
            ),
            label: 'Ordered',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icon_95.png',
              width: 32,
              height: 32,
            ),
            label: 'Home',
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 88,
        height: 88,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 8,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Image.asset('assets/icons/icon_10.png', fit: BoxFit.contain),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) => const ShoppingCartPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position:
                            Tween(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                )
                                .chain(CurveTween(curve: Curves.easeInOut))
                                .animate(animation),
                        child: child,
                      );
                    },
              ),
            );
          },
        ),
      ),
    );
  }
}
