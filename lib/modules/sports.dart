import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import '../shared/components/components.dart';
import '../shared/cubit/states.dart';

class NewsSportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return NewsCubit.get(context).sports.length > 0
              ? ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(NewsCubit.get(context).sports[index],context),
                  separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsetsDirectional.only(start: 20),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[300],
                      )),
                  itemCount: NewsCubit.get(context).sports.length)
              : Center(child: CircularProgressIndicator());
        });
  }
}
