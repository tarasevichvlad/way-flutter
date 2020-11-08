import 'package:flutter/material.dart';
import 'package:way/utils/constants.dart';
import 'navigation_icons.dart';
import 'routes.dart';

Map<String, BarItem> tabInfo = {
  TabNavigatorRoutes.booking:
      BarItem(text: 'Ваши бронирования', iconData: NavigationIcons.map_signs),
  TabNavigatorRoutes.search:
      BarItem(text: 'Поиск', iconData: NavigationIcons.search),
  TabNavigatorRoutes.createTrip: BarItem(
      text: 'Создание поездки', iconData: NavigationIcons.add_circle_outline),
  TabNavigatorRoutes.myMessage:
      BarItem(text: 'Ваши сообщения', iconData: NavigationIcons.message),
  TabNavigatorRoutes.myAccount:
      BarItem(text: 'Мой аккаунт', iconData: NavigationIcons.user),
};

class BarItem {
  final String text;
  final IconData iconData;
  BarItem({this.text, this.iconData});
}

class NavigationBar extends StatelessWidget {
  NavigationBar({this.currentIndex, this.onSelectTab});
  final int currentIndex;
  final ValueChanged<int> onSelectTab;
  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: (value) {
        onSelectTab(value);
      },
      items: tabInfo.values
          .toList()
          .map((item) => _buildItem(barItem: item))
          .toList(),
      backgroundColor: Constants.baseColor,
    );
  }

  BottomNavigationBarItem _buildItem({BarItem barItem}) {
    return BottomNavigationBarItem(
        icon: Icon(barItem.iconData), title: Text(barItem.text));
  }
}
