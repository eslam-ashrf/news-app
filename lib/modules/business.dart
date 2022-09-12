import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import '../shared/components/components.dart';
import '../shared/cubit/states.dart';

class NewsBusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
    builder: (context, state) {
    return NewsCubit.get(context).business.length>0?
    ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>buildArticleItem(NewsCubit.get(context).business[index],context),
    separatorBuilder: (context,index)=>Padding(padding: EdgeInsetsDirectional.only(start: 20),
    child: Container(height: 1,width: double.infinity,color: Colors.grey[300],)),
    itemCount:NewsCubit.get(context).business.length): Center(child: CircularProgressIndicator());
    });
  }
}
