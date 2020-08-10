import 'package:flutter/material.dart';
import 'package:sqlite_fullter_app/utils/database.dart';

class TextUserDBScreen extends StatefulWidget {
  @override
  _TextUserDBScreenState createState() => _TextUserDBScreenState();
}

class _TextUserDBScreenState extends State<TextUserDBScreen> {
  Map<String, String> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = getUser();
  }

  getUser() async {
    final _userData = await DBProvider.db.getUser();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test User Database"),
        ),
        body: FutureBuilder(
          future: _userFuture,
          // ignore: missing_return
          builder: (_, userData) {
            switch (userData.connectionState) {
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.active:
                return Container();
              case ConnectionState.done:
                if (!newUser.containsKey('username')) {
                  newUser = Map<String, String>.from(userData.data);
                }
                return Column(
                  children: <Widget>[
                    Text(newUser['username']),
                    Text(newUser['password']),
                  ],
                );
            }
          },
        ));
  }
}
