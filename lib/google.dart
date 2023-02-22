import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google extends StatefulWidget {
  const Google({Key? key}) : super(key: key);

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(27.7089427, 85.3086209);

  @override
  void initState() {
    markers.add(Marker( //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(target: showLocation,zoom: 10.0,
      ),
      markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
      
    );
  }
}
