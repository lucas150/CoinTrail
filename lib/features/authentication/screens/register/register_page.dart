import 'package:cointrail/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../login/widgets/login_blob_cta.dart';
import 'widgets/register_header.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
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
              const RegisterHeader(),

              Expanded(
                child: RegisterForm(
                  emailFocus: _emailFocus,
                  usernameFocus: _usernameFocus,
                  passwordFocus: _passwordFocus,
                  confirmPasswordFocus: _confirmPasswordFocus,
                ),
              ),

              LoginBlobCTA(
                height: size.height * 0.34,
                primaryButtonText: 'Register',
                secondaryText: 'or Login',
                onSecondaryTap: () {
                  Get.toNamed(TRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
