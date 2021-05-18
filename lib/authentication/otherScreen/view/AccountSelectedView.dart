import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:flutter/material.dart';

class AgrAccountSelectedView extends StatelessWidget {
  final bool userType;
  AgrAccountSelectedView({@required this.userType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userBody(context: context),
    );
  }

  Widget _userBody({BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(userType
            ? "Welcome To Agr Business Account "
            : "Welcome To Agr User Account"),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green[200],
          ),
          child: Icon(userType ? Icons.store : Icons.person),
        ),
        Spacer(),
        ClipRRect(
            borderRadius: BorderRadius.circular(32.0),
            child: ElevatedButton(onPressed: () {}, child: Text("ios SignUp"))),
        Text("or"),
        ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: ElevatedButton(child: Text("signUp"), onPressed: (){}))
      ],
    );
  }
}
