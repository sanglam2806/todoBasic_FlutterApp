import 'package:flutter/material.dart';
import 'package:sqlite_fullter_app/models/user.dart';
import 'package:sqlite_fullter_app/utils/database.dart';

class InsertUserScreen extends StatefulWidget {
  InsertUserScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InsertUserScreen createState() => _InsertUserScreen();
}

class _InsertUserScreen extends State<InsertUserScreen> {
  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Username"),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Password"),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: FlatButton(
                    child: Text('SAVE'),
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      var newDBUser =
                          User(username: username, password: password);
                      DBProvider.db.newUser(newDBUser);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}
