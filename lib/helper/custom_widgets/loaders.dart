import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

Widget authLoader() {
  return Center(
    child: SpinKitThreeInOut(
      size: 30,
      color: AppTheme.primaryColor,
    ),
  );
}

Widget loader() {
  return Center(
    child: Lottie.asset('assets/icons/loader_lottie.json', width: 70),
  );
}

// Widget loader() {
//   return Center(
//     child: SpinKitFadingFour(
//       size: 50,
//       color: AppTheme.primaryColor,
//     ),
//   );
// }

Widget dropDownLoader() {
  return Center(
    child: SpinKitThreeInOut(
      size: 30,
      color: AppTheme.primaryColor,
    ),
  );
}

Widget btnLoader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: Material(
      elevation: .1,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        // width: percent == null
        //     ? MediaQuery.of(context).size.width * .65
        //     : MediaQuery.of(context).size.width * percent!,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: SpinKitFadingCircle(
          size: 30,
          color: AppTheme.primaryColor,
        )),
      ),
    ),
  );
}

Widget smallLoader() {
  return Center(
    child: SpinKitFadingFour(
      size: 40,
      color: AppTheme.primaryColor,
    ),
  );
}

// Widget dropDownLoader() {
//   return SpinKitThreeInOut(
//     size: 30,
//     color: Colors.white,
//   );
// }
//
// Widget authDropDownLoader() {
//   return SpinKitThreeInOut(
//     size: 30,
//     color: Colors.white,
//   );
// }

Widget loaderWithAppbar(String title, bool isAvailableLeading) {
  return Column(
    children: [
      // MainAppBar(title, isAvailableLeading),
      Center(
        child: Container(
          // height: 800.h-200,
          child: SpinKitCubeGrid(
            size: 40,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      SizedBox()
    ],
  );
}

Widget dialogLoader() {
  return Center(
    child: SpinKitThreeInOut(
      size: 30,
      color: AppTheme.primaryColor,
    ),
  );
}

Widget minyLoader() {
  return Center(
    child: SpinKitThreeInOut(
      size: 10,
      color: AppTheme.primaryColor,
    ),
  );
}

class HomeCategoriesLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: AppTheme.primaryColor,
      size: 30,
    );
  }
}
