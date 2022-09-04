import 'dart:async';
import 'dart:io';

import 'package:asshir/helper/core_classes/cache_helper.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/network_dialog.dart';
import 'package:asshir/screens/auth/app_init/bloc.dart';
import 'package:asshir/screens/auth/app_init/events.dart';
import 'package:asshir/screens/auth/app_init/states.dart';
import 'package:asshir/screens/auth/login/view.dart';
import 'package:asshir/screens/home/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'ui_container.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _bloc = KiwiContainer().resolve<AppInitBloc>();

  void goToHomePage() async {
    // await GlobalNotification().setUpFirebase();

    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Timer(
            const Duration(
              seconds: 2,
            ), () {
          CacheHelper.setUserType("client");

          CacheHelper.setUserToken(
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGF1bmRyaWVzLmtobG9kLmFhaXQtZC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTMyOTUzNjEsImV4cCI6MTY4NDgzMTM2MSwibmJmIjoxNjUzMjk1MzYxLCJqdGkiOiI1WEhVeTBmdWhhTFZSQ3hhIiwic3ViIjoxMDcsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.teI7ZLfu1xhPwkuFSzVqwtVO0SWGMDFAAO9hqojpk_U");
          _bloc.add(InitialAppEventStart());
        });
      }
    } on SocketException catch (_) {
      showNetworkErrorDialog(context, () {
        pushBack();
        goToHomePage();
      });
    }
  }

  @override
  void initState() {
    goToHomePage();

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is InitialAppStateNotAuthenticated) {
          pushAndRemoveUntil(const LoginView());
        } else if (state is InitialAppStateAuthenticatedAsClient) {
          pushAndRemoveUntil(const HomeView(
            userType: "client",
          ));
        } else if (state is InitialAppStateAuthenticatedAsProvider) {
          pushAndRemoveUntil(const HomeView(
            userType: "provider",
          ));
        } else if (state is InitialAppStateAuthenticatedAsDriver) {
          pushAndRemoveUntil(const HomeView(
            userType: "driver",
          ));
        }
      },
      builder: (context, state) {
        return const SplashUiContainer();
      },
    );
  }
}
