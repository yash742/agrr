import 'package:agr_/authentication/accoutRecovery/AccountRecoveryView.dart';
import 'package:agr_/authentication/otherScreen/signUp/AgrSignUpView.dart';
import 'package:agr_/authentication/otherScreen/view/AccountSelectedView.dart';
import 'package:agr_/authentication/otherScreen/view/AccountTypeSelectView.dart';
import 'package:agr_/authentication/signIn/AgrSignInView.dart';
import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrAuthenticationNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgrAuthCubit, AccountState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is LogInToAccount) MaterialPage(child: AgrSignInView()),
          if (state is SignUpToAccount ||
              state is AccountRecovery ||
              state is AudienceAccount ||state is BusinessAccount||
              state is SelectAccountType) ...[
            //usertype is empty case
            if (state is SignUpToAccount)
              MaterialPage(child: AgrSignUpView()),

            if (state is SelectAccountType)
              MaterialPage(child: AgrAccountTypeView()),
            if (state is BusinessAccount)
              MaterialPage(child: AgrAccountSelectedView(userType: true)),

            if(state is AudienceAccount)
              MaterialPage(child: AgrAccountSelectedView(userType: false)),
            if (state is AccountRecovery)
              MaterialPage(child: AccountRecoveryView()),
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
