import 'package:agr_/cubit/agrAuthCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrAccountTypeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      /* body: BlocProvider(
        create: (context) => AuthBloc(),
        child: _body(),
      ),*/
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Choose Your Account Type"),
        Row(
          children: <Widget>[
            /*  BlocBuilder<>(builder: (context, state) {
                    return GestureDetector(
                        //onTap: () =>context.read<AuthCubit>(),
                        child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Icon(Icons.store),
                        ),
                        Text("Business")
                      ],
                    ));
                  }),*/
            GestureDetector(
                onTap: () => context.read<AgrAuthCubit>().showAudienceAccount(),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(Icons.person),
                    ),
                    Text("User")
                  ],
                ))
          ],
        )
      ],
    );
  }
}
