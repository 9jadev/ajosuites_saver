import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../style.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true; 
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  CustomTheme() {
    checkstate();
  }
  void toggleTheme(bool state) {
    _isDarkTheme = !state;
    updatethemestorage(!state);
    notifyListeners();
  }

  updatethemestorage(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("themestate", state);
  }

  checkstate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? themestate =  prefs.getBool("themestate");
    if (themestate == true) {
      _isDarkTheme = themestate!;
      notifyListeners();
    }
    if(themestate == null) {
      _isDarkTheme = false;
      notifyListeners();
    }
    if (themestate == false) {
      _isDarkTheme = themestate!;
      notifyListeners();
    }
    // print('Theme state $themestate');
  }

  static bool get presntstate { 
    // print(_isDarkTheme);
    return _isDarkTheme; 
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      // accentColor: primary,
      backgroundColor: Colors.white,
      // cursorColor: Colors.red,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.blue
      ),
      scaffoldBackgroundColor: primary,
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        elevation: 1
      ),
      // bottomAppBarTheme: const BottomAppBarTheme(
      //   shape: CircularNotchedRectangle(),
        
      // ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 2,
        backgroundColor: Colors.grey.shade400.withOpacity(0.3),
        selectedItemColor: primary,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600
        ),
        
        // showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade500,
          size: 30,
          shadows: [
            Shadow(
              color: Colors.grey.shade300,
              blurRadius: 1.2
            )
          ]
        ),
        selectedIconTheme: IconThemeData(
          color: primary,
          size: 30,
          shadows: [
            Shadow(
              color: Colors.grey.shade300,
              blurRadius: 1.2
            )
          ]
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
        fillColor: inputColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: HexColor("#E3E3E7"),
            width: 1,
            style: BorderStyle.solid
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: HexColor("#30475E"),
            width: 0.8,
            style: BorderStyle.solid
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: HexColor("#E3E3E7"),
            width: 1,
            style: BorderStyle.solid
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: error,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: error,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none
        ),
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.blue
      ),
      
      backgroundColor: Colors.grey,
      unselectedWidgetColor:  const Color.fromRGBO(112, 112, 112, 1),
      scaffoldBackgroundColor: HexColor('#131B39'),
      textTheme: GoogleFonts.livvicTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        shape: const CircularNotchedRectangle(),
        color: HexColor('#303753')
      ),
    );
  }
}