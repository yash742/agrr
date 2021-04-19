import 'package:agr_/flower/FlowerBlock.dart';
import 'package:agr_/flower/FlowerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgrFlowerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlowerBloc(),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _appBar(),
          body: _flowerbody(),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.white24,
        ),
      ),
    );
  }

  Widget _flowerbody() {
    return BlocBuilder<FlowerBloc, FlowerState>(builder: (context, state) {
      final deviceHeight = MediaQuery.of(context).size.height;
      final deviceWidth = MediaQuery.of(context).size.width;
      return Stack(children: [
        Container(
          height: deviceHeight,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Container(
                height: deviceHeight * 0.7,
                color: Colors.green,
                child: Image.network(
                  "",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: deviceHeight * 0.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.white38,
                          Colors.white24.withOpacity(0.2)
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.5],
                        tileMode: TileMode.clamp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _showSellingPrice(context),
                            SizedBox(
                              height: 10,
                            ),
                            _showMrp(context)
                          ],
                        ),
                        _showDscount(context)
                      ],
                    ),
                    _showTitle(context)
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[_flowerRail()],
        ),
        //if you want full rail place row here
      ]);
    });
  }
}

Widget _showMrp(BuildContext context) {
  return CustomPaint(
    painter: ScrachMrp(),
    child: Row(
      children: <Widget>[
        /*  FaIcon(
          FontAwesomeIcons.rupeeSign,
          color: Colors.white,
          size: 17.0,
        ),*/
        Text(" itemMrp".toString(), //itemMrp.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                color: Colors.white)),
      ],
    ),
  );
}

Widget _showSellingPrice(BuildContext context) {
  return Row(
    children: <Widget>[
      /*   FaIcon(
        FontAwesomeIcons.rupeeSign,
        color: Colors.white,
        size: 26.0,
      ),*/ //Selling price, a tyo occure string is not a sub of double
      Text("   itemSellingPrice".toString(), //itemSellingPrice.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28.0,
              color: Colors.white)),
    ],
  );
}

Widget _showDscount(BuildContext context) {
  final deviceHeight = MediaQuery.of(context).size.height;
  final deviceWidth = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.all(2.0),
    margin: EdgeInsets.only(left: 20.0),
    alignment: Alignment.center,
    width: deviceWidth * 0.08,
    height: deviceHeight * 0.08,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.green,
    ),
    child: FittedBox(
      child: Text(
        " discount".toString(),
        //   discount.toString(),
        //NAN error showing shoud set
        // "${editorProvider.discound.toStringAsFixed(0)} %",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        // textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget _showTitle(BuildContext context) {
  final deviceHeight = MediaQuery.of(context).size.height;
  final deviceWidth = MediaQuery.of(context).size.width;
  return ConstrainedBox(
    constraints: BoxConstraints(
        maxWidth: deviceWidth * 0.80, maxHeight: deviceHeight * 0.05),
    child: Text(
      "itemTitle,,",
      //  itemTitle,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.normal, fontSize: 23),
    ),
  );
}

Widget _flowerRail() {
  return BlocBuilder<FlowerBloc, FlowerState>(builder: (context, state) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth * 0.15,
      height: deviceHeight * 0.7,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.white38.withOpacity(0.2)],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.7],
              tileMode: TileMode.clamp)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
    );
  });
}

class ScrachMrp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var horizontalLine = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;
    canvas.drawLine(
        Offset(0, size.height - 4), Offset(size.width, 4), horizontalLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // false or true
    return true;
  }
}
