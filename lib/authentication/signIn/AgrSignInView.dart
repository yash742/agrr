import 'package:agr_/authentication/signIn/SignInBloc.dart';
import 'package:agr_/authentication/signIn/SignInEvent.dart';
import 'package:agr_/authentication/signIn/SignInState.dart';
import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:agr_/formsSubmissionStatus/AgrFormSubmissionStatus.dart';
import 'package:agr_/repo/AuthRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrSignInView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("signInBuild PRinting..");
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
            create: (context) =>
                SignInBloc(authRepo: context.read<AuthRepository>()),
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [_signInForm(context), _termsOfUseButton()])),
      ),
    );
  }

  Widget _signInForm(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
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
                  _emailField(),
                  _recoveryButton(context),
                  _passwordField(),
                  _showSelectAccountTypeView(context),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _emailField() {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
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
              state.isValidUserEmail ? null : " Enter atleast two letters",
          onChanged: (value) => context
              .read<SignInBloc>()
              .add(SignInEmailChanged(userEmail: value)),
        ),
      );
    });
  }

  Widget _recoveryButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: Row(
        children: [
          Spacer(),
          TextButton(
              onPressed: () =>
                  context.read<AgrAuthCubit>().showAccountRecovery(),
              child: Text("Forgot Password")),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
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
                context.read<SignInBloc>().add(PasswordVisibility());
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
              .read<SignInBloc>()
              .add(SignInPasswordChanged(password: value)),
        ),
      );
    });
  }

  Widget _showSelectAccountTypeView(BuildContext context) {
    return Row(
      children: [
        Text(
          "create New agr account",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
            onPressed: () =>
                context.read<AgrAuthCubit>().showAccountType(),
            child: Text("Create "))
      ],
    );
  }

  Widget _submitButton() {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
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
                  context.read<SignInBloc>().add(SignInSubmitted());
                }
              },
              child: Icon(
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
