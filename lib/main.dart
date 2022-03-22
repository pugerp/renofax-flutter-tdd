import 'package:flutter/material.dart';
import 'package:renofax/core/styles/common_styles.dart';
import 'package:renofax/features/complainant/presentation/pages/complaint_list_page.dart';
import 'package:renofax/features/home/presentation/pages/home_page.dart';
import 'package:renofax/features/splash/presentation/pages/splash_page.dart';
import 'features/complainant/presentation/pages/complaint_detail_page.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'injection_container.dart' as injection;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renofax',
      theme: CommonStyle.themeStyle(context),
      initialRoute: SplashPage.nameRoute,
      // onGenerateRoute: generateRoute,
      routes: {
        SplashPage.nameRoute: (context) => SplashPage(),
        LoginPage.nameRoute: (context) => LoginPage(),
        HomePage.nameRoute: (context) => HomePage(),
        ComplaintListPage.nameRoute: (context) => ComplaintListPage(),
        ComplaintDetailPage.nameRoute: (context) => ComplaintDetailPage(),
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case SplashPage.nameRoute:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case LoginPage.nameRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case HomePage.nameRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case ComplaintListPage.nameRoute:
        return MaterialPageRoute(
          builder: (_) => ComplaintListPage(),
        );
      case ComplaintDetailPage.nameRoute:
        return MaterialPageRoute(
          builder: (_) => ComplaintDetailPage(),
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Error Page'),
          ),
        );
      },
    );
  }
}
