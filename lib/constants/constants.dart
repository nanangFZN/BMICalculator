import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Color primaryColor = Color(0xff0e1c26);
TextStyle labelTextStyle = GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color:Colors.white
                            );
TextStyle numberStyle = TextStyle(
  fontSize:30,
  fontWeight:FontWeight.bold,
  color:Colors.white
);

const String underweightSevere = "Underweight (Severe thinness)";
const String underweightModerate = "Underweight (Moderate thinness)";
const String underweightMild = " Underweight (Mild thinness)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obeseI = "Obese (class I)";
const String obeseII = "Obese (Class II)";
const String obeseIII = "Obese (Class III)";