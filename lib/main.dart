import 'package:BrakingBad/layout/breaking_bad.dart';
import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:BrakingBad/modules/character.dart';
import 'package:BrakingBad/modules/quotes.dart';
import 'package:BrakingBad/modules/seasons.dart';
import 'package:BrakingBad/modules/seasons/season1.dart';
import 'package:BrakingBad/modules/seasons/season2.dart';
import 'package:BrakingBad/modules/seasons/season3.dart';
import 'package:BrakingBad/modules/seasons/season4.dart';
import 'package:BrakingBad/modules/seasons/season5.dart';
import 'package:BrakingBad/network/remote/dio_helper.dart';
import 'package:BrakingBad/shared/bloc_observ.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'modules/search.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await DioHelper.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit(),
      child: BlocConsumer<BbCubit, BbStates>(
        builder: (context, state) => Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const BbScreen(),
            routes: {
              BbScreen.id: (context) => const BbScreen(),
              CharactersScreen.id: (context) => const CharactersScreen(),
              SeasonsScreen.id: (context) => const SeasonsScreen(),
              QuotesScreen.id: (context) => const QuotesScreen(),
              Season1Screen.id: (context) => const Season1Screen(),
              Season2Screen.id: (context) => const Season2Screen(),
              Season3Screen.id: (context) => const Season3Screen(),
              Season4Screen.id: (context) => const Season4Screen(),
              Seasons5Screen.id: (context) => const Seasons5Screen(),
              SearchScreen.id: (context) => const SearchScreen(),
            },
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
