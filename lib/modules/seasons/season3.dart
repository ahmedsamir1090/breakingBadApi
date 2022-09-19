import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Season3Screen extends StatelessWidget {
  static const String id = 'season3Page';

  const Season3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var list = BbCubit.get(context).characters;
          return Scaffold(
            appBar: AppBar(
                title: Text("Season Three",
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
                    padding: EdgeInsets.all(1.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9.w / 8.8.h,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 4.w),
                      itemBuilder: (context, index) =>
                          season3Build(context, index),
                      shrinkWrap: true,
                      itemCount: BbCubit.get(context).season3.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget season3Build(context, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(2.h),
          topEnd: Radius.circular(2.h),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: Colors.black.withOpacity(.6),
        height: 4.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 1.h,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 1.h,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            Text(
                              "Title : ",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 9.sp),
                            ),
                            Text(
                              "${BbCubit.get(context).season3[index]['title']}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 3.h,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            Text(
                              "Date of release :",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 9.sp),
                            ),
                            Text(
                              "${BbCubit.get(context).season3[index]['air_date']}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text('Characters :',
                                  style: TextStyle(
                                      fontSize: 6.5.sp, color: Colors.green)),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListView(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        top: 1.h, bottom: 0.h),
                                    child: Text(
                                        BbCubit.get(context)
                                            .season3[index]['characters']
                                            .toString()
                                            .replaceAll('[', '')
                                            .replaceAll(']', ''),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                            height: .13.h)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 4.h,
                color: Colors.white.withOpacity(.6),
                child: Center(
                  child: Text(
                    "episode ${BbCubit.get(context).season3[index]['episode']}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
