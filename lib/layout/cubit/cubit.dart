import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:BrakingBad/models/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/character.dart';
import '../../modules/quotes.dart';
import '../../modules/seasons.dart';
import '../../modules/seasons/season1.dart';
import '../../modules/seasons/season2.dart';
import '../../modules/seasons/season3.dart';
import '../../modules/seasons/season4.dart';
import '../../modules/seasons/season5.dart';
import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';

class BbCubit extends Cubit<BbStates> {
  BbCubit() : super(BbInitiState());
  static BbCubit get(context) => BlocProvider.of(context);
  List<dynamic> character = [];
  List<dynamic> characterSearched = [];

  List<MainScreen> movies = [
    MainScreen(
      title: "Characters",
      poster:
          "https://www.themoviedb.org/t/p/original/3cWI8ZxgfPTGarwCUVEQCSoO8Vd.jpg",
      route: CharactersScreen.id,
    ),
    MainScreen(
      title: "Seasons",
      poster:
          "https://i.pinimg.com/564x/ff/08/b8/ff08b8d87206e19a8ceced1b582467d2.jpg",
      route: SeasonsScreen.id,
    ),
    MainScreen(
      title: "Quotes",
      poster:
          "https://64.media.tumblr.com/bf72bdb09be2939c4675b601bb145cb0/tumblr_pq2tepm93W1qzpxx1o1_1280.jpg",
      route: QuotesScreen.id,
    ),
  ];

  List<MainScreen> seasons = [
    MainScreen(
      title: "season 1",
      poster:
          "https://i.pinimg.com/564x/55/df/3d/55df3de5f5ed6092b4f073bfbdb76214.jpg",
      route: Season1Screen.id,
    ),
    MainScreen(
      title: "season 2",
      poster:
          "https://i.pinimg.com/564x/66/e0/0d/66e00d4a33e2c0a20c5624a08919fba0.jpg",
      route: Season2Screen.id,
    ),
    MainScreen(
      title: "season 3",
      poster:
          "https://i.pinimg.com/564x/cd/63/9b/cd639b19e5355168e42fb74b41270fce.jpg",
      route: Season3Screen.id,
    ),
    MainScreen(
      title: "season 4",
      poster:
          "https://i.pinimg.com/564x/c3/75/c1/c375c11115fb981298f925352d798c93.jpg",
      route: Season4Screen.id,
    ),
    MainScreen(
      title: "season 5",
      poster:
          "https://i.pinimg.com/564x/de/19/ae/de19ae028f0a45a4987d80c76dec9151.jpg",
      route: Seasons5Screen.id,
    ),
  ];
  void getCharactersData() {
    emit(BbCharLoadingState());
    DioHelper.getData(url: Characters).then((value) {
      character = value.data;

      emit(BbCharSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbCharErrorState());
    });
  }

  void getCharactersSearchedData(String name) {
    characterSearched = [];
    emit(BbCharSearchLoadingState());
    DioHelper.getData(url: Characters).then((value) {
      character = value.data;
      characterSearched = character
          .where((element) => (element['name']).toLowerCase().startsWith(name))
          .toList();
      emit(BbCharSearchSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbCharSearchErrorState());
    });
  }

  List<dynamic> episode = [];
  List<dynamic> breakingBad = [];
  List<dynamic> betterCallSaul = [];
  List<dynamic> season1 = [];
  List<dynamic> season2 = [];
  List<dynamic> season3 = [];
  List<dynamic> season4 = [];
  List<dynamic> season5 = [];

  void getEpisodesData() {
    emit(BbEpisodesLoadingState());
    DioHelper.getData(url: EPISODES).then((value) {
      episode = value.data;

      season1 = episode
          .where((element) =>
              (element["season"] == "1" || element["season"] == " 1") &&
              element['series'] == "Breaking Bad")
          .toList();
      season2 = episode
          .where((element) =>
              (element["season"] == "2" || element["season"] == " 2") &&
              element['series'] == "Breaking Bad")
          .toList();
      season3 = episode
          .where((element) =>
              (element["season"] == "3" || element["season"] == " 3") &&
              element['series'] == "Breaking Bad")
          .toList();
      season4 = episode
          .where((element) =>
              (element["season"] == "4" || element["season"] == " 4") &&
              element['series'] == "Breaking Bad")
          .toList();
      season5 = episode
          .where((element) =>
              (element["season"] == "5" || element["season"] == " 5") &&
              element['series'] == "Breaking Bad")
          .toList();

      betterCallSaul = episode
          .where((element) => element["series"] == "Better Call Saul")
          .toList();

      breakingBad = episode
          .where((element) => element["series"] == "Breaking Bad")
          .toList();

      emit(BbEpisodesSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbEpisodesErrorState());
    });
  }

  List<dynamic> quote = [];
  List<dynamic> breakingBadQuotes = [];
  List<dynamic> charQuotes = [];

  List<dynamic> walterWhiteQuotes = [];
  List<dynamic> skylerWhiteQuotes = [];
  List<dynamic> jessePinkManQuotes = [];
  List<dynamic> saulGoodmanQuotes = [];
  List<dynamic> mikeEhrmantrautQuotes = [];
  List<dynamic> hectorSalamancaQuotes = [];
  List<dynamic> gusFringQuotes = [];
  List<dynamic> hankSchraderQuotes = [];

  void getQuotesData() {
    emit(BbQuotesLoadingState());
    DioHelper.getData(url: QUOTES).then((value) {
      quote = value.data;
      breakingBadQuotes = quote
          .where((element) => element["series"] == "Breaking Bad")
          .toList();
      walterWhiteQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Walter White')
          .toList();
      skylerWhiteQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Skyler White')
          .toList();
      jessePinkManQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Jesse Pinkman')
          .toList();
      saulGoodmanQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Saul Goodman')
          .toList();
      mikeEhrmantrautQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Mike Ehrmantraut')
          .toList();
      hectorSalamancaQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Hector Salamanca')
          .toList();
      gusFringQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Gus Fring')
          .toList();
      hankSchraderQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" &&
              element["author"] == 'Hank Schrader')
          .toList();

      if (kDebugMode) {
        print(breakingBadQuotes.length);
      }

      if (kDebugMode) {
        print(walterWhiteQuotes.length);
      }
      if (kDebugMode) {
        print(skylerWhiteQuotes.length);
      }
      if (kDebugMode) {
        print(jessePinkManQuotes.length);
      }
      if (kDebugMode) {
        print(saulGoodmanQuotes.length);
      }
      if (kDebugMode) {
        print(mikeEhrmantrautQuotes.length);
      }
      if (kDebugMode) {
        print(hectorSalamancaQuotes.length);
      }
      if (kDebugMode) {
        print(gusFringQuotes.length);
      }
      if (kDebugMode) {
        print(hankSchraderQuotes.length);
      }

      emit(BbQuotesSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbQuotesErrorState());
    });
  }

  void getcharQuote(String name) {
    emit(BbCharQuotesLoadingState());

    DioHelper.getData(url: QUOTES).then((value) {
      quote = value.data;
      charQuotes = quote
          .where((element) =>
              element["series"] == "Breaking Bad" && element["author"] == name)
          .toList();
      emit(BbCharQuotesSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbCharQuotesErrorState());
    });
  }
}
