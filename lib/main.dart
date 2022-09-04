import 'package:asshir/helper/core_classes/app_globals.dart';
import 'package:asshir/helper/core_classes/cache_helper.dart';
import 'package:asshir/helper/core_classes/themes.dart';
import 'package:asshir/screens/splash/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'generated/codegen_loader.g.dart';
import 'helper/core_classes/bloc_observer.dart';
import 'helper/core_classes/kiwi.dart';
import 'helper/custom_widgets/un_focus.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  // FirebaseMessaging.instance.getToken().then((value) async {
  //   String? token = value;
  //   print(token);
  //   await CacheHelper.setDeviceToken(token!);
  // });
  // await ServerGate.init();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  initKiwi();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    BlocOverrides.runZoned(
          () {
        runApp(
          EasyLocalization(
            path: 'assets/translations',
            startLocale: const Locale('ar', 'SA'),
            fallbackLocale: const Locale('ar', 'SA'),
            saveLocale: true,
            supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
            assetLoader: const CodegenLoader(),
            child: ScreenUtilInit(
              builder: (context, child) => const MyApp(),
            ),
          ),
        );
      },
      blocObserver: MyBlocObserver(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      navigatorKey: navigator,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.light(),
      builder: (context, child) => UnFocus(
        child: child,
      ),
      themeMode: ThemeMode.light,
      home: const SplashView(),
    );
  }
}

void initServiceLocator() {
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());
}

GetIt getIt = GetIt.instance;
