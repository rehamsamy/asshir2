import 'package:asshir/generated/locale_keys.g.dart';
import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/prefs.dart';
import 'package:asshir/helper/custom_widgets/visitor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';


class PublicButton extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final double? height;
  final Color? color;


  PublicButton({required this.txt, required this.onTap,required this.height,required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: height,
        decoration: BoxDecoration(
            color: color,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
              topRight:Radius.circular(5),
          bottomLeft:Radius.circular(5),
          bottomRight: Radius.circular(5),)
        ),
        child: Center(
          child: Text(txt??'',style: TextStyle(
            color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700
          ),

          ),
        ),
      ),
    );
  }
}


class TextBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final double? percent;
  final double? height;
  final hexa;

  const TextBtn(this.txt, this.onTap, {this.percent, this.hexa, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: percent == null
            ? MediaQuery.of(context).size.width * .65
            : MediaQuery.of(context).size.width * percent!,
        height: height == null ? 55 : height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            txt!,
            style: TextStyle(
                color: Color(hexa != null ? hexa! : 0xff494949),
                fontSize: 20,
                fontFamily: Family.semiBold,
                fontWeight: FontWeight.w800),
          ).tr(),
        ),
      ),
    );
  }
}

Widget cancelBtn({BuildContext? context, String? txt, dynamic onTap}) {
  return Material(
    elevation: 3,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffB22C2C),
        ),
        width: MediaQuery.of(context!).size.width * .4,
        height: 50,
        child: Center(
          child: Text(
            txt!,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: AppTheme.boldFont),
          ),
        ),
      ),
    ),
  );
}

// class Btn extends StatelessWidget {
//   final String txt;
//   final dynamic  onTap;
//   Btn(this.txt!, this.onTap);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
//       child: Hero(
//         tag: "Btn",
//         child: GestureDetector (
//           onTap: onTap,
//           child: Material(
//             elevation: 1,
//             borderRadius: BorderRadius.circular(_radius!),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 55,
//               decoration: BoxDecoration(
//                 color: AppTheme.primaryColor,
//                 borderRadius: BorderRadius.circular(_radius!),
//               ),
//               child: Center(
//                 child: Text(
//                   txt!,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13,
//                       fontWeight: FontWeight.w800),
//                 ).tr(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CancelBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  const CancelBtn(this.txt, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
      child: Hero(
        tag: "Btn",
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(_radius!),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                color: Color(0xffE50019),
                borderRadius: BorderRadius.circular(_radius!),
              ),
              child: Center(
                child: Text(
                  txt!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ).tr(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final double? percent;
  final double? height;
  final double? fontSize;
  const MainBtn(this.txt, this.onTap,
      {this.percent, this.height, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: .2,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: percent == null
              ? MediaQuery.of(context).size.width * .65
              : MediaQuery.of(context).size.width * percent!,
          height: height == null ? 55 : height,
          decoration: BoxDecoration(
            color: Color(0xffFE7271),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              txt!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize ?? 20,
                  fontFamily: Family.semiBold,
                  fontWeight: FontWeight.w700),
            ).tr(),
          ),
        ),
      ),
    );
  }
}

/// yellow

class Btn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final double? percent;
  final Color?color;
  const Btn(this.txt, this.onTap, { this.percent,this.color,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Hero(
        tag: "main_button",
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: .3,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              // width: percent == null
              //     ? MediaQuery.of(context).size.width * .65
              //     : MediaQuery.of(context).size.width * percent!,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                //AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  txt!,
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ).tr(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccentBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final double? percent;
  const AccentBtn(this.txt, this.onTap, {this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Hero(
        tag: "accent_button",
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: .3,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              // width: percent == null
              //     ? MediaQuery.of(context).size.width * .65
              //     : MediaQuery.of(context).size.width * percent!,
              height: 55,
              decoration: BoxDecoration(
                color: Color(0xffA27E20),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  txt!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ).tr(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguagesBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  final bool? isWhite;
  const LanguagesBtn(
    this.txt,
    this.onTap,
    this.isWhite, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(
                color: isWhite! ? Colors.white : AppTheme.accentColor),
            // color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              txt!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800),
            ).tr(),
          ),
        ),
      ),
    );
  }
}

class ContactUsBtn extends StatelessWidget {
  final dynamic onTap;
  const ContactUsBtn(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(_radius!),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: BoxDecoration(
              color: Color(0xff2BB200),
              borderRadius: BorderRadius.circular(_radius!),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    context.locale.languageCode == "en"
                        ? "Contact with us via WhatsApp"
                        : "تواصل معنا عبر الواتساب",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800),
                  ).tr(),
                  Image.asset(
                    "assets/icons/whatsApp.png",
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RequestProviderBtn extends StatelessWidget {
  final dynamic onTap;
  final bool? isHome;
  const RequestProviderBtn(this.onTap, this.isHome);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          Prefs.getStringF("token").then((value) {
            if (value == null || value == "") {
              visitorDialog(context);
            } else {
              // Get.to(RequestProviderView());
            }
          });
        },
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: isHome! ? AppTheme.primaryColor : Color(0xffA13A1B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  const Text(
                    "اطلب فنى",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ).tr(),
                  Image.asset(
                    "assets/icons/shape1.png",
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget borderBtn(BuildContext context, String txt, onTap, bool isWhite) {
  return Padding(
    padding: const EdgeInsets.only(
      right: 20,
      left: 20,
      top: 20,
    ),
    child: Hero(
      tag: "borderBtn$isWhite",
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                color:
                    // isWhite ? Colors.white :
                    AppTheme.accentColor,
                width: 1),
            borderRadius: BorderRadius.circular(_radius!),
          ),
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ).tr(),
          ),
        ),
      ),
    ),
  );
}

Widget authBorderBtn(
  BuildContext context,
  String txt,
  onTap,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppTheme.accentColor, width: 1),
          borderRadius: BorderRadius.circular(_radius!),
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 16,
                fontFamily: Family.bold,
                fontWeight: FontWeight.w900),
          ).tr(),
        ),
      ),
    ),
  );
}

class AuthBtn extends StatelessWidget {
  final String? txt;
  final dynamic onTap;
  const AuthBtn(this.txt, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.all(Radius.circular(_radius!)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(_radius!)),
            ),
            child: Center(
              child: Text(
                txt!,
                style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w900),
              ).tr(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget deleteBtn(
  BuildContext context,
  dynamic onTap,
) {
  return TextButton(
      onPressed: onTap, child: Text(lang.tr(LocaleKeys.BottomNavigation_Yes)));
}

Widget acceptBtn(
  BuildContext context,
  String? txt,
  dynamic onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: 55,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   // Where the linear gradient begins and ends
          //   begin: Alignment.centerRight,
          //   end: Alignment.centerLeft,
          //   // Add one stop for each color. Stops should increase from 0 to 1
          //   stops: [0.01, 0.9],
          //   colors: [
          //     // Colors are easy thanks to Flutter's Colors class.
          //
          //     Color(
          //       0xff5E3F97"),
          //     ),
          //     Color(
          //       0xff5F3F98"),
          //     ),
          //   ],
          // ),
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            txt!,
            style: TextStyle(
                color: AppTheme.accentColor,
                fontSize: 13,
                fontWeight: FontWeight.w800),
          ).tr(),
        ),
      ),
    ),
  );
}

Widget followPurchasingBtn(
  BuildContext context,
  dynamic onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Material(
      elevation: .3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.secondaryColor, width: .7)),
        child: Center(
          child: Text(
            LocaleKeys.Cart_FollowPurchasing,
            style: TextStyle(
                color: AppTheme.secondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w800),
          ).tr(),
        ),
      ),
    ),
  );
}

class DottedButton extends StatelessWidget {
  final String? text;
  final dynamic onTap;
  const DottedButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: DottedBorder(
            color: AppTheme.primaryColor,
            borderType: BorderType.RRect,
            dashPattern: [6, 6, 6, 6],
            radius: const Radius.circular(12),
            strokeWidth: 3,
            strokeCap: StrokeCap.round,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  text!,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.boldFont,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.primaryColor,
                  ),
                ).tr(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget addAddressContainer(BuildContext context, dynamic onTap) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        color: AppTheme.primaryColor,
        dashPattern: [6, 6],
        radius: const Radius.circular(20),
        strokeWidth: 3,
        strokeCap: StrokeCap.round,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              LocaleKeys.Addresses_AddAddress,
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppTheme.boldFont,
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryColor,
              ),
            ).tr(),
          ),
        ),
      ),
    ),
  );
}

Widget remainingTimeContainer(BuildContext context, String? txt) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: DottedBorder(
      color: AppTheme.primaryColor,
      dashPattern: [6, 6],
      radius: const Radius.circular(20),
      strokeWidth: 3,
      strokeCap: StrokeCap.round,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              context.locale.languageCode == "en" ? "Far away" : "يبعد عنك",
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppTheme.boldFont,
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryColor,
              ),
            ),
            Text(
              "$txt ${context.locale.languageCode == "en" ? "Km" : "كم"}",
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppTheme.boldFont,
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget totalBtn(BuildContext context, String? price) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
    child: Material(
      elevation: .5,
      borderRadius: BorderRadius.circular(12),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   // Where the linear gradient begins and ends
            //   begin: Alignment.centerRight,
            //   end: Alignment.centerLeft,
            //   // Add one stop for each color. Stops should increase from 0 to 1
            //   stops: [0.01, 0.9],
            //   colors: [
            //     // Colors are easy thanks to Flutter's Colors class.
            //
            //     Color(
            //       0xff5E3F97"),
            //     ),
            //     Color(
            //       0xff5F3F98"),
            //     ),
            //   ],
            // ),
            color: Color(0xffF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.Cart_Total,
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w900),
                ).tr(),
                Text(
                  "$price ${context.locale.languageCode == "en" ? "Sar" : "رس"}",
                  style: TextStyle(
                      color: AppTheme.priceColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14),
                ),
              ],
            ),
          )),
    ),
  );
}

Widget subCategoryItem(
    BuildContext context, String? txt, dynamic onTap, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: !isSelected ? Color(0xffF6EBF1) : AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Text(
              txt!,
              style: TextStyle(
                  color: !isSelected ? AppTheme.mainTextColor : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ).tr(),
          ),
        ),
      ),
    ),
  );
}

Widget categoryItem(
    BuildContext context, String? txt, dynamic onTap, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  txt!,
                  style: TextStyle(
                      color:
//                      !isSelected
//                          ? AppTheme.secondaryColor
//                          :
                          AppTheme.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ).tr(),
                Container(
                  height: 1,
                  width: 50,
                  color:
                      isSelected ? AppTheme.primaryColor : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget auctionsBtn(String? txt, dynamic onTap, Color color) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      height: 40.0,
      decoration: new BoxDecoration(
        color: color,
        // border: new Border.all(
        //     color: color, width: 2.0),
        borderRadius: new BorderRadius.circular(50.0),
      ),
      child: new Center(
        child: Text(
          txt!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ).tr(),
      ),
    ),
  );
}

const double? _radius = 12;
