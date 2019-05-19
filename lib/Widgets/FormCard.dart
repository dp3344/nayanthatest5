import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//class MainPage extends StatefulWidget{
//  FormCard createState()=> FormCard();
//}

//class HomePage extends State<MainPage>{
 //Your code here
//}

//class FormCard extends State<MainPage>{
class FormCard extends StatelessWidget {
//class FormCard extends StatefulWidget {
//class FormCard extends State<MyApp> {
  //bool _isSelected = false;

    bool _checked = true;

  void _onCheck(val) {
  _checked = val;
  //setState();
   // setState(() {
   //   _checked = val;
   // });
 }
  
  
  void _radio() {
    //setState(() {
      //_isSelected = !_isSelected;
    //});
  }

  void _check() {
    //setState(() {
      //_isSelected = !_isSelected;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(300),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
		  /*---------------------------------------
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
			----------------------------------*/
			/*===========================================================================================
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
		===========================================================================================*/

            TextField(
              decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
			/*===========================================================================================

            Text("PassWord",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
		===========================================================================================*/

			TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Last 4 digit SSN",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            )
/*-------------------------------------------			
			,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
--------------------------------------------*/	

/*#####################################################################
				,
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Checkbox(value: _checked, onChanged: (val) => _onCheck(val)),
                Text("Remember me"
,                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(26), fontFamily: "Poppins-Medium"))
								  
				]
				)		

#####################################################################*/				
				
          ],
        ),
      ),
    );
  }
}
