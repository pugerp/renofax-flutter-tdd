import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renofax/core/styles/common_styles.dart';
import 'package:renofax/features/login/presentation/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/assets/constantas.dart' as Constants;
import '../../../../core/assets/app_theme.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static const nameRoute = '/login_page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2E2EFF),
        body: BlocInit(),
      ),
    );
  }
}

class BlocInit extends StatelessWidget {
  const BlocInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is Initial) {
            // do action initial
          } else if (state is Loading) {
            //show loading screen
          } else if (state is Success) {
            final refresh = state.resp.refresh;
            final access = state.resp.access;
            final obtain = state.resp.obtain;

            sl<SharedPreferences>()
              ..setString(Constants.SP_REFRESH_KEY, refresh)
              ..setString(Constants.SP_ACCESS_KEY, access)
              ..setString(Constants.SP_OBTAIN_KEY, obtain);

            Navigator.pushReplacementNamed(context, HomePage.nameRoute);
          } else if (state is Error) {
            //show toast failed login
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1 / 3,
                    child: SvgPicture.asset(
                      'assets/images/ic_renofax_with_text.svg',
                    ),
                  ),
                ),
              ),
            ),
            FormLogin(),
          ],
        ),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _controlUsername = TextEditingController();
  final _controlPassword = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(16),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _controlUsername,
                keyboardType: TextInputType.name,
                decoration: CommonStyle.textFieldStyle(
                  labelText: 'Username',
                  hintText: '',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: _isObscure,
                controller: _controlPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: CommonStyle.elevatedButtonStyle(),
                onPressed: () {
                  final username = _controlUsername.value.text;
                  final password = _controlPassword.value.text;

                  if (username.isNotEmpty && password.isNotEmpty) {
                    BlocProvider.of<LoginBloc>(context).add(
                      GetToken(
                        username: username,
                        password: password,
                      ),
                    );
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
