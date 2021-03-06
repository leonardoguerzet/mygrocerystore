import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/custom_colors.dart';
import 'package:my_grocery_store/src/pages/auth/sign_in_screen.dart';
import 'package:my_grocery_store/src/pages/common_widgets/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return SignInScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.customSwatchColor,
                CustomColors.customSwatchColor.shade700,
              ]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppNameWidget(
              greenTileColor: Colors.white,
              textSize: 30,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
