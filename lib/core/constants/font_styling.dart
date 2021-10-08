import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get kFontHeaderStyle => const TextStyle(
    fontFamily: 'AkayaTelivigala', fontSize: 30, fontWeight: FontWeight.bold);

TextStyle get kFontTitleStyle => GoogleFonts.roboto(
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400));

TextStyle get kFontSubTitleStyle => GoogleFonts.lato(
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300));


// this is example if you want to use googlefonts pub
// TextStyle get kFontHeaderStyle => GoogleFonts.arsenal(
//     textStyle: const TextStyle(fontSize: 62, fontWeight: FontWeight.bold));
