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
                const SizedBox(height: 60),

                _buildCategoryItem(0, 'Main dishes', Image.asset('assets/icons/icon_90.png', width: 60, height: 60)),
                const SizedBox(height: 90),

                _buildCategoryItem(1, 'Pasteries', Image.asset('assets/icons/icon_92.png', width: 60, height: 60)),
                const SizedBox(height: 90),

                _buildCategoryItem(2, 'Soups', Image.asset('assets/icons/icon_91.png', width: 60, height: 60)),
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
        selectedLabelStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon_39.png', width: 32, height: 32),
            label: 'Ordered',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon_95.png', width: 32, height: 32),
            label: 'Home',
          ),
        ],
      ),

    );
  }
}