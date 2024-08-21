import 'package:booking_application/api_section/hotels_search_result.dart';
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
  DateTime? startDate;
  DateTime? endDate;
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
                            child: InkWell(
                              onTap: (){
                                _dateSelectorCalenderBottomSheet(context);
                              },
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
                            child: InkWell(
                              onTap: (){
                                _personSelectorBottomSheet(context);
                              },
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
                                  pageBuilder: (context, animation, secondaryAnimation) => const HotelsSearchResult(),
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
                              Radius.circular(15.0), // Radius of the rounded corners
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
                          top: height * .2879,
                          left: width * .023,
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

  void _personSelectorBottomSheet(context){
    int counter = 0;

    void incrementCounter() {
      setState(() {
        counter++;
      });
    }

    void decrementCounter() {
      setState(() {
        if (counter > 0) {
          counter--;
        }
      });
    }
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: height*1,
            width: width*1,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.zero,
                )
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: width *.4,right: width *.4,top: height*.01),
                      child: Container(
                        height: 7, // Thickness of the divider
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3.5), // Half of the height to make it fully rounded
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height*.02,left: width*.02),
                  child: const Row(
                    children: [
                      Text(
                        'Select rooms and guests',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height*.001),
                  child: Container(
                    height: height*.37,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: width*.05,top: height*.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                  'Rooms',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15
                                ),
                              ),
                              SizedBox(width: width*.35,),
                              Container(
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.black, // Black border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Minus Button
                                    IconButton(
                                      onPressed: decrementCounter,
                                      icon: const Icon(Icons.remove, color: Colors.blue),
                                    ),
                                    // Digit Display
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text(
                                        '$counter',
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Plus Button
                                    IconButton(
                                      onPressed: incrementCounter,
                                      icon: const Icon(Icons.add, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height*.02),
                            child: Row(
                              children: [
                                const Text(
                                  'Adults',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(width: width*.362,),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black, // Black border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Minus Button
                                      IconButton(
                                        onPressed: decrementCounter,
                                        icon: const Icon(Icons.remove, color: Colors.blue),
                                      ),
                                      // Digit Display
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          '$counter',
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Plus Button
                                      IconButton(
                                        onPressed: incrementCounter,
                                        icon: const Icon(Icons.add, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height*.02),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      'Children',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15
                                      ),
                                    ),
                                    Text(
                                      'Ages 0 - 17',
                                      style: TextStyle(
                                        color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: width*.31,),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black, // Black border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Minus Button
                                      IconButton(
                                        onPressed: decrementCounter,
                                        icon: const Icon(Icons.remove, color: Colors.blue),
                                      ),
                                      // Digit Display
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          '$counter',
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Plus Button
                                      IconButton(
                                        onPressed: incrementCounter,
                                        icon: const Icon(Icons.add, color: Colors.blue),
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
                  ),
                ),
                SizedBox(height: height*.02,),
                SizedBox(
                  width: width*.95,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color of the button
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: const BorderSide(
                          color: Colors.blue, // Border color
                          width: 2, // Border width
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  void _dateSelectorCalenderBottomSheet(context){
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.zero,
                bottomLeft: Radius.zero,
              )
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: width *.4,right: width *.4,top: height*.01),
                    child: Container(
                      height: 7, // Thickness of the divider
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3.5), // Half of the height to make it fully rounded
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height*.02,left: width*.02),
                  child: const Row(
                    children: [
                      Text(
                          'Select dates',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height*.02),
                  child: Container(
                    height: height*.35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: width*.95,
                  child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color of the button
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: const BorderSide(
                          color: Colors.blue, // Border color
                          width: 2, // Border width
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Select dates',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}

