import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'NavBarItem.dart';
import 'NavBarButton.dart';

double collapsableHeight = 0.0;
Color selected = const Color(0xffffeb3b);
Color notSelected = const Color(0xfffffde7);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              "Welcome to AIFT", minFontSize: 40,
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

          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 2 - 100.0,
            left: MediaQuery
                .of(context)
                .size
                .width / 2 - 325.0,

            child: Container(
              height: 240,
              width: 630,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("About AIFT", style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),),),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 2 + 75,
            left: MediaQuery
                .of(context)
                .size
                .width / 2 - 550,

            child: SizedBox(

              width: 1160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Active Institute of Fashion Technology  ( AIFT )  is a new sector of ACTIVE GROUP OF COMPANIES. \n"
                          "In our institute we are offering fashion designing course that span the fashion career spectrum.\n"
                          "Professionally designed programs will be taken to students beyond fashion design & textiles into\n"
                          "every aspect of this industry. Our AIFT students are skilled, experienced and has the potential \n"
                          "to create their own place in the fashion industry. Our ultimate goal is to ensure every student \n"
                          "leaves with an in-depth understanding of the entire fashion process from conceptualizing to     \n"
                          "illustration, technical, sketching, fabric selection, draping, cutting, sewing, production,     \n"
                          "costing , promotion & more. Atlast our AIFT students have sufficient confidence to become an    \n"
                          "Successful Entrepreneur in this industry.We will serve fashion knowledge with excellence.       \n"
                          "We Guides to lead our AIFT students to the path of Fashion World and style.",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}





