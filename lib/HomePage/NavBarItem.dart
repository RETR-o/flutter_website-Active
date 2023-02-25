import 'package:act/HomePage/GalleryPage.dart';
import 'package:flutter/material.dart';
import 'AdmissionPage.dart';
import 'HomePage.dart';
import 'NavBarButton.dart';


class NavBarItem extends StatefulWidget {
  final String text;

  NavBarItem({
    required this.text,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();

}

class _NavBarItemState extends State<NavBarItem> {
  Color color = notSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          color = selected;
        });
      },
      onExit: (value) {
        setState(() {
          color = notSelected;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: (){
              if (widget.text == 'Admission') {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdmissionPage()),
              );
              } else if (widget.text == 'Gallery') {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GalleryPage()),
              );}
              else if (widget.text == 'About us') {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              }
          },

          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.0,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
