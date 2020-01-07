import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(253, 124, 4, 1),//rgba(253, 124, 4, 1)
        centerTitle: true,
        elevation: 0,
        title: Text(
          '会员中心',
          style: TextStyle(fontSize: ScreenUtil().setSp(32.0), color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(

          child: Column(
            children: <Widget>[
              _info(),//个人信息部分

              Container(
                
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), ScreenUtil().setWidth(30.0), ScreenUtil().setWidth(32.0), ScreenUtil().setWidth(21.0)),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12.0))),
                  ),
                  // color: Colors.white,
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), 0.0, ScreenUtil().setWidth(32.0), 0.0),
                  child: Column(
                    children: <Widget>[
                      _nav('images/user_auth_@x2.png','我的认证','去认证'),
                      _nav('images/user_agreement_@2x.png','我的协议','去认证'),
                      _nav('images/user_bank_@2x.png','我的银行卡','去认证',false),
                    ],
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), 0.0, ScreenUtil().setWidth(32.0), ScreenUtil().setWidth(21.0)),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12.0))),
                  ),
                  // color: Colors.white,
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), 0.0, ScreenUtil().setWidth(32.0), 0.0),
                  child: Column(
                    children: <Widget>[
                      _nav('images/user_counselor.png','专属顾问','请等待系统分配',true,false),
                      _nav('images/user_service.png','客服热线','400-872-8880',false,false),
                    ],
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), 0.0, ScreenUtil().setWidth(32.0), ScreenUtil().setWidth(21.0)),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  // color: Colors.white,
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0), 0.0, ScreenUtil().setWidth(32.0), 0.0),
                  child: Column(
                    children: <Widget>[
                      _nav('images/user_about.png','关于我们',''),
                      _nav('images/user_unlogin.png','退出登陆','',false),
                    ],
                  )
                ),
              ),




            ]
          ),

      ),
    );
  }


  //每条菜单栏目
  Widget _nav(String imgUrl,String title,String desc,[bool borderIsShow = true,bool arrowsIs = true]){

      List<Widget> lists = [];
      lists.add(
          Expanded(
            flex: 1,
            child: Text(title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28.0),
                color: Color.fromRGBO(50, 50, 50, 1)
              ),
            )
          )
      );
      lists.add(
          Expanded(
            flex: 0,
            child: Text(desc,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28.0),
                  color: Color.fromRGBO(153, 153, 153, 1)
                ),
              )
          ), 
      );
      if(arrowsIs){
        lists.add(
          Expanded(
            flex: 0,
            child: Text("\uE315",
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: ScreenUtil().setSp(48.0),
                  color: Color.fromRGBO(100, 100, 100, 1)
              ),
            )
          ),  
        );
      }

      return Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Expanded(
              flex: 0,
              child: Image.asset(imgUrl, width: ScreenUtil().setWidth(28.0), height: ScreenUtil().setWidth(30.0)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.0)),
                padding: EdgeInsets.fromLTRB(0.0, ScreenUtil().setWidth(30.0), 0.0, ScreenUtil().setWidth(30.0)),
                decoration:BoxDecoration(
                  border:Border(
                    bottom:BorderSide(width: ScreenUtil().setWidth(2.0),color: borderIsShow?Color.fromRGBO(215, 215, 215, 0.5):Color.fromRGBO(250, 250, 250, 0.5))
                  )
                ),
                child: Flex(
                    direction: Axis.horizontal,
                    children: lists,
                ),
              )
            ),

        ],
      ),
    );
  }

  //头部基本信息
  Widget _info(){
    return  Container(
      color: Color.fromRGBO(253, 124, 4, 1),
      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32.0),ScreenUtil().setWidth(30.0),ScreenUtil().setWidth(32.0),ScreenUtil().setWidth(30.0)), //容器内补白
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: ClipOval(
                        child: Image.asset(
                            'images/test/portrait.png',
                            width  : ScreenUtil().setWidth(100.0),
                            height : ScreenUtil().setWidth(100.0),
                            fit:BoxFit.cover
                        ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:EdgeInsets.only(left: ScreenUtil().setWidth(30.0),right: ScreenUtil().setWidth(30.0)),
                      child: Text(
                          '夏日里的一把阳光',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(32.0)
                          )
                      ),
                    ),
                  ),
              ]
            ),
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: <Widget>[
                Text('编辑资料',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(36.0)
                  )
                ),
                Text("\uE315",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: ScreenUtil().setSp(48.0),
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }


}


