import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CharacterDetails extends StatelessWidget {
  String name;
  String image;
  String nickName;
  String portrayed;
  String? birthDay;
  List<dynamic> occupation;
  List<dynamic> appearance;

  CharacterDetails(this.name, this.image, this.nickName, this.occupation,
      this.portrayed, this.birthDay, this.appearance,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit()..getcharQuote(name),
      child: BlocConsumer<BbCubit, BbStates>(
        builder: (context, state) {
          print(BbCubit.get(context).charQuotes.length);
          return Scaffold(
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            appBar: AppBar(
              centerTitle: true,
              title: Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: "Lora")),
              backgroundColor: Colors.amberAccent,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                    imageUrl: image,
                    height: 50.h,
                    width: double.infinity,
                    fit: BoxFit.fill),
                SizedBox(
                  height: .5.h,
                ),
                Center(
                  child: Text(
                    nickName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: "RobotoMono"),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("the actor who played the character :",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 9.sp,
                                fontFamily: "RobotoMono")),
                      ),
                      Text(portrayed,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10.sp,
                              fontFamily: "RobotoMono")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                  height: 3.h,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 1.h),
                        child: Text("occupation :",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontFamily: "Lora")),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => Text(
                              occupation[index],
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.blueGrey)),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2.h),
                          itemCount: occupation.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                  height: 3.h,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 1.h,
                        ),
                        child: Text("The seasons in which appearance :",
                            style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.green,
                                fontFamily: "Lora")),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => Text(
                              appearance[index].toString(),
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.blueGrey)),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 3.h),
                          itemCount: appearance.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                SizedBox(
                  height: 8.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: ConditionalBuilder(
                            builder: (context) => Padding(
                              padding: EdgeInsets.all(2.h),
                              child: BbCubit.get(context).charQuotes.isEmpty ==
                                      false
                                  ? ListView.separated(
                                      itemBuilder: (context, index) =>
                                          quotesBuild(context, index),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 2.h),
                                      itemCount: 1,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                    )
                                  : Container(),
                            ),
                            condition: state is! BbCharQuotesLoadingState,
                            fallback: (context) => CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget quotesBuild(context, index) {
    return Row(
      children: [
        Text(
          "${BbCubit.get(context).charQuotes[0]['quote']}",
          style: TextStyle(color: Colors.amber, fontSize: 17.sp),
        ),
        SizedBox(
          width: 2.h,
        ),
        Text(
          "${BbCubit.get(context).charQuotes[1]['quote']}",
          style: TextStyle(color: Colors.amber, fontSize: 17.sp),
        ),
        SizedBox(
          width: 2.h,
        ),
        Text(
          "${BbCubit.get(context).charQuotes[2]['quote']}",
          style: TextStyle(color: Colors.amber, fontSize: 17.sp),
        ),
      ],
    );
  }
}
