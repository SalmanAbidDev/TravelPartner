import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavedSection extends StatefulWidget {
  const SavedSection({super.key});

  @override
  State<SavedSection> createState() => _SavedSectionState();
}

class _SavedSectionState extends State<SavedSection> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
            'Saved',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FaIcon(FontAwesomeIcons.solidCircleQuestion,color: Colors.white,size: 27),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 24,),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width*.01,top: height*.06),
            child: SizedBox(
              height: height*.25,
                width: width*.7,
                child: Image.asset('images/save.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height*.04),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Save what you like for later',
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
                        'Create lists of your favorite properties to help',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'you share, compare and book.',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: height*.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(13),
                        ),
                        child: const Text(
                            'Start your search',
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
                Padding(
                  padding: EdgeInsets.only(top: height*.02),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create a list',
                        style: TextStyle(
                            color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
