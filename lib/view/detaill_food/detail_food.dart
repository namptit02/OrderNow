import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailFood extends StatefulWidget {
  final String image_category;
  final String text_category;

  const DetailFood(
      {Key? key, required this.image_category, required this.text_category})
      : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Food'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              colors: [
                Color(0xFFBBA9ED), // replace with your desired starting color
                Color(0xFFFEFEFE), // replace with your desired ending color
              ],
              stops: [
                0.0909, // replace with your desired stop value for the first color
                1.2359, // replace with your desired stop value for the second color
              ],
              // you can also adjust the angle and center of the gradient if needed
              // angle: 293.67 * (pi / 180),
              // center: Alignment.center,
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 20),
                child: Image.network(
                  widget.image_category,
                  width: 200,
                  height: 300,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 4),
                        blurRadius: 15,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        Text(
                          widget.text_category,
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
