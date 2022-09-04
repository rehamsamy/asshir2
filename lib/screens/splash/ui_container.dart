import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';

class SplashUiContainer extends StatefulWidget {
  const SplashUiContainer({Key? key}) : super(key: key);

  @override
  _SplashUiContainerState createState() => _SplashUiContainerState();
}

class _SplashUiContainerState extends State<SplashUiContainer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _width = MediaQuery.of(context).size.width * 9;

       });
    });
  }

  double _width = 50;
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: context.locale.languageCode == "en"
          ? TextDirection.ltr
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/auth_bg.png",
                  ),
                  fit: BoxFit.fill,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: Hero(
                  tag: "auth_logo",
                  child: AnimatedContainer(
                    // opacity: _opacityValue,
                    width: _width,
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                      "assets/icons/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

 }
