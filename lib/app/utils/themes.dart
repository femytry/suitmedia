import 'package:flutter/material.dart';
import 'package:suitmedia/app/utils/colors.dart';

class Themes {
  static final myThemes = ThemeData.light().copyWith(
    backgroundColor: COLORS.LIGHT_BG,
    primaryColor: COLORS.PRIMARY,
    primaryColorDark: COLORS.PRIMARY_DARK,
    primaryColorLight: COLORS.PRIMARY_LIGHT,
    accentColor: COLORS.ACCENT,
    buttonTheme: ThemeData().buttonTheme.copyWith(
        buttonColor: COLORS.PRIMARY,
        focusColor: COLORS.PRIMARY_DARK,
        shape: RoundedRectangleBorder()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((value) {
          if (value.contains(MaterialState.pressed)) {
            return COLORS.PRIMARY_DARK;
          } else {
            return COLORS.PRIMARY;
          }
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    ),
    appBarTheme: ThemeData().appBarTheme.copyWith(
        backgroundColor: COLORS.PRIMARY,
        iconTheme: IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: COLORS.FORM_BG,
      hoverColor: COLORS.FORM_BG,
      focusColor: COLORS.FORM_BG,
      filled: true,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: COLORS.FORM_BG)),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: COLORS.FORM_BG)),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: COLORS.FORM_BG)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: COLORS.FORM_BG)),
      focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: COLORS.FORM_BG)),
    ),
  );
}
