import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:BrakingBad/models/movie.dart';
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
      poster: "assets/images/characters.jpg",
      route: CharactersScreen.id,
    ),
    MainScreen(
      title: "Seasons",
      poster: "assets/images/episodes.jpg",
      route: SeasonsScreen.id,
    ),
    MainScreen(
      title: "Quotes",
      poster: "assets/images/quotes.jpg",
      route: QuotesScreen.id,
    ),
  ];

  List<MainScreen> seasons = [
    MainScreen(
      title: "season 1",
      poster: "assets/images/season1.jpg",
      route: Season1Screen.id,
    ),
    MainScreen(
      title: "season 2",
      poster: "assets/images/season2.jpg",
      route: Season2Screen.id,
    ),
    MainScreen(
      title: "season 3",
      poster: "assets/images/season3.jpg",
      route: Season3Screen.id,
    ),
    MainScreen(
      title: "season 4",
      poster: "assets/images/season4.jpg",
      route: Season4Screen.id,
    ),
    MainScreen(
      title: "season 5",
      poster: "assets/images/season5.jpg",
      route: Seasons5Screen.id,
    ),
  ];
  void getCharactersData() {
    emit(BbCharLoadingState());
    DioHelper.getData(url: Characters).then((value) {
      character = value.data;

      emit(BbCharSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(BbCharErrorState());
    });
  }

  void getCharactersSearchedData(String name) {
    characterSearched = [];
    emit(BbCharSearchLoadingState());
    DioHelper.getData(url: Characters).then((value) {
      character = value.data;
      characterSearched = character
          .where((element) =>
              (element['name']).toLowerCase().startsWith(name) ||
              (element['name']).toLowerCase().contains(name))
          .toList();
      emit(BbCharSearchSuccessState());
    }).catchError((onError) {
      print(onError);
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
      print(onError);
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

      print(breakingBadQuotes.length);

      print(walterWhiteQuotes.length);
      print(skylerWhiteQuotes.length);
      print(jessePinkManQuotes.length);
      print(saulGoodmanQuotes.length);
      print(mikeEhrmantrautQuotes.length);
      print(hectorSalamancaQuotes.length);
      print(gusFringQuotes.length);
      print(hankSchraderQuotes.length);

      emit(BbQuotesSuccessState());
    }).catchError((onError) {
      print(onError);
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
      print(onError);
      emit(BbCharQuotesErrorState());
    });
  }
}
