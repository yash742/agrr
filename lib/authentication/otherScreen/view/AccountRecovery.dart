import 'package:flutter/material.dart';

class AccountRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Text("Entere Associated Email"),
        _emailField(),
        _recoverySubmitButton()
      ],
    );
  }

  Widget _emailField() {}

  Widget _recoverySubmitButton() {
    return ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.check,
          size: 20,
        ));
  }
}
