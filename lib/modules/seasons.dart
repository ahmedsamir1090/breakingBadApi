import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/layout/cubit/cubit.dart';
import 'package:game_of_thrones_api/layout/cubit/states.dart';
import 'package:game_of_thrones_api/models/movie.dart';

class SeasonsScreen extends StatelessWidget {
  static const String id = 'episodesPage';

  const SeasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var list = BbCubit.get(context).characters;
          return Scaffold(
            appBar: AppBar(
                title: const Text(" Episodes  "),
                backgroundColor: Colors.lime,
                centerTitle: true),
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 9 / 16,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return mainScreenBuild(
                          BbCubit.get(context).seasons[index], context);
                    },
                    // itemCount: list.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: BbCubit.get(context).seasons.length,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget mainScreenBuild(MainScreen mainScreen, context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, mainScreen.route);
        },
        child: Stack(children: [
          Image.asset(
            mainScreen.poster,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(.8),
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  mainScreen.title,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
