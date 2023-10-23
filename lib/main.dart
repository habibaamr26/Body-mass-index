import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared%20prefrence/shared.dart';
import 'package:news_app/dio.dart';
import 'package:hexcolor/hexcolor.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout/news.dart';
import 'opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  await cachHelper.init();
   var isdark=cachHelper.getdata(key: 'isdark');
  runApp( MyApp(isdark));
}

class MyApp extends StatelessWidget {
   var isdark;
  MyApp(this.isdark);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context)=>  NewsBloc()..changeThemeData(x:isdark)),
        BlocProvider(create: (BuildContext context)=>  NewsBloc()..getbusness()
          ..getsports()
          ..getSsc(),)
      ],
        child: BlocConsumer<NewsBloc, NewsStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  )),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.pink,
                unselectedItemColor: Colors.grey,
                elevation: 20,
              ),
              textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
            ),
//0xff494746  HexColor('333739')
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Color(0xff333739),
                primarySwatch: Colors.pink,
                appBarTheme: const AppBarTheme(
                    color: Color(0xff333739),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Color(0xff333739),
                        statusBarIconBrightness: Brightness.light),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    )),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color(0xff333739),
                  selectedItemColor: Colors.pink,
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                ),
                textTheme: TextTheme(
                    bodyLarge: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white))),
            themeMode: NewsBloc.get(context).isdark?ThemeMode.dark:ThemeMode.light,
            home: news_layout(),
          ),
        ),

    );
  }
}
