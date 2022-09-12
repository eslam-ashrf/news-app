import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

import '../modules/search.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News"),
              actions: [
                IconButton(
                  onPressed: () {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>NewsSearchScreen()
                    ));
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  },
                  icon: Icon(Icons.brightness_4),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (Index) {
                cubit.ChangeIndex(Index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
