import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopy/features/wish_list/presentaion/views/wish_list_view.dart';

import '../../../cart/presentaion/views/cart_view.dart';
import '../../../home/presentation/Views/home_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key, required this.email});
  final String email;

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  final List<Widget> views = const [
    HomeView(),
    CartView(),
    WishListView(),
    ProfileView(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 29,
        ),
        unselectedIconTheme:
            IconThemeData(color: Colors.grey.withOpacity(0.7), size: 25),
        // currentIndex: ,
        fixedColor: Colors.white,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'wish'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
