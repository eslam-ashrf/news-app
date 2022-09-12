import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business.dart';
import 'package:news/modules/science.dart';
import 'package:news/modules/sports.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/network/local/cash_helper.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    NewsBusinessScreen(),
    NewsSportsScreen(),
    NewsScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_rounded), label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
  ];
  void ChangeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavBArState());
  }

  List business = [];
  List sports = [];
  List science = [];
  List search = [];

  void getBusiness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '7d28d6d4a75f43c29f1209d06debac2b'
    }).then((value) {
      business = value?.data['articles'];
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessDataErrorState(error));
    });
  }

  void getSports() {
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '7d28d6d4a75f43c29f1209d06debac2b'
      }).then((value) {
        sports = value?.data['articles'];
        emit(NewsGetSportsDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsDataErrorState(error));
      });
    } else {
      emit(NewsGetSportsDataSuccessState());
    }
  }

  void getScience() {
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '7d28d6d4a75f43c29f1209d06debac2b'
      }).then((value) {
        science = value?.data['articles'];
        print(science);
        emit(NewsGetScienceDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceDataErrorState(error));
      });
    } else {
      emit(NewsGetScienceDataSuccessState());
    }
  }

  void getSearch(String data) {
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$data',
      'apiKey': '7d28d6d4a75f43c29f1209d06debac2b'
    }).then((value) {
      search = value?.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchDataErrorState(error));
    });
  }

  bool isDark = false;
  void changeMode({bool? nodark}) {
    if (nodark != null) {
      isDark = nodark;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.setData(key: "isDark", value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
