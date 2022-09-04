import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/visitor.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core_classes/app_theme.dart';

class ServerErrorWidget extends StatelessWidget {
  final int? statusCode;
  final onTap;
  final bool? isHome;
  ServerErrorWidget(this.statusCode, {this.onTap, this.isHome});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (statusCode == 401) {
            visitorDialog(context);
          }
        },
        child: SizedBox(
          // width: MediaQuery.of(context).size.width * (isHome !=null&& isHome==true? .65:  .9),
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset((() {
                if (statusCode == 0) {
                  return "assets/icons/no-connection.png";
                } else if (statusCode == 500) {
                  return "assets/icons/error_500.png";
                } else if (statusCode == 401) {
                  return "assets/icons/error_401.png";
                } else if (statusCode == 404 || statusCode == 403) {
                  return "assets/icons/error_404.png";
                } else {
                  return "assets/icons/no-connection.png";
                }
              }())),
              Text(
                (() {
                  if (statusCode == 0) {
                    return context.locale.languageCode == "en"
                        ? "Please check your internet connection"
                        : "تأكد من الاتصال بالانترنت";
                  } else if (statusCode == 500) {
                    return context.locale.languageCode == "en"
                        ? "Server connection error , please try again later"
                        : "يوجد خطا بالسيرفر الرجاء المحاوله فى وقت لاحق";
                  } else if (statusCode == 401) {
                    return context.locale.languageCode == "en"
                        ? "Please login firstly , press here to go to login page"
                        : "قم بتسجيل الدخول أولا , اضغط هنا لتسجيل الدخول";
                  } else if (statusCode == 404 || statusCode == 403) {
                    return context.locale.languageCode == "en"
                        ? "Page not foundٌ"
                        : "هذه الصفحه غير موجوده";
                  } else {
                    return statusCode.toString();
                  }
                }()),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor,
                  letterSpacing: 2,
                  wordSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              onTap == null
                  ? const SizedBox.shrink()
                  : DottedButton(
                      context.locale.languageCode == "en"
                          ? "Press here to reload"
                          : "اضغط هنا لإعادة التحميل",
                      onTap,)
            ],
          ),
        ),
      ),
    );
  }
}

class TabServerErrorWidget extends StatelessWidget {
  final int? statusCode;
  final onTap;
  TabServerErrorWidget(this.statusCode, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (statusCode == 401) {
            visitorDialog(context);
          }
        },
        child: SizedBox(
          // width: MediaQuery.of(context).size.width * (isHome !=null&& isHome==true? .65:  .9),
          // height: MediaQuery.of(context).size.height * (isHome !=null&& isHome==true? .5:  .9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset((() {
                  if (statusCode == 0) {
                    return "assets/icons/no-connection.png";
                  } else if (statusCode == 500) {
                    return "assets/icons/error_500.png";
                  } else if (statusCode == 401) {
                    return "assets/icons/error_401.png";
                  } else if (statusCode == 404 || statusCode == 403) {
                    return "assets/icons/error_404.png";
                  } else {
                    return "";
                  }
                }())
                    // statusCode == 0
                    // ? "assets/icons/no-connection.png"
                    // : statusCode == 500
                    // ? "assets/icons/error.png"
                    // : "assets/icons/401.png"

                    ),
              ),
              Text(
                (() {
                  if (statusCode == 0) {
                    return context.locale.languageCode == "en"
                        ? "Please check your internet connection"
                        : "تأكد من الاتصال بالانترنت";
                  } else if (statusCode == 500) {
                    return context.locale.languageCode == "en"
                        ? "Server connection error , please try again later"
                        : "يوجد خطا بالسيرفر الرجاء المحاوله فى وقت لاحق";
                  } else if (statusCode == 401) {
                    return context.locale.languageCode == "en"
                        ? "Please login firstly , press here to go to login page"
                        : "قم بتسجيل الدخول أولا , اضغط هنا لتسجيل الدخول";
                  } else if (statusCode == 404 || statusCode == 403) {
                    return context.locale.languageCode == "en"
                        ? "Page not foundٌ"
                        : "هذه الصفحه غير موجوده";
                  } else {
                    return statusCode.toString();
                  }
                }()),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor,
                  letterSpacing: 2,
                  wordSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              onTap == null
                  ? const SizedBox.shrink()
                  : Btn(
                      context.locale.languageCode == "en"
                          ? "Press here to reload"
                          : "اضغط هنا لإعادة التحميل",
                  onTap)
            ],
          ),
        ),
      ),
    );
  }
}

class ServerErrorText extends StatelessWidget {
  final int errorType;
  final int statusCode;

  const ServerErrorText(this.errorType, this.statusCode);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (statusCode == 401) {
            visitorDialog(context);
          }
        },
        child: Text(
          errorType == 0
              ? context.locale.languageCode == "en"
                  ? "Please check your internet connection"
                  : "تأكد من الاتصال بالانترنت"
              : statusCode == 401
                  ? context.locale.languageCode == "en"
                      ? "Please login firstly , press here to go to login page"
                      : "قم بتسجيل الدخول أولا , اضغط هنا لتسجيل الدخول"
                  : context.locale.languageCode == "en"
                      ? "Server connection error , please try again later"
                      : "يوجد خطا بالسيرفر الرجاء المحاوله فى وقت لاحق",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppTheme.primaryColor,
            letterSpacing: 2,
            wordSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Widget smallErrorWidget(BuildContext context, String msg) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * .7,
//      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/icons/error.png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: TextStyle(
                  color: AppTheme.secondaryColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    ),
  );
}
