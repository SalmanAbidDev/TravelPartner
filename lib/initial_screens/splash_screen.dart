import 'dart:async';
import 'package:booking_application/main_screen/home_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 4), ()
    {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define the animation curve
            const curve = Curves.easeInOut;

            // Slide transition
            final offsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
            );

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        height: height*1,
        width: width*1,
        color: Colors.blueAccent.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*.23),
              child: Image.asset(
                'images/ic_launcher.png',
                //fit: BoxFit.cover,
                width: width * .35,
                height: height * .35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height* .05),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Travel ',
                    style: TextStyle(
                      letterSpacing: .3,
                      color:Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Partner',
                    style: TextStyle(
                      letterSpacing: .3,
                      color:Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
