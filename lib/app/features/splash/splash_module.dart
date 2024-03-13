import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/features/splash/splash_view_widget.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const SplashViewWidget());
  }
}
