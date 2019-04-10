import 'dart:async';
import 'package:bloc/bloc.dart';
class SunBloc extends Bloc<DataRequestEvent, SunData> {
  SunData get initialState => _getMock();
  @override
  Stream<SunData> mapEventToState(SunData currentState,DataRequestEvent event) {return null;}
  _getMock() {
    return SunData(
      "140 min before sunrise",
      "621 min after sunset",
      "Yambol, BG",
      -0.816,
      DateTime.parse("2019-03-03 02:26:00"),
      [SunEvent("Yoga\n60 min after sunrise", 0.09), SunEvent("Go to bed\n20 min after sunset", -0.03)]
    );}}
enum DataRequestEvent {get}
class SunData {
  String b,a,l;double p;DateTime n;List<SunEvent> e;
  SunData(this.b, this.a, this.l, this.p, this.n, this.e);}
class SunEvent {
  String l;double p;
  SunEvent(this.l, this.p);}
