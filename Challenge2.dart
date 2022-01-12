import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
  
class  MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home:ContainerSlider(),
    );
      
  }
}

class ContainerSlider extends StatefulWidget{
  ContainerSliderState createState() => ContainerSliderState();
}

class ContainerSliderState extends State<ContainerSlider>{
  double sliderValue=100;
  Widget build(BuildContext context){
    
    return Scaffold(
      body:Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                  children:[Expanded(child:Center(child:Container(height:sliderValue,
                                  width:sliderValue,
                                  color:Colors.yellow,
                                 ),),),

                    Container(
                              child:Slider(
                              value:sliderValue,
                                max:600,
                                divisions:10,
                                label:sliderValue.round().toString(),
                                onChanged:(double value){
                                  setState((){
                                    sliderValue=value;
                                  });
                                }
                              ),
                             )
                           ],
                 ),
    );
    
  }
}
