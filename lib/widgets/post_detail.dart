import 'package:flutter/material.dart';
import 'package:lutr/models/Post.dart';

Widget postDetail({ Post post, Size size }) {
  
  return Container(
      child: Column(
        
         children: <Widget>[

            Container(
              height: size.height/4,
              child: Image.asset('assets/unnamed.jpg', ),
            ),
            Container(

              child: Column(
                children: <Widget>[

                  Text(post.title),
                  Text(post.body)

                ],
              ),

            )
 

         ],

      ),
  );

}