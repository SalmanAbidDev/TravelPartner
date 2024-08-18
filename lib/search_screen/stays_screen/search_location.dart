import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark, // For iOS
        ));*/
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width*.04,right: width*.04,top: height*.07),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the TextField container
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10.0,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter destination',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: const Icon(Icons.arrow_back)
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 4,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 4,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 4,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
