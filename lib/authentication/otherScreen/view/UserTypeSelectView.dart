import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrUserGateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* body: BlocProvider(
        create: (context) => AuthBloc(),
        child: _body(),
      ),*/
        );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Text("Choose Your Account Type"),
        Row(
          children: <Widget>[
            /*   BlocBuilder<>(builder: (context, state) {
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
                onTap: () {},
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
