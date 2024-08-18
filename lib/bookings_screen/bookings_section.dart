import 'package:booking_application/bookings_screen/active_screen_content.dart';
import 'package:booking_application/bookings_screen/canceled_screen_content.dart';
import 'package:booking_application/bookings_screen/past_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingsSection extends StatefulWidget {
  const BookingsSection({super.key});

  @override
  State<BookingsSection> createState() => _BookingsSectionState();
}

class _BookingsSectionState extends State<BookingsSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    //final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Trips',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FaIcon(FontAwesomeIcons.solidCircleQuestion, color: Colors.white, size: 27),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: FaIcon(FontAwesomeIcons.plus, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*.02),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                      color: Colors.lightBlueAccent.shade100, // Customize the color of the underline here
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 1,
                          color: Colors.blue,
                      ),
                  ),
                  indicatorWeight: 10,
                  indicatorPadding: const EdgeInsets.only(bottom: 7,top: 0,left: 7,right: 7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.blue, // Customize the text color of the selected tab
                  unselectedLabelColor: Colors.black, // Customize the text color of unselected tabs
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'Past'),
                    Tab(text: 'Canceled'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ActiveScreenContent(),
                  PastScreenContent(),
                  CanceledScreenContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
