import 'package:asshir/helper/core_classes/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'states.dart';

class AppInitBloc extends Bloc<InitialAppEvents, InitialAppStates> {
  AppInitBloc() : super(InitialAppStateNotAuthenticated()) {
    on<InitialAppEventStart>(_getUserType);
  }

  void _getUserType(
    InitialAppEventStart event,
    Emitter<InitialAppStates> emit,
  ) async {
     String? _userType = CacheHelper.getUserType();
    print("-=-=-=-=-=-= user type is $_userType");
    if (_userType == null || _userType == "") {
      emit(InitialAppStateNotAuthenticated());
    } else if (_userType == "client") {
      emit(InitialAppStateAuthenticatedAsClient());
    } else if (_userType == "provider") {
      emit(InitialAppStateAuthenticatedAsProvider());
    } else if (_userType == "driver") {
      emit(InitialAppStateAuthenticatedAsDriver());
    }
  }
}
