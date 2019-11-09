import 'package:flutter/material.dart';

class SolveProblemScreen extends StatefulWidget {
  @override
  _SolveProblemScreenState createState() => _SolveProblemScreenState();
}

class _SolveProblemScreenState extends State<SolveProblemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text('PLZzZz Help'),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[],
    );
  }
}
