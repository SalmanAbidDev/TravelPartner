import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                controller: searchController,
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
                onChanged: (value){},
              ),
            ),
          ),
          Visibility(
            visible: searchController.text.isEmpty?false:true,
            child: Padding(
              padding: EdgeInsets.only(left: width*.09,top: height*.025),
              child: SizedBox(
                  width: width,
                  height: height*.5,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                      itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){},
                        child: Text('location$index',style: const TextStyle(color: Colors.black),),
                      );
                    }
                  )
              ),
            ),
          ),
          Visibility(
            visible: searchController.text.isEmpty?true:false,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.transparent,
              width: width*.7,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  side: const BorderSide(
                    color: Colors.blue, // Border color
                    width: 2.0, // Border width
                  ),
                  elevation: 5.0, // Elevation to give a shadow effect
                  shadowColor: Colors.black, // Shadow color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.locationDot,size: 15,color: Colors.white,),
                      SizedBox(width: width*.02,),
                      const Text('Search Location',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
