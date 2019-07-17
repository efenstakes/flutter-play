import 'package:flutter/material.dart';


class Terminus extends StatefulWidget {
  @override
  _TerminusState createState() => _TerminusState();
}

class _TerminusState extends State<Terminus> {
   

  var _curIndex = 0;
  String content = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(content),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: [
          
          BottomNavigationBarItem( 
            icon: Icon(Icons.home), title: Text('Home')
          ),

          BottomNavigationBarItem(   
            icon: Icon(Icons.person), title: Text('Profile')
          )


        ],

        onTap: (index) {
           
          setState(() {
            
            _curIndex = index;
            switch (_curIndex) {
              case 0:
                content = 'home page now';
                break;
              case 1:
                content = 'contact page now';
                break;
              default:
            }

          });

        },

      )
      
    );
  }
}