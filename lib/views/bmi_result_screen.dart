import 'package:bmi/constants/constants.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  determineBmiCategory(double bmiValue){
    String category = "";
      if (bmiValue < 16.0) {
        category = underweightSevere;
      }
       else if (bmiValue >= 16.0 && bmiValue < 17) {
        category = underweightModerate;
      }else if(bmiValue >= 17.0 && bmiValue < 18.5){
        category = underweightMild;
      }else if(bmiValue >= 18.5 && bmiValue < 25){
        category = normal;
      }else if(bmiValue >= 25 && bmiValue < 30){
        category = overweight;
      }else if(bmiValue >= 30 && bmiValue < 35){
        category = obeseI;
      }else if(bmiValue >= 35 && bmiValue < 40){
        category = obeseII;
      }else if(bmiValue > 40 ){
        category = obeseIII;
      }
      return category;

  }

  getHealthRisk(String categoryName){
    String desc = "";
    switch (categoryName){
      case underweightSevere: 
        desc = "Possible nutritional deficiency and osteoporosis";
    break;
      case underweightModerate: 
        desc = "Possible nutritional  osteoporosis";
    break;
      case underweightMild: 
        desc = "osteoporosis";
    break;
      case normal: 
        desc = "Low Risk";
    break;
      case overweight:  
        desc = "Moderate Risk";
    break;
      case underweightSevere: 
        desc = "Possible nutritional deficiency and osteoporosis";
    break;
      case underweightSevere: 
        desc = "Possible nutritional deficiency and osteoporosis";
    break;
    default:
    }
    return desc;
  }
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
   
    return Scaffold(
      appBar: AppBar(
        title:Text('Hasil Hitung BMI'),
      ),
      backgroundColor: Color(0xff2a454b),
      body:Column(
        children:[
          Expanded(child: Container(
            child:Text('Hasil Perhitungan',
            style: TextStyle(
              fontSize:24,
              fontWeight:FontWeight.bold,
              color:Colors.white

            ),
            )
          )
          ),
          Expanded(
            flex:5,
            child: BmiCard(
              child:Container(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(determineBmiCategory(bmi),
                    style:TextStyle(
                      fontSize:25,
                      fontWeight:FontWeight.w500,
                      color:Color(0xff83f5e5)
                    )
                    ),
                    Text('${bmi.toStringAsFixed(1)}',
                    style:TextStyle(
                      fontSize:75,
                      fontWeight:FontWeight.w500,
                      color:Colors.white
                    )
                    ),
                    Text(getHealthRisk(determineBmiCategory(bmi)),
                    style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w500,
                      color:Colors.white
                    )
                    )

                  ]
                  ),
              ) ,
              )
          ),
          GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BmiDataScreen()));
                },
                child: Container(
                  height: currentHeight*0.1,
                  width: currentWidth*1,
                 
                  color:Color(0xfff13c77),
                  child:Center(child: Text('Hitung Ulang',style: labelTextStyle,))
                ),
              )
        ]
      )
    );
  }
}