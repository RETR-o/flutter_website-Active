import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'NavBarButton.dart';

double collapsableHeight = 0.0;


class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(

      body: Stack(
        children: [
          Container(

            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg.png'),
              ),
            ),),

          Container(

            alignment: Alignment.topCenter,padding: EdgeInsets.only(top:250),

            child: const AutoSizeText(
              "Gallery", minFontSize: 40,
              maxFontSize: 70,
              style: TextStyle(fontSize: 70),
              maxLines: 1,
            ),
          ),

          AnimatedContainer(
            margin: EdgeInsets.only(top: 79.0),
            duration: Duration(milliseconds: 375),
            curve: Curves.ease,
            height: (width < 800.0) ? collapsableHeight : 0.0,
            width: double.infinity,
            color: Color(0xff121212),
            child: SingleChildScrollView(

              child: Column(
                children: navBarItems,
              ),
            ),
          ),

          Container(
            color: Colors.transparent,
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.only(left: 1.0),
                  iconSize: 200.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: Image.asset('assets/logo.png'),
                ),


                LayoutBuilder(builder: (context, constraints) {
                  if (width < 800.0) {
                    return NavBarButton(
                      onPressed: () {
                        if (collapsableHeight == 0.0) {
                          setState(() {
                            collapsableHeight = 240.0;
                          });
                        } else if (collapsableHeight == 240.0) {
                          setState(() {
                            collapsableHeight = 0.0;
                          });
                        }
                      },
                    );
                  } else {
                    return Row(
                      children: navBarItems,
                    );
                  }
                })


              ],
            ),
          ),



        ],
      ),
    );
  }
}





