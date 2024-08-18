import 'package:booking_application/search_screen/stays_screen/search_location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../expandable_container/expandable_container.dart';

class StaysScreenContent extends StatefulWidget {
  const StaysScreenContent({super.key});

  @override
  State<StaysScreenContent> createState() => _StaysScreenContentState();
}

class _StaysScreenContentState extends State<StaysScreenContent> {
  List<String> locationIdeas = [
    'Islamabad',
    'Lahore',
    'Dubai',
    'Karachi',
    'Istanbul',
    'Baku',
    'Medina',
    'Rawalpindi',
    'Kuala Lumpur',
  ];
  final List<String> imagePaths = [
    'images/islamabad.jpg',
    'images/lahore.jpeg',
    'images/dubai.jpg',
    'images/karachi.jpg',
    'images/istanbul.jpg',
    'images/baku.jpg',
    'images/medina.jpg',
    'images/rawalpindi.jpg',
    'images/kualalumpur.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime twoDaysLater = today.add(const Duration(days: 2));
    String todayFormatted = DateFormat('EEE, MMMM d').format(today);
    String twoDaysLaterFormatted =
        DateFormat('EEE, MMMM d').format(twoDaysLater);
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  //height: height * .32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        spreadRadius: .5, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset:
                            const Offset(0, 2), // Offset in the x and y directions
                      ),
                    ],
                    border: Border.all(
                      color: Colors.orangeAccent, // Border color
                      width: 5.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0), // Radius of the rounded corners
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .025,
                            bottom: height * .013,
                            left: width * .035),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * .035),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const LocationSearch(),
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.magnifyingGlass,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: width * .04,
                                  ),
                                  const Text(
                                    'Location',
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 4,
                        color: Colors.orangeAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .012,
                            bottom: height * .01,
                            left: width * .035),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * .035),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.blue,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: width * .04,
                                ),
                                Text(
                                  todayFormatted,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  ' - $twoDaysLaterFormatted',
                                  style:
                                      const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 4,
                        color: Colors.orangeAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .012,
                            bottom: height * .007,
                            left: width * .043),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * .035,bottom: height*.01),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.person,
                                  color: Colors.blue,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: width * .04,
                                ),
                                const Text(
                                  '1 room • 3 adults • 0 children',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 4,
                        color: Colors.orangeAccent,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          width: width,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.zero,topLeft: Radius.zero,bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                // Add your onPressed code here!
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: width * .035, top: height * .03),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Need ideas?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travelers from Pakistan often book',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: height * .4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locationIdeas.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: height * .04,
                            left: width * .025,
                            right: width * .02),
                        child: Stack(
                          children: [
                            Container(
                              height: height * .45,
                              width: width * .5,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      10.0), // Radius of the rounded corners
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: height * .31,
                              left: width * .035,
                              child: Text(
                                locationIdeas[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * .035, top: height * .07, bottom: height * .02),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More for you',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height * .4,
                          width: width * .45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  15.0), // Radius of the rounded corners
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withOpacity(0.5), // Shadow color
                                spreadRadius: .5, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 2), // Offset in the x and y directions
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            child: Image.asset(
                              'images/beach.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: height * .2875,
                          left: width * .0195,
                          child: Container(
                            width: width * .45,
                            height: height * .125,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.zero,
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(
                                    15), // Radius of the rounded corners
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * .04, top: height * .02),
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Seize the moment',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .04),
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Save 15% or more on stays',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width*0,left: width*.042),
                        child: Container(
                          height: height * .4,
                          width: width * .45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  15.0), // Radius of the rounded corners
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withOpacity(0.5), // Shadow color
                                spreadRadius: .5, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 2), // Offset in the x and y directions
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            child: Image.asset(
                              'images/travel.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * .32,
                        left: width * .07,
                        child: const Text(
                          'Travel Articles',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: height * .04, bottom: height * .03),
                child: const ExpandableContainer(),
              ),
            )
          ],
        )
        );
  }
}
