import 'dart:ui';

import 'package:agr_/agape/agapeView.dart';
import 'package:agr_/authentication/otherScreen/view/LoadingView.dart';
import 'package:agr_/cubit/agrAppCubit.dart';
import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:agr_/navigator/agrAuthNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrSessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //change it
    return BlocBuilder<AgrSessionCubit, AgrSessionState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnKnownSessionState) MaterialPage(child: LoadingView()),
          if (state is UnAuthenticated)
            MaterialPage(
                child: BlocProvider(
              create: (context) => AgrAuthCubit(),
              child: AgrAuthenticationNavigator(),
            )),
          if (state is Authenticated) MaterialPage(child: AgapeView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
