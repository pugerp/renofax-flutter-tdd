import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renofax/core/assets/constantas.dart' as Constants;
import 'package:renofax/features/home/presentation/pages/home_page.dart';
import 'package:renofax/features/membership/presentation/pages/login_page.dart';
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
// class SplashPage extends StatelessWidget {
//   static const nameRoute = '/splash_page';
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height / 3,
//               child: SvgPicture.asset('assets/images/ic_renofax_with_text.svg'),
//             ),
//             BlocProvider(
//               create: (_) => sl<UserBloc>(),
//               child: BlocBuilder<UserBloc, UserState>(
//                 builder: (context, state) {
//                   if (state is UserInitial) {
//                     BlocProvider.of<UserBloc>(context).add(fetchUsers());
//                     return Container();
//                   }else if (state is Loading) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (state is Success) {
//                     Navigator.pushReplacementNamed(context, HomePage.nameRoute);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('success fetching users'),
//                       ),
//                     );
//                   } else if (state is Error) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('failed fetching users'),
//                       ),
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//             ),
//           ]
//         ),
//       ),
//     );
//   }
//
//
// }
