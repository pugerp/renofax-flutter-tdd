import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renofax/core/assets/constantas.dart' as Constants;
import 'package:renofax/features/home/presentation/pages/home_page.dart';
import 'package:renofax/features/login/presentation/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';

class SplashPage extends StatefulWidget {
  static const nameRoute = '/splash_page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        final sp = sl<SharedPreferences>();
        final refresh_key = sp.getString(Constants.SP_REFRESH_KEY);
        final access_key = sp.getString(Constants.SP_REFRESH_KEY);

        if ((refresh_key != null && refresh_key.isNotEmpty) &&
            (access_key != null && access_key.isNotEmpty)) {
          Navigator.pushReplacementNamed(context, HomePage.nameRoute);
        } else {
          Navigator.pushReplacementNamed(context, LoginPage.nameRoute);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2EFF),
      body: SafeArea(
        child: Container(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1 / 5,
              child: SvgPicture.asset('assets/images/ic_renofax_with_text.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
