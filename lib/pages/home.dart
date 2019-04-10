import 'package:sunlibrate/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  double scH, scW;SunBloc b;Color wh = Colors.white; List w;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: b,
      builder: (ctx, d) {
        w = <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.indigo[900],
                  Colors.yellow[800],
                ])),
          ),
          gP(d.p, "", true),
          Positioned(
              top: scH * 0.1,
              child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: wh,
                      )),
                  child: gT("${d.l}\n${DateFormat("d MMMM, h:mma").format(d.n)}", 20))),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                gT(d.b, 18),
                Container(
                  color: wh,
                  height: 1,
                  width: scW * 0.65,
                ),
                gT(d.a, 18),
              ]
          ),
          Positioned(
              top: 0.7 * scH,
              child: gI(Icons.add_circle, () {di("Add Event Dialog");})
          )
        ];
        d.e.forEach((y) => w.add(gP(y.p, y.l, false)));
        return SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: w
            )
          ),
        );
      }
    );
  }
  gT(String s, double w) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Text(s,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: w,
            letterSpacing: 3,
            color: wh,
          )),
    );}
  gP(double p, String t, bool s) {
    return p < 0
        ? Positioned(
      top: scH * p * -1 - 60 + (s ? 0 : 36),
      left: s ? -60 : 0,
      child: s ? Image.asset(
        "assets/n.png",
        height: 120,
        width: 120,
      ) : gI(Icons.event, () {di(t);}),
    )
        : Positioned(
      bottom: scH * p - 60  + (s ? 0 : 36),
      right: s ? -60 : 0,
      child: s ? Image.asset(
        "assets/d.png",
        height: 120,
        width: 120,
      ) : gI(Icons.event, () {di(t);}));}
  gI(IconData i, Function f) {
    return IconButton(
      color: wh,
      iconSize: 36,
      icon: Icon(i),
      onPressed: f,
    );}
  di(String t) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                alignment: Alignment.center,
                height: scH * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(t, textAlign: TextAlign.center),
                    RaisedButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              ));
        });}
  @override
  void dispose() {
    b.dispose();
    super.dispose();}
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    b = BlocProvider.of<SunBloc>(context);
    scH = MediaQuery.of(context).size.height;
    scW = MediaQuery.of(context).size.width;}
}
