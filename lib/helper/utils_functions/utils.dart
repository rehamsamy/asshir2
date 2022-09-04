part of 'UtilsImports.dart';

class Utils {
  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    await launch(url);
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      await launch('$url', forceSafariVC: false);
    } else {
      await launch(url);
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  // static Future<File?> getImage() async {
  //   FilePickerResult? result = await FilePicker.platform
  //       .pickFiles(allowMultiple: false, type: FileType.image);
  //
  //   if (result != null) {
  //     List<File> files = result.paths.map((path) => File("$path")).toList();
  //     return await compressAndGetFile(files.first);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static Future<List<File>> getMultiImages(int count) async {
  //   List<Media>? result = await ImagesPicker.pick(
  //     language: Language.English,
  //     count: count,
  //     pickType: PickType.image,
  //   );
  //   if (result != null) {
  //     List<File> files = [];
  //     for (int i = 0; i < result.length; i++) {
  //       var file = File(result[i].path);
  //       files.add(file);
  //     }
  //     return await compressImages(files);
  //   } else {
  //     return [];
  //   }
  // }

  static Future<File> getImageFileFromAssets(String path) async {
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    return file;
  }


  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text.trim().isEmpty) {
      LoadingDialog.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        LoadingDialog.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    await Geolocator.requestPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LoadingDialog.showSimpleToast('Location services are disabled');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        LoadingDialog.showSimpleToast('Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      LoadingDialog.showSimpleToast(
          'Location permissions are permanently denied, we cannot request permissions');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  static void navigateToMapWithDirection(
      {required String lat,
      required String lng,
      required BuildContext context}) async {
    if (lat.isEmpty) {
      lat = "0";
      lng = "0";
    }
    try {
      final coords = Coords(double.parse(lat), double.parse(lng));
      final title = "Destination";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      LoadingDialog.showSimpleToast("$e");
    }
  }

  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    return first.addressLine;
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }
}
