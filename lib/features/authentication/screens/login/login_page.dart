import 'package:cointrail/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/login_blob_cta.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.primary,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const LoginHeader(),

              Expanded(
                child: LoginForm(
                  emailFocus: _emailFocus,
                  usernameFocus: _usernameFocus,
                  passwordFocus: _passwordFocus,
                ),
              ),

              LoginBlobCTA(
                height: size.height * 0.34,
                primaryButtonText: 'Login',
                secondaryText: 'or Register',
                onSecondaryTap: () {
                  Get.toNamed(TRoutes.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
