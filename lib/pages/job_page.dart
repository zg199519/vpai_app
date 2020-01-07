import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0XFFFD7C04),
        title: Align(
          alignment : Alignment.center,
          child: Container(
            width: ScreenUtil().setWidth(420.0),
            height: ScreenUtil().setWidth(60.0),
            child: Row(
              children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                        textColor:Color(0xFFFD7C04),
                        color:Colors.white,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(ScreenUtil().setWidth(12.0)),bottomLeft: Radius.circular(ScreenUtil().setWidth(12.0)))),
                        child: Text("面试进度",
                         style: TextStyle(
                           fontSize: ScreenUtil().setSp(26.0),
                         )
                        ),
                        onPressed: () {},
                    ),
                    
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      textColor:Colors.white,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(ScreenUtil().setWidth(12.0)),bottomRight: Radius.circular(ScreenUtil().setWidth(12.0)))),
                      color:Color(0xFFFDA34F),
                      colorBrightness:Brightness.dark,
                      child: Text("求职者列表",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                           fontSize: ScreenUtil().setSp(26.0)
                         )
                      ),
                      onPressed: () {},
                    )
                  )
              ],
            ),
          )
        )
      ),
      body: Center(
        child: Text('达克赛德挥洒'),
      ),
    );
  }
}
