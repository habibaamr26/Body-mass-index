import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/shared.dart';
import 'package:news_app/cubit/states.dart';

import '../dio.dart';
import '../modules/bussines_module.dart';
import '../modules/scince_module.dart';
import '../modules/sports_module.dart';

class NewsBloc extends Cubit<NewsStates>{
  NewsBloc():super(InitialState());
  //to take an instance from class to access any thing
  static NewsBloc get(context)=>BlocProvider.of(context);
//list of screen of home layout
List <Widget> Screens=[
  BusinessScreen(),
  SciencesScreen(),
   SportsScreen(),
  ];
  int SelectedItemInBottomNav=0;

  void ChangeInBottomNav(value){
    SelectedItemInBottomNav=value;
    emit(NewsBottomNavigation());
  }
  List<dynamic > busness=[];
  List<dynamic > sports=[];
  List<dynamic > science=[];
  List<dynamic > search=[];
  void getbusness()
  {
    emit(BusinessGetDatasloading ());
    if(busness.length==0) {
      DioHelper.getData(path: 'v2/top-headlines',
          queryParameters: {
            "country": "us",
            "category": "business",
            "apiKey": "66b5a55516a24d118a228a1ab414f169",
          }).then((value) {
        busness = value!.data['articles'];
        emit(BusinessGetDatasSucces());
      }).catchError((e) {
        print("habiba${e.toString()}");
        emit(BusinessGetDatasfaler(e.toString()));
      });
    }
    else
      emit(BusinessGetDatasSucces());
  }
  void getsports()
  {
    emit(SportsGetDatasloading ());
    if(sports.length==0) {
      DioHelper.getData(path: 'v2/top-headlines',
          queryParameters: {
            "country": "us",
            "category": "sports",
            "apiKey": "66b5a55516a24d118a228a1ab414f169",
          }).then((value) {
        sports = value!.data['articles'];
        print("${sports[0]['title']}hhhhhhhhhhhh");
        emit(SportsGetDatasSucces());
      }).catchError((e) {
        print("habiba${e.toString()}");
        emit(SportsGetDatasfaler(e.toString()));
      });
    }else
      emit(SportsGetDatasSucces());
  }

  void getssc()
  {
    emit(SCGetDatasloading ());
    if(science.length==0) {
      DioHelper.getData(path: 'v2/top-headlines',
          queryParameters: {
            "country": "us",
            "category": "science",
            "apiKey": "66b5a55516a24d118a228a1ab414f169",
          }).then((value) {
        science = value!.data['articles'];
        print("${science[0]['title']}hhhhhhhhhhhh");
        emit(SCGetDatasSucces());
      }).catchError((e) {
        print("habiba${e.toString()}");
        emit(SCGetDatasfaler(e.toString()));
      });
    }
    else
      emit(SCGetDatasSucces());
  }



  void getsearch({
     String? value,
})
  {

      DioHelper.getData(path: 'v2/everything',
          queryParameters: {
            "q": value,
            "apiKey": "66b5a55516a24d118a228a1ab414f169",
          }).then((value) {
        search = value!.data['articles'];
        print("${search[0]['title']}hhhhhhhhhhhh");
        emit(searchSucces());
      }).catchError((e) {
        print("habiba${e.toString()}");
        emit(searchfail());
      });
  }



  bool isdark=false;

  void changeThemeData ( {bool? x}){

    if(x!=null)
      {
        isdark=x;
        emit(themechangel());
      }
    else {
      isdark = !isdark;
      cachHelper.putdata(key: 'isdark', value: isdark).then((value) {
        emit(themechangel());
      });

    }
  }


}


















