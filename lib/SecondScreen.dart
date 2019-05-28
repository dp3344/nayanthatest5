// SecondScreen.dart

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomSheet: Container(
        color: Colors.white, 
        padding: EdgeInsets.all(6.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Text('Settings ', textAlign: TextAlign.end, 
                                      style: TextStyle(
                                          fontSize: 18.0, backgroundColor:Colors.white,
                                          color: Colors.blueAccent,
                                          //fontStyle: Color.blueAccent,
                                          //fontWeight: FontWeight.bold
                                          )),
        // Text('\u00a9 2019 Olympic Computer Services, Inc. All rights reserved. ',
        //                               style: TextStyle(
        //                                   fontSize: 14.0,
        //                                   color: Colors.white,
        //                                   fontWeight: FontWeight.bold)),

      ],)),
      
      /*================*/

      appBar: AppBar(
        
        // title: Text('Report Options', textAlign: TextAlign.center, 
        //                               style: TextStyle(
        //                                   fontSize: 18.0, 
                                          
        //                                   backgroundColor:Colors.white,
        //                                   color: Colors.black,
        //                                   //fontStyle: Color.blueAccent,
        //                                   fontWeight: FontWeight.bold),
        
        
        
        
        // ),
        
        
        backgroundColor: Colors.white,
centerTitle: true,
          actions: <Widget>[
            // action button
            
        //     Text('Log Out ',textAlign: TextAlign.start,
        //                               style: TextStyle(
        //                                   fontSize: 16.0, 
                                          
        //                                   backgroundColor:Colors.white,
        //                                   color: Colors.blueAccent,
        //                                   //fontStyle: Color.blueAccent,
        //                                   //fontWeight: FontWeight.bold
        //                                   ),
        
        
        
        
        // ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
    child: Text('LogOut',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.blueAccent,
                                          //fontWeight: FontWeight.bold
                                          )),
                                  //color: Theme.of(context).accentColor,
                                  color: Colors.white,




        ),

        //     // action button
        //     Text('Report Options',textAlign: TextAlign.center, 
        //                               style: TextStyle(
        //                                   fontSize: 18.0, 
                                          
        //                                   backgroundColor:Colors.white,
        //                                   color: Colors.black,
        //                                   //fontStyle: Color.blueAccent,
        //                                   fontWeight: FontWeight.bold
        //                                   ),
        
        
        
        
        // ),



            // IconButton(
            //   icon: Icon(Icons.email),
            //   onPressed: () {
                
            //   },
            // ),


          ],

        title: Text('Report Options', textAlign: TextAlign.center, 
                                      style: TextStyle(
                                          fontSize: 18.0, 
                                          
                                          backgroundColor:Colors.white,
                                          color: Colors.black,
                                          //fontStyle: Color.blueAccent,
                                          fontWeight: FontWeight.bold),
        
        
        
        
        ),
        





      ),
      body: Center(
        child: RaisedButton(
          child: Text('Back To HomeScreen'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () => Navigator.pop(context)
        ),
      ),
    );
  }
}