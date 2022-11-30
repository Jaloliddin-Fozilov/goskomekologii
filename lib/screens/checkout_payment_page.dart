import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/checkout_animals.dart';
import 'package:goskomekologii/screens/checkout_edit.dart';
import 'package:goskomekologii/screens/checkout_payment.dart';

import '../services/contants.dart';
import '../widgets/header_actions.dart';
import '../widgets/menu_drawer.dart';
import 'friends.dart';
import 'home.dart';
import 'permessions_page.dart';
import 'permission_detail.dart';
import 'profile_edit.dart';

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  int index = 4;
  int _currentIndex = 1;

  void backButton() {
    index = 1;
  }

  @override
  Widget build(BuildContext context) {
    List _pages = [
      const Home(),
      const PermessionsPage(),
      const FriendsScreen(),
      const ProfileEdit(),
      CheckoutPayment(),
    ];

    return Scaffold(
      backgroundColor: BACKGROUNDCOLOR,
      appBar: AppBar(
        backgroundColor: APPBARCOLOR,
        toolbarHeight: 84,
        actions: const [HeaderActions()],
      ),
      drawer: const MainDrawer(),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Главая'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox_outlined), label: 'Разрешения'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Друзья'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
            index = selectedIndex;
          });
        },
      ),
    );
  }
}
