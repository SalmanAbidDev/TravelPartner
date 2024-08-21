import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class HotelsSearchResult extends StatefulWidget {
  const HotelsSearchResult({super.key});

  @override
  State<HotelsSearchResult> createState() => _HotelsSearchResultState();
}

class _HotelsSearchResultState extends State<HotelsSearchResult> {
  final String apiKey = '47ad6937e9msh7ceeafb5e0b2dacp17040ejsnb1577e078225';
  final String apiHost = 'booking-com.p.rapidapi.com';
  List<dynamic> hotels = [];
  bool isLoading = false;
  bool hasSearched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Hotels',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.blueAccent,))
          : hasSearched && hotels.isEmpty
              ? const Center(child: Text('No hotels found. Please try again.'))
              : !hasSearched
                  ? const Center(
                      child: Text('Press the search button to load hotels.',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),))
                  : ListView.builder(
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = hotels[index];
                        final name = hotel['name'];
                        final latitude = hotel['latitude'];
                        final longitude = hotel['longitude'];
                        final country = hotel['country'];
                        final timezone = hotel['timezone_name'];
                        final timezoneoffset = hotel['timezone_offset'].toString();
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Hotel City:  ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Coordinates',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text('Latitude: '),
                                      Text(latitude),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Longitude: '),
                                      Text(longitude),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Text('Time Zone: '),
                                      Text(
                                        timezone,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    country,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(timezoneoffset),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: fetchHotels,
        child:
            const FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
      ),
    );
  }

  void fetchHotels() async {
    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    const url =
        'https://booking-com.p.rapidapi.com/v1/static/cities?country=pk&page=0';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': apiHost,
    });

    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      hotels = json['result'];
      isLoading = false;
    });
  }
}
