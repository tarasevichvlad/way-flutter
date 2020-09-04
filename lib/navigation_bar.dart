import 'package:flutter/material.dart';
import 'navigation_icons.dart';
import './routes.dart';

class NavigationBar extends StatelessWidget {
  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        Navigator.pushNamed(context, routePath[value]);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              NavigationIcons.map_signs,
              color: Colors.white,
            ),
            title: Text('Ваши бронирования')),
        BottomNavigationBarItem(
            icon: Icon(NavigationIcons.search, color: Colors.white),
            title: Text('Поиск')),
        BottomNavigationBarItem(
            icon: Icon(NavigationIcons.add_circle_outline, color: Colors.white),
            title: Text('Создание поездки')),
        BottomNavigationBarItem(
            icon: Icon(NavigationIcons.message, color: Colors.white),
            title: Text('Ваши сообщения')),
        BottomNavigationBarItem(
            icon: Icon(NavigationIcons.user, color: Colors.white),
            title: Text('Мой аккаунт'))
      ],
      backgroundColor: Color.fromRGBO(18, 97, 106, 1),
    );
  }
}
