import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:lutr/pages/stepprs.dart';
import 'package:lutr/pages/terminus.dart';

import 'package:validate/validate.dart';
import 'package:url_launcher/url_launcher.dart';


// ui
import './dashboard_page.dart';

// models
import '../models/User.dart';



class UserDetailPage extends StatefulWidget {
  @override 
  _UserDetailPage createState()=> _UserDetailPage();
}

class _UserDetailPage extends State<UserDetailPage> {

  final _formKey = new GlobalKey<FormState>();
  User _newUser = User();

   
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
                title: Text('Login'), 
                actions: <Widget>[
                  Icon(Icons.people)
                ], 
              ),

      body: Column( 
             
             children: <Widget>[

                SizedBox(height: 50,),
                Text('holla'),

                Form(
                  key: _formKey,

                   
                  child: Column(

                    children: <Widget>[
                         
                        TextFormField(
                          decoration: InputDecoration( 
                                        prefixIcon: Icon(Icons.person),
                                        labelText: 'Name',
                                        hintText: 'Enter your Name'
                          ),
                          keyboardType: TextInputType.text,

                          validator: (value) {
                              return value.isEmpty ? 'Enter Your Name' : null;
                          },
                          onSaved: (val)=> setState(()=> _newUser.name = val ),
                        ),

                        // TextField( 
                        //   decoration: ,
                        // ),

                         
                        TextFormField(
                          decoration: InputDecoration(  
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Enter Your Email'
                          ),
                          keyboardType: TextInputType.emailAddress,

                          validator: (value) {

                            if( value.isEmpty ){
                              return 'Enter Your Email';
                            }
                            
                            try {
                              Validate.isEmail(value); 
                            } catch(e) {
                              return 'Enter a valid email';
                            }

                            return null;

                          },

                          onSaved: (val)=> setState(()=> _newUser.email = val ),
                        ),
                        
                        Builder( 
                          builder: (context) {

                            return Container(

                              child: RaisedButton(
                                      child: Text('LOGIN'),
                                      onPressed: () {
                                        
                                        _submitForm(context);

                                      },
                                    ),

                            );

                          },
                        ),

                        RaisedButton( 
                          child: Text('Google'),
                          onPressed: () async {
                            
                              if ( await canLaunch('tel:0799919960') ) {
                                  await launch('tel:0799919960');
                              }

                          },
                        ),

                        RaisedButton(
                          child: Text('Terminusify'),
                          onPressed: () {
                            Navigator.push( 
                              context,
                              MaterialPageRoute( builder: (context)=> Terminus() )
                            );
                          },
                        ),

                        RaisedButton( 
                          child: Text('steppers'),
                          onPressed: (){
                            Navigator.push( 
                              context, 
                              MaterialPageRoute(builder: (context)=> Stepprs())
                            );
                          },
                        ),

                        RaisedButton(
                          child: Text('get name'),
                          onPressed: ()=> getName(),
                        )

                    ],

                  ),


                )

             ],

       ) 


    );
  }// Widget build(BuildContext context) { .. }

  void _submitForm(BuildContext context) async {
    print('sbmit');

    if ( ! _formKey.currentState.validate() ) {
      Scaffold.of(context).showSnackBar(SnackBar( 
         content: Text('Error In Form'),
         duration: Duration(seconds: 3)
      ));
      return;
    }
    
    
    Scaffold.of(context).showSnackBar(SnackBar( 
      content: Text('Process'),
      duration: Duration(seconds: 5)
    ));
    _formKey.currentState.save();
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lutr:name', _newUser.name);
    prefs.setString('lutr:email', _newUser.email);

    print(_newUser);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> DashboardPage( user: _newUser ))
    );


  }// void _submitForm() { .. }


  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uname = prefs.getString('lutr:name');
    var mail = prefs.getString('lutr:email');
    print('uname $uname mail $mail');
  }



}// class _UserDetailPage extends State<UserDetailPage> { .. }


