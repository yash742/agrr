import 'dart:ui';

import 'package:agr_/authentication/accoutRecovery/AccountRecoveryBloc.dart';
import 'package:agr_/authentication/accoutRecovery/AccountRecoveryState.dart';
import 'package:agr_/authentication/accoutRecovery/accountRecoveryEvent.dart';
import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountRecoveryView extends StatelessWidget {
  final _recoveryFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Entere Associated Email",
          style: TextStyle(color: Colors.green, fontSize: 25.0),overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
            color: Colors.teal,
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => context.read<AgrAuthCubit>().showLogIn()),
      ),
      body: BlocProvider(
          create: (context) => AccountRecoveryBloc(), child: _body()),
    );
  }

  Widget _body() {
    return Form(
      key: _recoveryFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _emailField(),
            SizedBox(
              height: 10.0,
            ), //use media
            _recoverySubmitButton()
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<AccountRecoveryBloc, AccountRecoveryState>(
        builder: (context, state) {
      final deviceSize = MediaQuery.of(context).size;
      return Container(
        width: deviceSize.width * 0.92,
        child: TextFormField(
          key: ValueKey("emali"),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            labelText: "Email",
          ),
          validator: (value) =>
              state.recoveryEmail ? null : " Enter valid email",
          onChanged: (value) => context
              .read<AccountRecoveryBloc>()
              .add(AccountRecoveryEmailChanged(email: value)),
        ),
      );
    });
  }

  Widget _recoverySubmitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.check,
            size: 20,
          )),
    );
  }
}
