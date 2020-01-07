import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAE_SCROLL_OFFSET = 240;//滚动基数

class PositionDetails extends StatefulWidget {

  @override
  _PositionDetailsState createState() => _PositionDetailsState();
}

class _PositionDetailsState extends State<PositionDetails>{

   double alphaAppBar = 0;
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  _onScroll (offset) {
    double alpha = offset / APPBAE_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      alphaAppBar = alpha;
    });
    // print(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            fit: StackFit.loose,
            children: <Widget>[
                    MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: NotificationListener(
                            onNotification: (ScrollNotification notification) {
                              if(notification.metrics.axis == Axis.vertical){
                                _onScroll(notification.metrics.pixels);
                              }
                              return true;
                            },
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  height: ScreenUtil().setWidth(670.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: ScreenUtil().setWidth(600.0),
                                        child: Swiper(
                                                itemBuilder: (BuildContext context, int index) {
                                                  return Image.asset(
                                                      "images/test/timg.jpeg",
                                                      fit: BoxFit.fill,
                                                    );
                                                },
                                                itemCount: 5,
                                                scrollDirection: Axis.horizontal,
                                                pagination: new SwiperPagination(
                                                  margin:EdgeInsets.only(bottom: ScreenUtil().setWidth(138.0)),
                                                  builder: DotSwiperPaginationBuilder(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    activeColor: Colors.white,
                                                    activeSize: ScreenUtil().setWidth(14.0),
                                                    size: ScreenUtil().setWidth(14.0)
                                                  )
                                                ),
                                                //autoplayDelay: 3000,
                                                autoplayDisableOnInteraction : true
                                              ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,   
                                        child: _getInfo()
                                      )
                                    ],
                                  )
                                ),
                                Container(
                                  height: ScreenUtil().setWidth(92.0),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(32.0)),
                                  // color: Color.fromRGBO(255, 184, 117, 1),
                                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(20.0),bottom: ScreenUtil().setWidth(20.0)),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/img/award-bg@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Text('奖励 2000 元/月',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(34.0),
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      shadows:[BoxShadow(color: Color.fromRGBO(173, 67, 27, 1), offset: Offset(-1, -1), blurRadius: 5)],
                                    ),
                                  
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(ScreenUtil().setWidth(32.0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20.0)),
                                        child: Text('招聘要求',style: TextStyle(color: Color.fromRGBO(50, 50, 50, 1),fontSize: ScreenUtil().setSp(32.0),fontWeight: FontWeight.w600)),
                                      ),
                                      Wrap(
                                        spacing: 6.0,
                                        alignment: WrapAlignment.start,
                                        children: <Widget>[
                                          Text('iiiii'),
                                          Text('要求：形象气质佳，价格外向，有健康证'),
                                        ],
                                      ),
  
                                      
                                      Text('11111'),
                                      Text('11111'),
                                      Text('11111'),
                                      Text('11111'),
                                      Text('11111'),
                                      Text('11111'),
                                    ],
                                  ),
                                )



                              ],
                            )
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      height: (ScreenUtil.statusBarHeight+ScreenUtil().setWidth(88.0)),
                      left:0,
                      right:0,
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, alphaAppBar),
                        child: Padding(
                          padding: EdgeInsets.only(top: ScreenUtil.statusBarHeight),
                          child: Container(
                            // color: Colors.orange,
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(32.0)),
                            child: Align(
                              alignment:Alignment.centerLeft,
                              child: FlatButton.icon(
                                color: Colors.black45,
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                  size: ScreenUtil().setSp(28.0),
                                  ),
                                label: Text("返回",style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28.0))),
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                                onPressed: () {Navigator.pop(context);},
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
            ],
        )

    );

  }

  //基本信息
  ClipRRect _getInfo(){

    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(ScreenUtil().setWidth(32.0)),topRight: Radius.circular(ScreenUtil().setWidth(32.0))),
      child: Container(
        height: ScreenUtil().setWidth(188.0),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(32.0),
            right: ScreenUtil().setWidth(32.0),
            top: ScreenUtil().setWidth(24.0),
            bottom: ScreenUtil().setWidth(20.0)
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setWidth(48.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(12.0),ScreenUtil().setWidth(6.0),ScreenUtil().setWidth(12.0),ScreenUtil().setWidth(6.0)),
                          // margin: EdgeInsets.only(right: 10.0),
                          color: Color.fromRGBO(253,124,4,0.15),
                          child: Text('全职',
                            style: TextStyle(
                              color: Color.fromRGBO(253, 124, 4, 1),
                              fontSize: ScreenUtil().setSp(26.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('这里是标题标题标题标题这里是标题标题标题标题这里是标题标题标题标题',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            fontSize: ScreenUtil().setSp(36.0),
                            fontWeight: FontWeight.w600
                          ),
                        )
                      )
                    ),
                  ]
                ),
              ),
              Container(
                height: ScreenUtil().setWidth(42.0),
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(6.0)),
                child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text('15000-18000元/月',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 124, 4, 1),
                                    fontSize: ScreenUtil().setSp(32.0),
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(12.0),ScreenUtil().setWidth(6.0),ScreenUtil().setWidth(12.0),ScreenUtil().setWidth(6.0)),
                                  // margin: EdgeInsets.only(left: 10.0),
                                  color: Color.fromRGBO(253, 124, 4, 0.15),
                                  child: Text('月结',
                                    style: TextStyle(
                                      color: Color.fromRGBO(253, 124, 4, 1),
                                      fontSize: ScreenUtil().setSp(20.0)
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )

                      ),
                      Expanded(
                        flex: 0,
                        child: Text('岗位ID：10901098',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: ScreenUtil().setSp(24.0),
                            fontWeight: FontWeight.w500
                          ),
                        
                        )
                      ),
                    ],
                  ),
              ),
              Container(
                height: ScreenUtil().setWidth(42.0),
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(4.0)),
                child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: Image.asset(
                                "images/user_auth_@x2.png",
                                height: ScreenUtil().setWidth(24.0),
                                fit: BoxFit.fill,
                              )
                            ),
                            Text('招：3 人',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                fontSize: ScreenUtil().setSp(24.0),
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        )

                      ),
                      Expanded(
                        flex: 0,
                        child: Text('2019.12.31更新',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: ScreenUtil().setSp(24.0),
                            fontWeight: FontWeight.w500
                          )
                        )
                      ),
                    ],
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }






}









// class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar child;
 
//   _StickyTabBarDelegate({@required this.child});
 
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return this.child;
//   }
 
//   @override
//   double get maxExtent => this.child.preferredSize.height;
 
//   @override
//   double get minExtent => this.child.preferredSize.height;
 
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
