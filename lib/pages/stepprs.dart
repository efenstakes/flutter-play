import 'package:flutter/material.dart';


class Stepprs extends StatefulWidget {

  @override 
  _Stepprs createState()=> _Stepprs();

}

class _Stepprs extends State<Stepprs> {

  var stepperIndex = 0;
  var lastStepperIndex = 1;


  nextStepper() {
    print('cont..');
    if( stepperIndex == lastStepperIndex ) return;
    setState(()=> stepperIndex += 1);
  }

  cancelStepper() {
    if( stepperIndex > 0 ) {
      stepActivated( (stepperIndex-1) );
    }
  }

  stepActivated(var index) {
    setState((){ stepperIndex = index; });
  }
  
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(title: Text('stepper'),),

      body: Column(
        
        children: <Widget>[
          
          Stepper(
            
            steps: [

              Step( 
                title: Text('User Info'),
                content: Container(
                  child: Column(
                    children: <Widget>[
                      
                      Text('user info'),
                      Text('user 2'),

                    ],
                  ),
                )
              ),
              Step( 
                title: Text('Destination Details'),
                content: Container(
                  child: Column(
                    children: <Widget>[
                      
                      Text('Destination info'),
                      Text('Destination 2'),

                    ],
                  ),
                )
              )

            ],

            currentStep: stepperIndex,
            onStepTapped: (index)=> stepActivated(index),
            onStepCancel: cancelStepper,
            onStepContinue: nextStepper,

          )


        ],


      ),

    );
  }// Widget build(BuildContext context) { .. }

}// class _Stepprs extends State<Stepprs> { 