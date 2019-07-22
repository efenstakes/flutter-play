import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lutr/widgets/post_detail.dart';
import 'dart:core';

// models
import '../models/User.dart';
import '../models/Post.dart';


class DashboardPage extends StatefulWidget {
  
  User user = new User();
  String uname;

  DashboardPage({ this.user });


  @override 
  _DashboardPage createState()=> _DashboardPage(uname: uname);

}

class _DashboardPage extends State<DashboardPage> {
  
  Future<Post> post;
  Future<List<Post>> posts;
  String uname;

  _DashboardPage({this.uname}) {
    this.initName();
  }

  initName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('lutr:name');
    setState(() {
      uname = name;
    });
  }

  @override
  void initState() {
    super.initState();
    post = Post.getPost();
    posts = Post.getPosts();
  }

  List<Widget> makeTexts(var posts) {
    return posts.map<Widget>((post)=> Text(post.body)).toList();
  }


  List<Widget> makeItems(var posts, Size size) {
    return posts.map<Widget>((post)=> postDetail(post: post, size: size)).toList();
  }

  @override 
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar( title: Text('Dashboard'), ),

      body: SingleChildScrollView(

        child: Column(

          children: <Widget>[

                    Text(widget.user.email),
                    Text('name $uname'),

                    // FutureBuilder<Post>(
                    //   future: post,
                    //   builder: (context, snapshot) {

                    //     if ( snapshot.hasData ) {
                    //       return Text(snapshot.data.body);
                    //     } 
                    //     if ( snapshot.hasError ) {
                    //       return Text('An Error Occured ${snapshot.error}');
                    //     }

                    //     return CircularProgressIndicator();

                    //   }
                    // )

                    FutureBuilder(

                      future: posts,

                      builder: (context, snapshot) {

                        if( snapshot.hasError ) {
                          return Center(
                            child: Text('An Error Occured ${snapshot.error}')
                          );
                        }  
                        
                        if( snapshot.hasData ) {
                          
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            
                            child: Row(
                              
                              children: makeItems(snapshot.data, size),

                            ),


                          );

                          // return Column(

                            // children: []//makeTexts(snapshot.data)
                                // snapshot.data.forEach((post)=> {
                                //    Text(post.body)
                                // })

                              
                            
                            // ListView.builder(

                            //         itemCount: snapshot.data.length,
                            //         itemBuilder: (BuildContext context, int index) {

                            //             return Text( 'snapshot.data[index].body' );
          
                            //         },

                            // )
                          // );

                        }

                        return Center(
                            child: CircularProgressIndicator(backgroundColor: Colors.black,),
                        );

                      },

                    ),


                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),Container(
                            child: Text('data'),
                            
                          ),                          

                        ],
                      ),
                                          ),
                    


                  ],


        ),

        
      ),


    );

  }// Widget build(BuildContext context) { .. }


}// class _DashboardPage extends State<DashboardPage> { .. }