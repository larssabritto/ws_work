import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/features/auth/auth_module.dart';
import 'package:ws_work/app/features/home/home_view_widget.dart';
import 'package:ws_work/app/store/home.store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void binds(Injector i) {
    i.add(HomeStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => HomeView(state: Modular.get()));
  }
}
