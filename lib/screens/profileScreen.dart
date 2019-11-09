import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[

            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Basic', style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold),),
                      Text('From: Germany'),
                      Text('From: Germany'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Records', style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold),),
                      Text('Almost died from drinking too much Beer in 2006'),
                      Text('Broke both legs by jumping from a carpet'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Insurance', style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold),),
                      Text('Technischer Krankenkassse'),
                      Text('From: Germany'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

