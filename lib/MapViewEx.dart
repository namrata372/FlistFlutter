import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewEx extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MapViewEx> {
  var markers = <Marker>[
     Marker(
        width: 80.0,
        height: 80.0,
        point:  LatLng(22.2425452, 73.0653421),
        builder: (ctx) =>  Icon(
              Icons.school,
              color: Colors.green,
            )),
     Marker(
        width: 80.0,
        height: 80.0,
        point:  LatLng(22.2502083, 73.0800702),
        builder: (ctx) =>  Icon(
              Icons.hotel,
              color: Colors.red,
            )),
     Marker(
        width: 80.0,
        height: 80.0,
        point:  LatLng(22.2380007, 73.0815789),
        builder: (ctx) =>  Icon(
              Icons.pin_drop,
              color: Colors.blue,
            )),
  ];
  late List<LatLng> points;
  late MapController mapController;
  @override
  void initState() {
    super.initState();

    mapController =  MapController();
    points = <LatLng>[];
    points.add( LatLng(22.2425452, 73.0653421));
    points.add( LatLng(22.2502083, 73.0800702));
    points.add( LatLng(22.2380007, 73.0815789));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Map View Example'),
      ),
      body:  Container(
          padding:  EdgeInsets.all(0.0),
          child:  Center(
            child:  Column(
              children: <Widget>[
                 Flexible(
                    child:  FlutterMap(
                  options:  MapOptions(
                      center:  LatLng(22.241554, 73.085266), zoom: 14.0),
                  layers: [
                     TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                     MarkerLayerOptions(markers: markers),
                     PolylineLayerOptions(polylines: [
                       Polyline(
                          points: points,
                          strokeWidth: 4.0,
                          color: Colors.purple)
                    ])
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
