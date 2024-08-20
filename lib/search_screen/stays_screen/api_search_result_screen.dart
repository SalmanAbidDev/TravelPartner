import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiSearchResult extends StatefulWidget {
  const ApiSearchResult({super.key});

  @override
  State<ApiSearchResult> createState() => _ApiSearchResultState();
}

class _ApiSearchResultState extends State<ApiSearchResult> {
  final String apiKey = '47ad6937e9msh7ceeafb5e0b2dacp17040ejsnb1577e078225';
  final String apiHost = 'booking-com15.p.rapidapi.com';

  List<dynamic> hotels = [];
  bool isLoading = false;

  Future<void> fetchHotels() async {
    final url = Uri.parse(
        'https://$apiHost/api/v1/hotels/searchHotelsByCoordinates'
        '?latitude=19.24232736426361&longitude=72.85841985686734'
        '&adults=1&children_age=0%2C17&room_qty=1&units=metric&page_number=1'
        '&temperature_unit=c&languagecode=en-us&currency_code=EUR'
        '&arrival_date=2024-09-01&departure_date=2024-09-05');

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': apiHost,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Print entire response for debugging
        print('Full API Response: $data');

        // Check if data contains 'data' and 'result' fields
        if (data['data'] != null && data['data']['result'] != null) {
          setState(() {
            hotels = data['data']['result'];
            isLoading = false;
          });
        } else {
          print('Response does not contain expected fields');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('Failed to load hotels: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
            'Hotels Result',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : hotels.isEmpty
                ? const Text('No hotels found.')
                : ListView.builder(
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = hotels[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          title: Text(hotel['hotel_name'] ?? 'No name'),
                          subtitle: Text(hotel['city'] ?? 'No city'),
                          titleAlignment: ListTileTitleAlignment.center,
                          trailing:
                              Text('Rating: ${hotel['review_score'] ?? 'N/A'}'),
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchHotels,
        child: const Icon(Icons.search),
      ),
    );
  }
}
