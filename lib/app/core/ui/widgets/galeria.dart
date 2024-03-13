import 'package:flutter/material.dart';

class GaleriaWidget extends StatelessWidget {
  final String label;
  const GaleriaWidget({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisSpacing: 10.0,
      crossAxisCount: 4,
      children: [
        InkWell(
          onTap: () {},
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              elevation: 5.0,
              child:  Center(
                child: Text(label),
              )
          ),
        ),
        InkWell(
          onTap: () {},
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
              elevation: 5.0,
              child:  Center(
                child: Text(label),
              )
          ),
        ),
        InkWell(
          onTap: () {},
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              elevation: 5.0,
              child: Center(
                child: Text(label),
              )
          ),
        ),
        InkWell(
          onTap: () {},
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              elevation: 5.0,
              child: Center(
                child: Text(label),
              )
          ),
        ),
      ],
    );
  }
}
