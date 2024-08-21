import 'package:booking_application/api_section/rental_car_search_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../expandable_container/expandable_container.dart';

class CarRentalScreenContent extends StatefulWidget {
  const CarRentalScreenContent({super.key});

  @override
  State<CarRentalScreenContent> createState() => _CarRentalScreenContentState();
}

class _CarRentalScreenContentState extends State<CarRentalScreenContent> {
  bool isOn = false;

  void toggleButton(bool value) {
    setState(() {
      isOn = !isOn;
    });
  }
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
              //height: height * .39,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Return to same location',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width*.27),
                              child: SizedBox(
                                width: width*.03,
                                height: height*.03,
                                child: Transform.scale(
                                  scale: .8,
                                  child: Switch(
                                    value: isOn,
                                    onChanged: toggleButton,
                                    activeColor: Colors.blue,
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor:
                                        Colors.grey.withOpacity(0.5),
                                    splashRadius: 10,
                                  ),
                                ),
                              ),
                            )
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
                              FontAwesomeIcons.car,
                              color: Colors.blue,
                              size: 25,
                            ),
                            SizedBox(
                              width: width * .04,
                            ),
                            const Text(
                              'Pickup location',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w500,
                                color: Colors.grey
                              ),
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
                              FontAwesomeIcons.user,
                              color: Colors.blue,
                              size: 25,
                            ),
                            SizedBox(
                              width: width * .04,
                            ),
                            const Text(
                              "Driver's age: 30-65",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                color: Colors.grey
                              ),
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const RentalCarSearchResult(),
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
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
            padding: EdgeInsets.only(
                left: width * .035, top: height * .04, bottom: height * .02),
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
                    padding: EdgeInsets.only(left: width*.028,right: width*.01),
                    child: Container(
                      height: height * .4,
                      width: width * .95,
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
                    top: height * .34,
                    left: width * .035,
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
    ));
  }
}
