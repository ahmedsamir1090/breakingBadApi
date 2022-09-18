import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/layout/cubit/states.dart';
import 'package:game_of_thrones_api/models/movie.dart';
import 'package:game_of_thrones_api/modules/character.dart';
import 'package:game_of_thrones_api/modules/quotes.dart';
import 'package:game_of_thrones_api/modules/seasons.dart';
import 'package:game_of_thrones_api/modules/seasons/season1.dart';
import 'package:game_of_thrones_api/modules/seasons/season2.dart';
import 'package:game_of_thrones_api/modules/seasons/season3.dart';
import 'package:game_of_thrones_api/modules/seasons/season4.dart';
import 'package:game_of_thrones_api/modules/seasons/season5.dart';
import 'package:game_of_thrones_api/network/endpoints.dart';
import 'package:game_of_thrones_api/network/remote/dio_helper.dart';

class BbCubit extends Cubit<BbStates> {
  BbCubit() : super(BbInitiState());
  static BbCubit get(context) => BlocProvider.of(context);
  List<dynamic> character = [];
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
      print(season1);

      emit(BbEpisodesSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(BbEpisodesErrorState());
    });
  }

  List<dynamic> quote = [];
  List<dynamic> breakingBadQuotes = [];

  void getQuotesData() {
    emit(BbQuotesLoadingState());
    DioHelper.getData(url: QUOTES).then((value) {
      quote = value.data;
      breakingBadQuotes = quote
          .where((element) => element["series"] == "Breaking Bad")
          .toList();
      emit(BbQuotesSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(BbQuotesErrorState());
    });
  }
}
