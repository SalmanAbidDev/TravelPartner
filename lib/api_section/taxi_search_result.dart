import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class TaxiSearchResult extends StatefulWidget {
  const TaxiSearchResult({super.key});

  @override
  State<TaxiSearchResult> createState() => _TaxiSearchResultState();
}

class _TaxiSearchResultState extends State<TaxiSearchResult> {
  final String apiKey = '47ad6937e9msh7ceeafb5e0b2dacp17040ejsnb1577e078225';
  final String apiHost = 'booking-com15.p.rapidapi.com';
  List<dynamic> taxis = [];
  bool isLoading = false;
  bool hasSearched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Search Taxi's",
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
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ))
          : hasSearched && taxis.isEmpty
              ? const Center(child: Text('No taxis found. Please try again.'))
              : !hasSearched
                  ? const Center(
                      child: Text(
                      'Press the search button to load taxis.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ))
                  : ListView.builder(
                      itemCount: taxis.length,
                      itemBuilder: (context, index) {
                        final taxi = taxis[index];
                        final name = taxi['name'];
                        final latitude = taxi['latitude'];
                        final longitude = taxi['longitude'];
                        final country = taxi['country'];
                        final types = taxi['types'];
                        final city = taxi['city'];
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
                                        types,
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
                                  Text(city),
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
        onPressed: fetchTaxis,
        child:
            const FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
      ),
    );
  }

  void fetchTaxis() async {
    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    const url = 'https://booking-com15.p.rapidapi.com/api/v1/taxi/searchLocation?query=new';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': apiHost,
    });

    if (response.statusCode == 200) {
      final body = response.body;
      final Map<String, dynamic> jsonResponse = jsonDecode(body);
      setState(() {
        taxis = jsonResponse['data'];  // Accessing the 'data' field
        isLoading = false;
      });
    } else {
      // Handle the error
      setState(() {
        isLoading = false;
        // You can also set an error message or show a dialog
      });
    }
  }

}
