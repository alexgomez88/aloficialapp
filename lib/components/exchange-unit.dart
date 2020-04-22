import 'package:al_oficial_app/models/exchanger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExchangeUnit extends StatelessWidget {
  final Exchanger exchangeUnit;
  final double fontSizeCB = 13;

  ExchangeUnit({data}) : this.exchangeUnit = data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: InkWell(
          onTap: () {},
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
              Text(exchangeUnit.name,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16))),
              Text(exchangeUnit.pair,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 12)))
            ])),
            Container(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Compra:',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: fontSizeCB))),
                          Text(
                              NumberFormat("#,###.00").format(exchangeUnit.buy),
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: fontSizeCB)))
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Venta:',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: fontSizeCB))),
                          Text(
                              NumberFormat("#,###.00")
                                  .format(exchangeUnit.sell),
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: fontSizeCB)))
                        ])
                  ],
                ))
          ]),
        ));
  }
}
