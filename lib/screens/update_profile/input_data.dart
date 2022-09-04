
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

class AuthInputData {
  String? name,
      mobile,
      location,
      cityName,
      cityId,
      email,
      token,
      categoryName,
      categoryId,
      categoryLogo;
  double? lat, long;
  var image;
  File? file;
  bool? isUpdateProfile = false;
  File? drivingLicense;

  List<String>? serviceIds = [];
  List<dynamic>? services;
  List<String>? serviceNames = [];
  List<String>? subCategoryIds = [];
  List<String>? subCategoryNames = [];
  List<String>? subCategoryPrices = [];
  AuthInputData({
    this.name,
    this.cityId,
    this.cityName,
    this.email,
    this.categoryName,
    this.categoryLogo,
    this.categoryId,
    this.mobile,
    this.long,
    this.lat,
    this.file,
    this.location,
    this.token,
    this.isUpdateProfile,
    this.services,
    this.serviceIds,
    this.serviceNames,
    this.subCategoryIds,
    this.subCategoryNames,
    this.subCategoryPrices,
    this.drivingLicense,
  });
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "image": image == null
          ? null
          : image is File
              ? MultipartFile.fromFileSync(image.path,
                  filename: basename(image.path))
              : null,
      "fullname": name,
      "commerical_register": file == null
          ? null
          : MultipartFile.fromFileSync(
              file!.path,
              filename: basename(file!.path),
            ),
      "phone": mobile,
      "lat": lat,
      "lng": long,
      "address": location,
      "city_id": cityId,
      "services": services,
      "driver_license": drivingLicense == null
          ? null
          : MultipartFile.fromFileSync(
              drivingLicense!.path,
              filename: basename(drivingLicense!.path),
            ),
    };
  }

  Map<String, dynamic> updateLocationToJson() {
    return {
      "lat": lat,
      "lng": long,
      "address": location,
    };
  }
}
