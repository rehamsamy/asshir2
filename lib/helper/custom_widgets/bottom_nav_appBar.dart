import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavAppBar extends StatelessWidget {
  const BottomNavAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        decoration: BoxDecoration(color: AppTheme.backGroundColor),
        // height: 100,
        child: Center(
          child: Image.asset(
            "assets/icons/auth_logo.png",
            width: MediaQuery.of(context).size.width * .4,
          ),
        ),
      ),
    );
  }
}
