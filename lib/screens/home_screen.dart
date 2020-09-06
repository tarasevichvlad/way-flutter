import 'package:flutter/material.dart';
import '../navigation_bar.dart';
import '../routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int _currentIndexPage = 0;
  int _currentIndexTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndexPage,
          children: routes,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: _currentIndexTab,
        onSelectTab: onPageChanged,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._currentIndexTab = page;
      this._currentIndexPage = page + 1;
    });
  }
}