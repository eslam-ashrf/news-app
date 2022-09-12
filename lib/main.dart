import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/local/cash_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'bloc_observer.dart';
import 'layout/home_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CashHelper.init();
 bool? isDark= CashHelper.getData(key: "isDark");
  BlocOverrides.runZoned(
    () {
      runApp( MyApp(isDark
           ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
final bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness()..changeMode(nodark:isDark),
        child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
    builder: (context, state) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:  AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 27,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.deepOrange,
                statusBarBrightness: Brightness.light,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 5,
                backgroundColor: Colors.white70,
                selectedItemColor: Colors.deepOrange),
            textTheme: TextTheme(
              bodyText1:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ) ,
            )
        ),
        darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: HexColor("333739"),
            appBarTheme:  AppBarTheme(
              backgroundColor: HexColor("333739"),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(
                color: Colors.white,
                size: 27,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.deepOrange,
                statusBarBrightness: Brightness.light,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 5,
                backgroundColor: HexColor("333739"),
                selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey
            ),
          textTheme: TextTheme(
            bodyText1:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ) ,
          )
        ),
        themeMode:NewsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: HomeLayout());
  }),
    );
}
}
