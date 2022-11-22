import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetaillSitesPage extends StatefulWidget {
   late QueryDocumentSnapshot sites;

   DetaillSitesPage(this.sites);

  @override
  State<DetaillSitesPage> createState() => _DetaillSitesPageState();
}

class _DetaillSitesPageState extends State<DetaillSitesPage> {



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
            target: LatLng(widget.sites['latitud'], widget.sites['longitud']),
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
        markerId: MarkerId(widget.sites["nombre"]),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(widget.sites['latitud'], widget.sites['longitud']),
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
                          image: NetworkImage(widget.sites["urlPicture"]),
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
                  child: Text("Descripcion: ${widget.sites["descripcion"]}",
                  textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ciudad: ${widget.sites["ciudad"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Departamento: ${widget.sites["departamento"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
              LatLng(widget.sites["latitud"], widget.sites["longitud"]),
          );
      }
      ));
    });
  }
}


