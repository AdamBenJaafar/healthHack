import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phuket'),),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Checklist', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),

                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ),
    );
  }

}
