import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunlibrate/blocs/home_bloc.dart';
import 'package:sunlibrate/pages/home.dart';
main() => runApp(MaterialApp(home: BlocProvider(bloc: SunBloc(),child: Home())));
