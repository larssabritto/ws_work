import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ws_work/app/core/ui/widgets/app_logo/app_logo_widget.dart';
import 'package:ws_work/app/features/auth/widgets/cpd_widget.dart';
import 'package:ws_work/app/features/auth/widgets/password_widget.dart';
import 'package:ws_work/app/features/auth/widgets/singin_button.dart';
import 'package:ws_work/app/store/car.store.dart';

class AuthViewWidget extends StatelessWidget {
  const AuthViewWidget({super.key, required this.state});

  final CarStore state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReactiveForm(
      formGroup: state.formGroup,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 100),
              child: AppLogo(),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ReactiveForm(
                  formGroup: state.formGroup,
                  child: Column(children: [
                    const CpfWidget(),
                    const SizedBox(height: 20),
                    const PasswordWidget(),
                    const SizedBox(height: 30),
                    SingInButton(
                      state: state,
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
