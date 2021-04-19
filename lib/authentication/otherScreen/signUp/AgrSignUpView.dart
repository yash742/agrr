import 'package:agr_/authentication/otherScreen/signUp/SignUpBloc.dart';
import 'package:agr_/authentication/otherScreen/signUp/SignUpState.dart';
import 'package:agr_/authentication/otherScreen/signUp/signUpEvent.dart';

import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrSignUpView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("signInBuild PRinting..");
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
            create: (context) => SignUpBloc(),
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [_signInForm(), _termsOfUseButton()])),
      ),
    );
  }

  Widget _signInForm() {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is AgrFormFaild) {
            _showSnacBar(context, formStatus.exception.toString());
          }
        },
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _userNameField(),
                  SizedBox(
                    height: 5,
                  ),
                  _emailField(),
                  SizedBox(
                    height: 5,
                  ),
                  _passwordField(),
                  _showSignInView(),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _userNameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      final deviceSize = MediaQuery.of(context).size;
      return Container(
        width: deviceSize.width * 0.92,
        child: TextFormField(
          key: ValueKey("Your Name"),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            labelText: "Your Name",
          ),
          validator: (value) =>
              state.isValiduserNaame ? null : " Enter atleast two letters",
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpUserNameChanged(userName: value)),
        ),
      );
    });
  }

  Widget _emailField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
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
              state.isValidEmail ? null : " Enter valid email",
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpEmailChanged(userEmail: value)),
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      final deviceSize = MediaQuery.of(context).size;
      return Container(
        width: deviceSize.width * 0.92,
        child: TextFormField(
          key: ValueKey("password"),
          keyboardType: TextInputType.emailAddress,
          obscureText: state.isVisible,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<SignUpBloc>().add(PasswordVisibility());
              },
              child: state.isVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
            prefixIcon: Icon(Icons.security),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            labelText: "Password",
          ),
          validator: (value) =>
              state.isValidPassWord ? null : "enter valid password",
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpPasswordChanged(password: value)),
        ),
      );
    });
  }

  Widget _showSignInView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Text(
            "i am a agr user",
            style: TextStyle(color: Colors.black),
          ),
          TextButton(onPressed: () {}, child: Text("Sign me In"))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      final deviceSize = MediaQuery.of(context).size;
      return Container(
        margin: EdgeInsets.only(
            top: deviceSize.height * 0.05, left: deviceSize.height * 0.01),
        width: deviceSize.width * 0.95,
        height: deviceSize.height * 0.09,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: ElevatedButton(
              style: ButtonStyle(elevation: null),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<SignUpBloc>().add(SignUpSubmitted());
                }
              },
              child: state.formStatus is AgrFormSibmitting
                  ? CircularProgressIndicator()
                  : Icon(
                      Icons.check,
                      size: 40.0,
                      color: Colors.white,
                    )),
        ),
      );
    });
  }

  Widget _termsOfUseButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.8),
      child: TextButton(onPressed: () {}, child: Text("Terms of Use")),
    );
  }

  void _showSnacBar(BuildContext context, String message) {
    final snacBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snacBar);
  }
}
