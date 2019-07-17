import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {

  int id;
  String title;
  String body;

  Post({ this.id, this.title, this.body });

  
  factory Post.fromJson( Map<String, dynamic> json ) {
    return Post( id: json['id'], title: json['title'], body: json['body'] );
  }

  @override 
  String toString() {
    return 'post $title';
  }

  static Future<Post> getPost() async {
    
    http.Response res = await http.get('http://www.somaku.com/posts/1');
    Map<String, dynamic> resJson = json.decode(res.body);
    
    return Post.fromJson(resJson);

  }

  static Future<List<Post>> getPosts() async {
    
    http.Response res = await http.get('http://www.somaku.com/posts');
    List resJson = json.decode(res.body);
    
    return resJson.map((postJsn) {
      return Post.fromJson(postJsn); 
    }).toList();

  }



}