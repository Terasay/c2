import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 1;
  int _selectedCategoryIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: 120,
            color: Colors.white,
            child: Column (
              children: [
                const SizedBox(height: 30),

                _buildCategoryItem(0, 'Main dishes', Image.asset('assets/icons/icon_90.png', width: 24, height: 24)),
                const SizedBox(height: 40),

                _buildCategoryItem(1, 'Pasteries', Image.asset('assets/icons/icon_92.png', width: 24, height: 24)),
                const SizedBox(height: 40),

                _buildCategoryItem(2, 'Soups', Image.asset('assets/icons/icon_91.png', width: 24, height: 24)),
              ],
            ),
          ),

          const VerticalDivider(width: 1, thickness: 1, color: Colors.black12,),

          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(child: Text('Main Content Area')),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
        ],
      ),

    );
  }
}