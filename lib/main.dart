import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/layout/breaking_bad.dart';
import 'package:game_of_thrones_api/layout/cubit/cubit.dart';
import 'package:game_of_thrones_api/layout/cubit/states.dart';
import 'package:game_of_thrones_api/modules/character.dart';
import 'package:game_of_thrones_api/modules/quotes.dart';
import 'package:game_of_thrones_api/modules/seasons.dart';
import 'package:game_of_thrones_api/modules/seasons/season1.dart';
import 'package:game_of_thrones_api/modules/seasons/season2.dart';
import 'package:game_of_thrones_api/modules/seasons/season3.dart';
import 'package:game_of_thrones_api/modules/seasons/season4.dart';
import 'package:game_of_thrones_api/modules/seasons/season5.dart';
import 'package:game_of_thrones_api/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit()
        ..getCharactersData()
        ..getEpisodesData()
        ..getQuotesData(),
      child: BlocConsumer<BbCubit, BbStates>(
        builder: (context, state) => MaterialApp(
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
            CharactersScreen.id: (context) => CharactersScreen(),
            SeasonsScreen.id: (context) => const SeasonsScreen(),
            QuotesScreen.id: (context) => QuotesScreen(),
            Season1Screen.id: (context) => const Season1Screen(),
            Season2Screen.id: (context) => const Season2Screen(),
            Season3Screen.id: (context) => const Season3Screen(),
            Season4Screen.id: (context) => const Season4Screen(),
            Seasons5Screen.id: (context) => const Seasons5Screen(),
          },
        ),
        listener: (context, state) {},
      ),
    );
  }
}
