import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

Widget searchIcon(dynamic onTap) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(
      Icons.search,
      color: AppTheme.appBarTextColor,
      size: 25,
    ),
  );
}

Widget editIcon(dynamic onTap) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(
      Icons.edit,
      color: AppTheme.appBarTextColor,
      size: 25,
    ),
  );
}

Widget floatingActionContainer(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Center(
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    ),
  );
}

Widget bottomNavAddIcon(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      decoration:
          BoxDecoration(color: AppTheme.primaryColor, shape: BoxShape.circle),
      child: Center(
        child: Image.asset(
          "assets/icons/add.png",
          width: 18,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget removeIcon(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Center(
          child: Icon(
            Icons.remove,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    ),
  );
}

Widget shareIcon(String link) {
  return GestureDetector(
      onTap: () {
        Share.share(link);
      },
      child: const Icon(
        Icons.share,
        color: Colors.white,
      ));
}

Widget chatAppBarIcon(dynamic onTap) {
  return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.share,
        color: Colors.white,
      ));
}

Widget notificationsIcon(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "notification_a.png",
        width: 20,
        height: 20,
      ),
    ),
  );
}

Widget appBarSearchIcon(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        "assets/icons/search.png",
        width: 35,
        height: 35,
      ),
    ),
  );
}

Widget appBarDeleteIcon(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        "assets/icons/delete.png",
        width: 35,
        height: 35,
      ),
    ),
  );
}
