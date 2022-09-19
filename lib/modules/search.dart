import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'character_details.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search';
  static GlobalKey formKey = GlobalKey<FormState>();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var list = BbCubit.get(context).characters;
          return Form(
            key: SearchScreen.formKey,
            child: Scaffold(
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          controller: searchController,
                          decoration: const InputDecoration(
                              hintText: "Search......",
                              hintStyle: TextStyle(fontSize: 18),
                              fillColor: Colors.white,
                              filled: true),
                          style: const TextStyle(color: Colors.black),
                          onChanged: (value) {
                            selectedValue = value;
                            BbCubit.get(context)
                                .getCharactersSearchedData(selectedValue!);
                            print(selectedValue);
                          },
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                  ],
                  backgroundColor: Colors.lime,
                ),
                backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
                body: ConditionalBuilder(
                  builder: (context) => ConditionalBuilder(
                    builder: (context) => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 25, left: 10, right: 10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 9 / 16,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 30),
                          itemBuilder: (context, index) =>
                              characterBuild(context, index),
                          // itemCount: list.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              BbCubit.get(context).characterSearched.length,
                        ),
                      ),
                    ),
                    fallback: (context) => Center(child: Text("Not Founded")),
                    condition:
                        BbCubit.get(context).characterSearched.isNotEmpty,
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  condition: state is! BbCharSearchLoadingState,
                )),
          );
        });
  }

  Widget characterBuild(context, index) {
    String nameOfChar = BbCubit.get(context).characterSearched[index]['name'];
    String imageOfChar = BbCubit.get(context).characterSearched[index]['img'];
    String nicknameOfChar =
        BbCubit.get(context).characterSearched[index]['nickname'];
    List<dynamic> occupation =
        BbCubit.get(context).characterSearched[index]['occupation'];
    String portrayed =
        BbCubit.get(context).characterSearched[index]['portrayed'];
    String birthDay = BbCubit.get(context).characterSearched[index]['birthday'];
    List<dynamic> appearance =
        BbCubit.get(context).characterSearched[index]['appearance'];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h),
      child: Stack(children: [
        CachedNetworkImage(
          imageUrl: imageOfChar,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          placeholder: (context, url) => Image.asset(
              'assets/images/loading.gif',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterDetails(
                      nameOfChar,
                      imageOfChar,
                      nicknameOfChar,
                      occupation,
                      portrayed,
                      birthDay,
                      appearance,
                    ),
                  ));
            },
            child: Container(
              color: Colors.black.withOpacity(.5),
              height: 4.h,
              width: double.infinity,
              child: Center(
                child: Text(
                  nameOfChar,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                    fontSize: 12.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
