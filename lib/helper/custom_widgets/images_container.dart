import 'dart:io';

import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core_classes/app_theme.dart';
import 'gallery_preview.dart';

Widget imagesContainer(
  Function onDelete,
  dynamic image,
) {
  return image == null || image == ""
      ? SizedBox.shrink()
      : Stack(
          children: [
            InkWell(
              onTap: () {
                print("-=--==--image is ${image.toString()}");
                push(GalleryPreviewPage([image]));
              },
              child: Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 1.5,
                    ),
                    image: image is File
                        ? DecorationImage(
                            image: FileImage(image), fit: BoxFit.fill)
                        : DecorationImage(
                            image: CachedNetworkImageProvider(image),
                            fit: BoxFit.fill)),
              ),
            ),
            Positioned(top: 0, left: 2, child: deleteImageWidget(onDelete)),
          ],
        );
}

Widget deleteImageWidget(dynamic onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    ),
  );
}

class ProfileContainer extends StatelessWidget {
  final dynamic onTap;
  final img;
  ProfileContainer(this.img, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: img == null
              ? SizedBox.shrink()
              : Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA1A0A0),
                  border: Border.all(color: Color(0xffA1A0A0), width: .1),
                  image: img is File
                      ? DecorationImage(
                          image: FileImage(img), fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.cover),
                  // DecorationImage(
                  //     image: (() {
                  //       if (img == null) {
                  //         return AppTheme.assetImageAr;
                  //       } else if (img is File) {
                  //         return AppTheme.assetImageAr;
                  //       } else {
                  //         return AppTheme.assetImageAr;
                  //       }
                  //     }()),
                  //
                  //     fit: BoxFit.fill),
                ),
                child: Center(
                    child: Icon(
                  Icons.camera_alt,
                  size: 20,
                )
                    // Image.asset(
                    //   "assets/icons/camera.png",
                    //   width: 31 ,
                    //   height: 27  ,
                    // ),
                    ),
              ),
        ),
      ),
    );
  }
}

class UploadImagesBtn extends StatelessWidget {
  final Function() onTap;
  UploadImagesBtn(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: AppTheme.primaryColor,
            width: 1,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(Icons.add,size: 20,),
            Icon(
              Icons.camera_alt,
              size: 30,
              color: AppTheme.primaryColor,
            ),

            Text(
              context.locale.languageCode == "en" ? "Add images" : "إضافة صور",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor),
            )
          ],
        )),
      ),
    );
  }
}
//Widget selectImagesStaticContainer(BuildContext context, Function onTap) {
//  return Column(
//    children: [
//
//      Padding(
//        padding: const EdgeInsets.only(bottom: 40),
//        child: GestureDetector (
//          onTap: onTap,
//          child: Center(
//              child: Icon(
//                Icons.camera_alt,
//                size: 30,
//              )),
//        ),
//      ),
//    ],
//  );
//}
//
//Widget selectVideosStaticContainer(BuildContext context, Function onTap) {
//  return Column(
//    children: [
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Align(
//            alignment: context.locale.languageCode == "en"
//                ? Alignment.centerLeft
//                : Alignment.centerRight,
//            child: Text(LocaleKeys.Auctions_YouCanAddVideo).tr()),
//      ),
//      Padding(
//        padding: const EdgeInsets.only(bottom: 40),
//        child: GestureDetector (
//          onTap: onTap,
//          child: Center(
//              child: Icon(
//                Icons.video_collection_rounded,
//                size: 30,
//              )),
//        ),
//      ),
//    ],
//  );
//}

const double _radius = 12;
