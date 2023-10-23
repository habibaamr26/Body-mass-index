import 'package:flutter/cupertino.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../reusable_componant.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsStates>(
        listener: (context, state) => {},
        builder: (context, state) => ListView.separated(
          physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>ConditionalBuilder(
                  condition: state is ! BusinessGetDatasloading ,
                  builder:(context) =>itemshape(article:NewsBloc.get(context).busness[index],context: context),
                  fallback:(context)=> const Center(child: CircularProgressIndicator())),
              separatorBuilder: (BuildContext context, int index) =>
              seperator() ,
              itemCount:NewsBloc.get(context).busness.length ,
            ));
  }
}
