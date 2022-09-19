import 'package:BrakingBad/layout/cubit/cubit.dart';
import 'package:BrakingBad/layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
                title: Text("Quotes",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontFamily: 'Lora')),
                backgroundColor: Colors.lime,
                centerTitle: true),
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9.w / 8.8.h,
                      mainAxisSpacing: 2.h,
                      crossAxisSpacing: 4.w),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(3.h),
            topEnd: Radius.circular(3.h),
            bottomStart: Radius.circular(2.h),
            bottomEnd: Radius.circular(2.h)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: Colors.black.withOpacity(.5),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 2.h, end: 2.h),
              child: Center(
                child: Text(
                  "${BbCubit.get(context).breakingBadQuotes[index]['quote']}",
                  style: TextStyle(
                      color: Colors.white, fontSize: 11.sp, height: .14.h),
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(.6),
              width: double.infinity,
              height: 4.h,
              child: Center(
                child: Text(
                  "${BbCubit.get(context).breakingBadQuotes[index]['author']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RobotoMono",
                      fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
