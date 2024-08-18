import 'package:flutter/material.dart';

import '../signin_screen/sign_in_screen.dart';

class ActiveScreenContent extends StatefulWidget {
  const ActiveScreenContent({super.key});

  @override
  State<ActiveScreenContent> createState() => _ActiveScreenContentState();
}

class _ActiveScreenContentState extends State<ActiveScreenContent> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width*.01,top: height*.06),
              child: SizedBox(
                height: height*.25,
                width: width*.7,
                child: Image.asset('images/globe.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*.04),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No bookings yet',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*.02,left: width*.03,right: width*.03),
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in or create an account to get started.',
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
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
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: const BorderSide(color: Colors.blue, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(13),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
