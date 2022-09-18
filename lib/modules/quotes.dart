import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/layout/cubit/cubit.dart';
import 'package:game_of_thrones_api/layout/cubit/states.dart';

class QuotesScreen extends StatelessWidget {
  static const String id = 'quotesPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var list = BbCubit.get(context).characters;
          return Scaffold(
            appBar: AppBar(
                title: const Text(" Quotes  "),
                backgroundColor: Colors.lime,
                centerTitle: true),
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 30),
                  itemBuilder: (context, index) => quotesBuild(context, index),
                  // itemCount: list.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: BbCubit.get(context).breakingBadQuotes.length,
                ),
              ),
            ),
          );
        });
  }

  Widget quotesBuild(context, index) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
          bottomStart: Radius.circular(20),
          bottomEnd: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: Colors.black.withOpacity(.5),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${BbCubit.get(context).breakingBadQuotes[index]['quote_id']}",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Center(
                child: Text(
                  "${BbCubit.get(context).breakingBadQuotes[index]['quote']}",
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Text(
                "${BbCubit.get(context).breakingBadQuotes[index]['author']}",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
