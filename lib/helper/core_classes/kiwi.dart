
import 'package:asshir/screens/auth/app_init/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => AppInitBloc());
}
