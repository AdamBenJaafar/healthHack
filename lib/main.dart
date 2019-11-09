import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_hackathon/helper/EnterExitRoute.dart';
import 'package:health_hackathon/screens/welcomeScreen.dart';
import 'package:health_hackathon/ui/detailsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[800],
        accentColor: Colors.green[600],

    ),
      title: 'Flutter Google Maps Demo',
      home: WelcomeScreen(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  final TextEditingController _searchController = new TextEditingController();

  int phase = 1;

  /// ------------ UI ------------

  /// Keys

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  /// Controller

  Completer<GoogleMapController> _controller = Completer();

  /// ------------ LOGIC ------------

  /// ------------ DATA ------------

  /// Maps data

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  /// Positions

  static final CameraPosition _kBraunschweig = CameraPosition(
    target: LatLng(51.9167504,6.2969059),
    zoom: 1.0,
  );

  static final CameraPosition _kThailand = CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(14.6121056,100.5031041),
      //tilt: 59.440717697143555,
      zoom: 4);

  static final CameraPosition _kThailandZoomed = CameraPosition(
    //bearing: 192.8334901395799,
      target: LatLng(14.6121056,100.5031041),
      //tilt: 59.440717697143555,
      zoom: 5);



  FocusNode myFocusNode;

  /// COnfig

  @override
  void initState() {

    myFocusNode = FocusNode();

    var markerIdVal;
    MarkerId markerId;

    Marker marker;

    markerIdVal = 'Braunschweig';
    markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    marker = Marker(
      markerId: markerId,
      position: LatLng(
          52.2615495,10.5225923
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: 'You are here !', onTap: () {_addMarker();}),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );


      // adding a new marker to map
      markers[markerId] = marker;
  }

  /// Build UI methods

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Pick your destination'),),
      key: _scaffoldKey,
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );

  }

  _buildBody() {
    return Stack (
      children: <Widget>[
        _buildMap(),
        _buildMenu(),
      ],
    );
  }

  _buildMenu() {
    return Positioned(
      top: 32,
      left: 16,
      right: 16,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 56,
        child: Center(
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: myFocusNode,
                  cursorColor: Colors.white,
                  controller: _searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.green),
                      hintText: 'Destination ?',
                      filled: true,
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.green,),
                          onPressed: () {
                            _addMarker();
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kBraunschweig,
        markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () => _addMarker(),
      label: Text('Trip !'),
      icon: Icon(Icons.directions_boat),
    );
  }

  /// Actions

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kThailand));
  }

   _showSnackBar() {

    final snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );



    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _addMarker () async {

    /// ---- 1 -----
    ///
    ///  myFocusNode.dis

    FocusScope.of(context).requestFocus(new FocusNode());


    final GoogleMapController controller = await _controller.future;

    var markerIdVal;
    MarkerId markerId;

    Marker marker;

  if ( phase == 1 ) {


    markerIdVal = 'Thailand';
    markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    marker = Marker(
      markerId: markerId,
      position: LatLng(
        14.6121056,
        100.5031041,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '', onTap: () {_addMarker();}),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
    phase++;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kThailand));

  } else if ( phase == 2 ) {
    /// ---- 2 -----
    ///


    markerIdVal = 'Chiang Mai';
    markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    marker = Marker(
      markerId: markerId,
      position: LatLng(
          18.7746696, 98.7140029
      ),
      infoWindow: InfoWindow(
          title: markerIdVal,
          snippet: 'Tropical Climate',),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });

    markerIdVal = 'Koh Chang';
    markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    marker = Marker(
      markerId: markerId,
      position: LatLng(
          12.074906, 102.2686773
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: 'tropical climate'),

    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });

    markerIdVal = 'Phuket';
    markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    marker = Marker(
      markerId: markerId,
      position: LatLng(
          8.8856992, 98.5922132
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: 'tripical cliamte',onTap: () {
        _seeDetails();
      },),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(_kThailandZoomed));
  }
    /*
    var markerIdVal = '1';
    final MarkerId markerId = MarkerId(markerIdVal);

    Marker _marker = Marker(
      position: LatLng(14.6121056,100.5031041),
      onTap: () => _showSnackBar(),
      infoWindow: InfoWindow(title: 'Hello', snippet: '*'),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = _marker;
    });*/
  }

  /// DATA


  /// Navigation

  _seeDetails() {
    Navigator.push(context, EnterExitRoute( enterPage: DetailsScreen()));
    /*
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DetailsScreen();
          // return CreateDeck();
        });*/
  }


}