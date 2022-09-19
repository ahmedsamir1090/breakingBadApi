import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:BrakingBad/modules/character_details.dart';
import 'package:BrakingBad/modules/search.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CharactersScreen extends StatelessWidget {
  static const String id = 'characterPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit()..getCharactersData(),
      child: BlocConsumer<BbCubit, BbStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // var list = BbCubit.get(context).characters;
            return Scaffold(
              appBar: AppBar(
                  title: Text("Characters",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontFamily: "Lora")),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SearchScreen.id);
                        },
                        icon: Icon(Icons.search))
                  ],
                  backgroundColor: Colors.lime,
                  centerTitle: true),
              backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
              body: ConditionalBuilder(
                builder: (context) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 2.5.h, bottom: 2.5.h, left: 1.0.h, right: 1.0.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9.w / 8.8.h,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 4.w),

                      itemBuilder: (context, index) =>
                          characterBuild(context, index),
                      // itemCount: list.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: BbCubit.get(context).character.length,
                    ),
                  ),
                ),
                condition: state is! BbCharLoadingState,
                fallback: (context) => Image.asset(
                  "assets/images/98742-loading.gif",
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            );
          }),
    );
  }

  Widget characterBuild(context, index) {
    String nameOfChar = BbCubit.get(context).character[index]['name'];
    String imageOfChar = BbCubit.get(context).character[index]['img'];
    String nicknameOfChar = BbCubit.get(context).character[index]['nickname'];
    List<dynamic> occupation =
        BbCubit.get(context).character[index]['occupation'];
    String portrayed = BbCubit.get(context).character[index]['portrayed'];
    String birthDay = BbCubit.get(context).character[index]['birthday'];
    List<dynamic> appearance =
        BbCubit.get(context).character[index]['appearance'];

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
