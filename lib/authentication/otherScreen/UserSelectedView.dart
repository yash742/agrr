import 'package:flutter/material.dart';

class AgrUserScreen extends StatelessWidget {
  final bool userType;
  AgrUserScreen({@required this.userType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userBody(),
    );
  }

  Widget _userBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Text(userType
              ? "Welcome To Agr Business Account "
              : "Welcome To Agr User Account"),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Icon(userType ? Icons.store : Icons.person),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Create New Account")),
          Text("or"),
          ElevatedButton(onPressed: () {}, child: Text("LogIn"))
        ],
      ),
    );
  }
}
