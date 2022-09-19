import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:BrakingBad/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SeasonsScreen extends StatelessWidget {
  static const String id = 'episodesPage';

  const SeasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Seasons",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontFamily: 'Lora')),
                backgroundColor: Colors.lime,
                centerTitle: true),
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9.w / 8.8.h,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 4.w),
                      itemBuilder: (context, index) {
                        return mainScreenBuild(
                            BbCubit.get(context).seasons[index], context);
                      },
                      // itemCount: list.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: BbCubit.get(context).seasons.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget mainScreenBuild(MainScreen mainScreen, context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(3.h),
          topEnd: Radius.circular(3.h),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            mainScreen.route,
          );
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
              height: 4.h,
              width: double.infinity,
              child: Center(
                child: Text(
                  mainScreen.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontFamily: "RobotoMono"),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
