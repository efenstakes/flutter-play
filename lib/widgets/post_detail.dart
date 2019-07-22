import 'package:flutter/material.dart';
import 'package:lutr/models/Post.dart';

Widget postDetail({ Post post, Size size }) {
  
  return Container(
    
      // color: Colors.redAccent,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        
        border: Border.all( style: BorderStyle.solid, color: Colors.black ),
        // border: Border( 
        //   left: BorderSide( width: 10, style: BorderStyle.solid, color: Colors.blueAccent ),
        //   top: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.brown ),
        //   bottom: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.teal ),
        //   right: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.pink ),
        // ),
        borderRadius: BorderRadius.all( Radius.circular(30) )
      ),

      child: Column(
        
         children: <Widget>[

            Container(
              height: size.height/4,
              width: 300,
              // child: Image.asset('assets/unnamed.jpg', ),
               decoration: BoxDecoration(
        image:  DecorationImage( fit: BoxFit.contain, image: AssetImage('assets/unnamed.jpg')),
       // border: Border.all( style: BorderStyle.solid, color: Colors.black ),
        // border: Border( 
        //   left: BorderSide( width: 10, style: BorderStyle.solid, color: Colors.blueAccent ),
        //   top: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.brown ),
        //   bottom: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.teal ),
        //   right: BorderSide( style: BorderStyle.solid, width: 5, color: Colors.pink ),
        // ),
        borderRadius: BorderRadius.all( Radius.circular(30) )
      )
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