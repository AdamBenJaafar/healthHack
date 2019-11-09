import 'package:flutter/material.dart';
import 'package:health_hackathon/helper/EnterExitRoute.dart';
import 'package:health_hackathon/main.dart';
import 'package:health_hackathon/screens/profileScreen.dart';
import 'package:health_hackathon/ui/detailsScreen.dart';

import 'DocumentScreen.dart';
import 'SolveProblemScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.person_outline),
        label: Text('Profile'),
      onPressed: () => _goToProfile(),
      ),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => _goToPlanTrip(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 185,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              //image: NetworkImage("https://images.unsplash.com/photo-1524850011238-e3d235c7d4c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1387&q=80"),
                              image: NetworkImage("https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1866&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 8,
                          left: 8,
                          child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.green.withOpacity(0.75),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Plan Trip',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
                        ),
                      )),
                    ],
                  ),
                  height: 185,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _goToSolveProblem(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 185,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              //image: NetworkImage("https://images.unsplash.com/photo-1524850011238-e3d235c7d4c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1387&q=80"),
                              image: NetworkImage("https://img.budgettravel.com/_contentHero/Woman-frustrated-at-airport.jpg?mtime=20180820104456"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 8,
                          left: 8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.green.withOpacity(0.75),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Solve Problem',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
                            ),
                          )),
                    ],
                  ),
                  height: 185,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _goToDocument(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 185,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              //image: NetworkImage("https://images.unsplash.com/photo-1524850011238-e3d235c7d4c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1387&q=80"),
                              image: NetworkImage("https://images.unsplash.com/photo-1519160558534-579f5106e43f?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 8,
                          left: 8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.green.withOpacity(0.75),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Document',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
                            ),
                          )),
                    ],
                  ),
                  height: 185,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _goToPlanTrip() {
    Navigator.push(context, EnterExitRoute( enterPage: MapSample()));
  }

  _goToSolveProblem() {
    Navigator.push(context, EnterExitRoute( enterPage: SolveProblemScreen()));
  }

  _goToDocument() {
    Navigator.push(context, EnterExitRoute( enterPage: DocumentScreen()));
  }

  _goToProfile() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProfileScreen();
          // return CreateDeck();
        });
  }

  _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: Icon(Icons.map, color: Colors.green,), onPressed: () {},),
          IconButton(icon: Icon(Icons.report_problem, color: Colors.green,), onPressed: () {},),
          IconButton(icon: Icon(Icons.feedback, color: Colors.green,), onPressed: () {},),
        ],
      ),
    );
  }

}
