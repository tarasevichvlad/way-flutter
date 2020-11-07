import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_state.dart';
import 'package:way/utils/constants.dart';
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: Constants.whiteColor,
      body: BlocProvider(
        create: (context) => NavigationBloc(NavigationInitial()),
        child: SafeArea(
            child: BlocListener<NavigationBloc, NavigationState>(
          listener: (BuildContext context, NavigationState state) {
            if (state is NavigationSuccess) {
              int navigationIndex = _findNavigationIndex(state.pathTo);
              navigateToIndexStack(navigationIndex);
            }

            if (state is NavigationMainSuccess) {
              int navigationIndex = _findNavigationIndex(state.pathTo);
              navigateToMainIndexStack(navigationIndex);
            }

            if (state is NavigationToSearchTripSuccess) {
              int navigationIndex = _findNavigationIndex(state.pathTo);
              navigateToIndexStack(navigationIndex);
            }

            if (state is NavigationToBookingTripSuccess) {
              int navigationIndex = _findNavigationIndex(state.pathTo);
              navigateToIndexStack(navigationIndex);
            }
          },
          child: IndexedStack(
            index: _currentIndexPage,
            children: routes,
          ),
        )),
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

  int _findNavigationIndex(String pathTo) {
    return allRoutes.indexWhere((element) => element.key == pathTo);
  }

  void navigateToIndexStack(int navigationIndex) {
    if (navigationIndex != null && navigationIndex != -1) {
      setState(() {
        _currentIndexPage = navigationIndex;
      });
    }
  }

  void navigateToMainIndexStack(int navigationIndex) {
    if (navigationIndex != null && navigationIndex != -1) {
      setState(() {
        this._currentIndexTab = navigationIndex - 1;
        this._currentIndexPage = navigationIndex;
      });
    }
  }
}
