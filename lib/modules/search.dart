import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';

import '../shared/components/components.dart';
import '../shared/cubit/states.dart';

class NewsSearchScreen extends StatelessWidget {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              titleSpacing:0,
            title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: formField(
                    height: 48,
                    controller: controller,
                    keyboardType: TextInputType.text,
                    prefix: Icons.search,
                    label: "search",
                    onSubmit: (value) {print(value);
                    NewsCubit.get(context).getSearch(value!);
                    })),
          ),
            body: Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: NewsCubit.get(context).search.length > 0
                    ? ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildArticleItem(NewsCubit.get(context).search[index],context),
                    separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey[300],
                        )),
                    itemCount: NewsCubit.get(context).search.length)
                    : Center(child: CircularProgressIndicator())));
      },
    );
  }
}
