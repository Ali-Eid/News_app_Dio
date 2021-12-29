import 'package:dip_app/layout/counter.dart';
import 'package:dip_app/layout/first_page.dart';
import 'package:dip_app/service/dio_helper.dart';
// import 'package:dip_app/shared/constants/observe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/Counter/bloc/news_bloc.dart';
//import 'dart:html';

// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // BlocOverrides.runZoned(
  //   () {
  //     // Use blocs...
  //   },
  //   blocObserver: MyBlocObserver(),
  // );
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => NewsSportBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),
            scaffoldBackgroundColor: Colors.white,
            // backgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 0)),
        home: FirstPage(),
      ),
    );
  }
}
