import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/app_module.dart';

import 'auth_view_widget.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [AppModule()];
  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => AuthViewWidget(state: Modular.get()));
  }
}
