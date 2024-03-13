import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/features/auth/auth_module.dart';
import 'package:ws_work/app/service/auth_service.dart';
import 'package:ws_work/app/service/sync_service.dart';
import 'package:ws_work/app/store/car.store.dart';

import 'features/home/home_module.dart';
import 'features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(AuthService.new);
    i.add(SyncService.new);
    i.addLazySingleton(CarStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/splash', module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
