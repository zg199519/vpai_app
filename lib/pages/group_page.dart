import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//基本部件
import '../widgets/group_item_widget.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0XFFFD7C04),
        title: Text('V团队',style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(32.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _getInfo(),//基本信息
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                height: ScreenUtil().setWidth(80.0),
                child: Row(
                  children: <Widget>[
                    Text('我的团队',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: ScreenUtil().setSp(32.0),
                      )
                    ),
                    Text(' 共4位',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: ScreenUtil().setSp(28.0),
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child:  ListView.builder(
                          // shrinkWrap:true,
                          itemCount: 80,
                          itemBuilder: (BuildContext context, int index) {
                            return GroupItemWidget();
                        }),
              )

            ], 

        ),

      ),
    );
  }

  Widget _getInfo(){
    return  ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        height: ScreenUtil().setWidth(240.0),
        padding: EdgeInsets.all(ScreenUtil().setWidth(32.0)),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setWidth(116.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Image.asset("images/share/friend@2x.png",
                          height: ScreenUtil().setWidth(48.0),
                        ),
                        Container(
                          height: ScreenUtil().setWidth(68.0),
                          padding: EdgeInsets.only(top: ScreenUtil().setWidth(20.0)),
                          child: Text('微信好友',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: ScreenUtil().setSp(26.0)
                            ),
                          )
                        )

                      ]
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Image.asset("images/share/circle@2x.png",
                            height: ScreenUtil().setWidth(48.0),
                          ),
                          Container(
                            height: ScreenUtil().setWidth(68.0),
                            padding: EdgeInsets.only(top: ScreenUtil().setWidth(20.0)),
                            child: Text('朋友圈',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: ScreenUtil().setSp(26.0)
                              ),
                            )
                          )

                        ]
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/share/face_to_face@2x.png",
                            height: ScreenUtil().setWidth(48.0),
                          ),
                          Container(
                            height: ScreenUtil().setWidth(68.0),
                            padding: EdgeInsets.only(top: ScreenUtil().setWidth(20.0)),
                            child: Text('面对面',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: ScreenUtil().setSp(26.0)
                              ),
                            )
                          )

                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: ScreenUtil().setWidth(60.0),
              alignment:Alignment.center,
              decoration: BoxDecoration(
                //设置四周边框
                border: Border(
                  top: BorderSide(
                    width: ScreenUtil().setWidth(2.0),
                    color: Color.fromRGBO(215, 215, 215, 1)
                  )
                ),
              ),
              child: Text('分享您的专属邀请码，邀请好友，赚更多奖金',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: ScreenUtil().setSp(24.0)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }






}