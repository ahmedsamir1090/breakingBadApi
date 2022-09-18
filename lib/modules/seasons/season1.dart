import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/layout/cubit/cubit.dart';
import 'package:game_of_thrones_api/layout/cubit/states.dart';

class Season1Screen extends StatelessWidget {
  static const String id = 'season1Screen';

  const Season1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var list = BbCubit.get(context).characters;
          return Scaffold(
            appBar: AppBar(
                title: const Text(" Season 1  "),
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
                    itemBuilder: (context, index) =>
                        season1Build(context, index),
                    shrinkWrap: true,
                    itemCount: BbCubit.get(context).season1.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget season1Build(context, index) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
      child: Container(
        color: Colors.black.withOpacity(.5),
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(
            "${BbCubit.get(context).season1[index]['title']}",
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
