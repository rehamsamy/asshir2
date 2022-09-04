import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/custom_widgets/loaders.dart';
import 'package:flutter/material.dart';

Widget profilePicContainer(BuildContext context, String? img, String? name,
    String mobile, dynamic onProfilePicTapped, bool loading) {
  return Container(
    width: MediaQuery.of(context).size.width,
//    height: 250,
    decoration: BoxDecoration(
        color: AppTheme.filledColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: loading
          ? loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: onProfilePicTapped,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(img!), fit: BoxFit.cover),
                      // borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Text(
                  name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.mainTextColor,
                    fontSize: 17,
                    fontFamily: Family.bold,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  mobile,
                  style: TextStyle(
                    color: AppTheme.secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 6,
                )
              ],
            ),
    ),
  );
}
