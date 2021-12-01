import 'package:ecogo_mobile_app/data/constant/google_maps_constants.dart';
import 'package:ecogo_mobile_app/data/uuid.dart';
import 'package:ecogo_mobile_app/repository/destination/destination_repository.dart';
import 'package:ecogo_mobile_app/widgets/common/general_icon_badge.dart';
import 'package:ecogo_mobile_app/widgets/search/recent_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class SearchGoogleScreen extends PlacesAutocompleteWidget {
  SearchGoogleScreen({Key? key})
      : super(
          offset: 0,
          radius: 10000,
          strictbounds: false,
          region: "ca",
          language: "en",
          mode: Mode.overlay,
          location: Location(lat: 49.26708811026655, lng: -123.08988012424878),
          apiKey: apiKey,
          components: [],
          types: [],
          hint: "",
        );

  @override
  _SearchGoogleScreenState createState() => _SearchGoogleScreenState();
}

class _SearchGoogleScreenState extends PlacesAutocompleteState {
  bool showRecent = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFF000000).withOpacity(0.06),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(8, 0, 1, 0),
                      //   child: Icon(
                      //     Icons.place_outlined,
                      //     color: Color(0xFF000000).withOpacity(0.4),
                      //     size: 25,
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          child: AppBarPlacesAutoCompleteTextField(
                            textDecoration:
                                InputDecoration(hintText: "Enter Destination"),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                        // child: TextField(
                        //   // TODO: Fix Appearance of Textfield
                        //   autofocus: false,
                        //   onChanged: (String text) {
                        //     if (text == "") {
                        //       setState(() {
                        //         showRecent = true;
                        //       });
                        //     } else {
                        //       setState(() {
                        //         showRecent = false;
                        //       });
                        //     }
                        //   },
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PlacesAutocompleteResult(
                onTap: (p) {
                  displayPrediction(p, context);
                },
                logo: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Powered by Sachit Gulwadi",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  @override
  void onResponse(PlacesAutocompleteResponse? response) {
    super.onResponse(response);
    // if (response != null && response.predictions.isNotEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Got answer")),
    //   );
    // }
  }
}

Future<void> displayPrediction(Prediction? p, BuildContext context) async {
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    final placeId = p.placeId;
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    final addr = detail.result.formattedAddress!;
    final name = detail.result.name;
    print("name is $name\nAddr: $addr");
    Navigator.pushNamed(
        context,
        '/navigation?id=$placeId&name=$name'
        '&addr=$addr&lat=$lat&long=$lng');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("${p.description} - $lat/$lng")),
    // );
  }
}
