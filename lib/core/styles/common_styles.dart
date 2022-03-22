import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonStyle {
  static InputDecoration textFieldStyle({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(),
    );
  }

  static InputDecoration passwordFieldStyle({
    required String labelText,
    required String hintText,
    required bool obscure,
    required Function() onPress,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: onPress,
      ),
      border: OutlineInputBorder(),
    );
  }

  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: Colors.deepOrange,
      minimumSize: Size.fromHeight(40),
      textStyle: TextStyle(color: Colors.white),
    );
  }

  static ThemeData themeStyle(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
      textTheme: GoogleFonts.titilliumWebTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
