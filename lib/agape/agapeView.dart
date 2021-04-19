import 'package:agr_/agape/AgapeBloc.dart';
import 'package:agr_/agape/AgapeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgapeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgapeBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _agpAppBar(context),
        body: _agapeBody(),
      ),
    );
  }

  Widget _agpAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0.0,
        title: userName());
  }

  Widget userName() {
    //size ?
    return Stack(clipBehavior: Clip.antiAlias, children: [
      Container(
          color: Colors.white,
          child: FittedBox(
            child: Text(
              "name",

              //   softWrap: true,
              maxLines: 2,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )),
      // Positioned(child: IconButton(icon: Icon(Icons.edit), onPressed: () {}))
    ]);
  }

  Widget openStatus() {
    return Switch.adaptive(
        value: null, //shutterSwitch,
        onChanged: (val) {});
    /*   Chip(
                      label: Text(
                      "onlive",
                      style: TextStyle(fontSize: 10),
                    ));*/
  }

  Widget arrowBack() {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {});
  }

  Widget _agapeBody() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceHeight = MediaQuery.of(context).size.height;
      return Stack(
        children: [
          Container(
            height: deviceHeight,
            width: deviceWidth,
          ),
          _topSky(),
          _bottomSky(),
          _grawingTree()
        ],
      );
    });
  }

  Widget _topSky() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceHeight = MediaQuery.of(context).size.height;
      return Positioned(
        top: 0.0,
        child: Stack(children: [
          Container(
            width: deviceWidth,
            height: deviceHeight * 0.7,
            color: Colors.yellow,
          ),
          Positioned(
              right: 20.0,
              bottom: 10.0,
              child: IconButton(
                  icon: Icon(Icons.camera_alt_rounded), onPressed: () {}))
        ]),
      );
    });
  }

  Widget _bottomSky() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceHeight = MediaQuery.of(context).size.height;

      return Positioned(
        bottom: 0.0,
        child: Container(
          height: deviceHeight * 0.4,
          width: deviceWidth,
          decoration: BoxDecoration(color: Colors.black45),
          child: Column(
            children: [_statusText(), _supportButton()],
          ),
        ),
      );
    });
  }

  Widget _statusText() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        title: TextFormField(),
        trailing: Icon(Icons.thumb_up_sharp),
      );
    });
  }

  Widget _supportButton() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceHeight = MediaQuery.of(context).size.height;

      return Container(
          margin: EdgeInsets.only(
            top: deviceHeight * 0.05,
          ),
          width: deviceWidth * 0.40,
          height: deviceHeight * 0.09,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: ElevatedButton(
                style: ButtonStyle(elevation: null),
                onPressed: () {},
                child: Text("Support")),
          ));
    });
  }

  Widget _grawingTree() {
    return BlocBuilder<AgapeBloc, AgapeState>(builder: (context, state) {
      return DraggableScrollableSheet(
        maxChildSize: 0.85,
        minChildSize: 0.10,
        initialChildSize: 0.2,
        builder: (context, scrollController) {
          return ListView(
            children: [AppBar(), Text("hi")],
            controller: scrollController,
          );
        },
      );
    });
  }
}
