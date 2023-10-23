import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:dio/dio.dart';
import 'package:news_app/dio.dart';
import '../cubit/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/search_module.dart';

//
class news_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state){
        var cubit=NewsBloc.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Search()));
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              cubit.changeThemeData();
            }, icon: Icon(Icons.brightness_4_outlined)),
          ],
        ),
        body: cubit.Screens[cubit.SelectedItemInBottomNav],


        bottomNavigationBar: BottomNavigationBar(

            currentIndex: cubit.SelectedItemInBottomNav,
            onTap: (value) {
              cubit.ChangeInBottomNav(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: "business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined), label: "science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "sports"),
            ],
          ),

      );

        },


    );
  }
}
