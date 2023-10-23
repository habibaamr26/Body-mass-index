import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/webview.dart';

import 'cubit/cubit.dart';

Widget itemshape( {
  required article,
  context
}) => InkWell(
  onTap: ()
  {
    geturl(articalurl: article['url']);
  },
  child:   Padding(

        padding: const EdgeInsets.all(20.0),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(

              clipBehavior: Clip.antiAliasWithSaveLayer,

              width: double.infinity,

              height: 200,

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),

              child: Image(

                  fit: BoxFit.cover,

                  image: article['urlToImage']==null?

                  NetworkImage(

                      'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'):NetworkImage(

                      '${article['urlToImage']}')

              ),

            ),

            SizedBox(

              height: 10,

            ),

            Text(

              "${article['title']}",

              style:Theme.of(context).textTheme.bodyLarge,

              maxLines: 2,

              overflow: TextOverflow.ellipsis,

            ),

            Text(

              "${article['publishedAt'].toString()}",

              style: TextStyle(

                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),

            ),

          ],

        ),

      ),
);


Widget artucalebuilder( {
  required List list,
  context
}) => ConditionalBuilder(
    condition: list.length>0,
    builder:(context) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) =>itemshape(article:NewsBloc.get(context).search[index],context: context),
        separatorBuilder: (BuildContext context, int index) =>seperator(),
        itemCount: NewsBloc.get(context).search.length);
    } ,



    fallback:(context)=> const Center(child: CircularProgressIndicator())
);


Widget seperator()=>Container(
  height: 5,
  width: double.infinity,
  color: Colors.grey,
);
