

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';

import '../cubit/states.dart';
import '../reusable_componant.dart';

class Search extends StatelessWidget {

  TextEditingController? searchcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc,NewsStates>
      (builder: (BuildContext context, state) =>Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchcontroller,
              onChanged: (v){
                NewsBloc.get(context).getsearch(value: v);
                print(v);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                ),
                labelText: "Search",
                suffixIcon: Icon(Icons.search),

              ),
            ),
          ),

          Expanded(child: artucalebuilder(list:NewsBloc.get(context).search,context: context )),

        ],
      ),
    ),
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
