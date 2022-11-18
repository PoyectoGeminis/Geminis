import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetaillSitesPage extends StatefulWidget {
   var sites;

   DetaillSitesPage(this.sites);

  @override
  State<DetaillSitesPage> createState() => _DetaillSitesPageState(sites);
}

class _DetaillSitesPageState extends State<DetaillSitesPage> {

  var sites;

  _DetaillSitesPageState(this.sites);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sites["nombre"]),
      ),
      body: Stack(
       children:[
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
            target: LatLng(sites["latitud"],sites["longitud"]),
            zoom: 15,
            ),
            markers: _markers,
            onTap: (position){
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position){
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              // _controller.complete(controller);
              _customInfoWindowController.googleMapController = controller;
            _showMarker();
            },
          ),
         CustomInfoWindow(
             controller: _customInfoWindowController,
         height: 200,
         width: 200,
         offset: 50
         )
        ],
      ),
    );
  }

  void _showMarker(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(sites["nombre"]),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(sites["latitud"], sites["longitud"]),
        //infoWindow: InfoWindow(
          //title: sites["nombre"], snippet: "Ciudad ${sites["ciudad"]}"),
          onTap: (){
          _customInfoWindowController.addInfoWindow!(
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(sites["urlPicture"]),
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        color: Colors.blue,
                      ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Text("Descripcion: ${sites["descripcion"]}",
                  textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ciudad: ${sites["ciudad"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Departamento: ${sites["departamento"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
              LatLng(sites["latitud"], sites["longitud"]),
          );
      }
      ));
    });
  }
}


