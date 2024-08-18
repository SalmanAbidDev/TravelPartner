import 'package:booking_application/search_screen/attractions_screen_content.dart';
import 'package:booking_application/search_screen/car_rental_screen_content.dart';
import 'package:booking_application/search_screen/stays_screen_content.dart';
import 'package:booking_application/search_screen/taxi_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  //bool _useRtlText = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: EdgeInsets.only(left: width*.08),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * .03),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              weight: 25,
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                physics: const NeverScrollableScrollPhysics(),
                isScrollable: true,
                indicator: BoxDecoration(
                  color: Colors.blueAccent.shade700, // Customize the color of the underline here
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                indicatorWeight: 10,
                indicatorPadding: const EdgeInsets.only(bottom: 5,top: 0,left: 1,right: 1),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white, // Customize the text color of the selected tab
                unselectedLabelColor: Colors.white, // Customize the text color of unselected tabs
                tabs: [
                  Tab(child: Padding(
                    padding: EdgeInsets.only(top: height*.0025),
                    child: Row(children: [const FaIcon(FontAwesomeIcons.bed),SizedBox(width: width*.03,),const Text('Stays')],),
                  )),
                  Tab(child: Padding(
                    padding: EdgeInsets.only(top: height*.0025),
                    child: Row(children: [const FaIcon(FontAwesomeIcons.car),SizedBox(width: width*.03,),const Text('Car Rental')],),
                  )),
                  Tab(child: Padding(
                    padding: EdgeInsets.only(top: height*.0025),
                    child: Row(children: [const FaIcon(FontAwesomeIcons.taxi),SizedBox(width: width*.03,),const Text('Taxi')],),
                  )),
                  Tab(child: Padding(
                    padding: EdgeInsets.only(top: height*.0025),
                    child: Row(children: [const Icon(Icons.attractions_outlined),SizedBox(width: width*.03,),const Text('Attractions')],),
                  )),
                ],
                onTap: (index) {
                  setState(() {
                    _tabController.index = index; // Manually set the index
                  });
                },
              ),
            ),
            Expanded(
                child: IndexedStack(
                  index: _tabController.index,
                  children: const [
                    Center(child: StaysScreenContent(),),
                    Center(child: CarRentalScreenContent()),
                    Center(child: TaxiScreenContent()),
                    Center(child: AttractionsScreenContent()),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}