import 'package:booking_application/signin_screen/signin_section.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        leading: IconButton(
            icon: const Icon(Icons.close,color: Colors.white,weight: 25,size: 28,),
          onPressed: (){
            Navigator.of(context).pop(_createRoute());
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(left: width* .01),
          child: Row(
            children: [
              const Text(
                  'Travel',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .01),
                child: Text(
                    'Partner',
                  style: TextStyle(
                    color: Colors.cyanAccent.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: height*1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height*.03),
                child: const Text(
                    'Sign in for easier access to your trip details',
                  style: TextStyle(
                    letterSpacing: .2,
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*.06),
                child: ElevatedButton(
                    onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: Colors.black,
                        width: .5,
                      ),
                    ),
                    fixedSize: Size(width, height*.08)
                  ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/google.png',width: 20,height: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: width*.03),
                          child: const Text(
                              'Continue with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*.02),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: Colors.black,
                          width: .5,
                        ),
                      ),
                      fixedSize: Size(width, height*.08)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/facebook.png',width: 20,height: 20,),
                      Padding(
                        padding: EdgeInsets.only(left: width*.03),
                        child: const Text(
                          'Continue with Facebook',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*.02),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue.shade500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      fixedSize: Size(width, height*.08)
                  ),
                  child: const Text(
                    'Continue with email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*.25,),
              const Text(
                'By signing in or creating an account, you agree with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: .2,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'our',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: .2,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .01),
                    child: const Text(
                      'Terms & Conditions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: .2,
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .01,right: width * .01),
                    child: const Text(
                      'and',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: .2,
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .01),
                    child: const Text(
                      'Privacy Statement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: .2,
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height*.015),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2024-2024 TravelPartner',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: .2,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignInSection(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 0.0);
      const end = Offset(-1.0, 0.0);
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
