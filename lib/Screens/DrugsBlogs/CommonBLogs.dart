
import 'package:flutter/material.dart';

setCommonBlog(String imgUrl,String title,String description,double width,double height, String profile){
  return new Column(
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(imgUrl, fit: BoxFit.cover,),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(profile),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Jess Maty', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green[400]),),
                Text('1hr ago', style: TextStyle(fontSize: 10, color: Colors.grey),)
              ],
            ),
          ),
          Container(
            child: Text(
              "United is a problem regarding! let all come togehther",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ],
  );
}

