import 'dart:math';
// import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/post_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              backgroundColor:Color(0XFFFD7C04),
              title: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(26.0)),
                      child: Container(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(20.0),right: ScreenUtil().setWidth(20.0)),
                        alignment: Alignment.centerLeft,
                        height: ScreenUtil().setWidth(54.0),
                        color: Colors.white,
                        child: Flex(
                          direction : Axis.horizontal,
                          children: <Widget>[
                            Image.asset(
                              'images/home_address_@2x.png',
                              height: ScreenUtil().setWidth(28.0),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(16.0),
                            ),
                            Expanded(
                              child: Text('输入地址快速找工作',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24.0),
                                  color: Color(0xFF999999)
                                ),
                              
                              ),
                            )

                          ],
                          
                        ),

                      )
                    )
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: ScreenUtil().setWidth(54.0),
                      width: ScreenUtil().setWidth(30.0),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(26.0)),
                      child: Container(
                        height: ScreenUtil().setWidth(54.0),
                        color: Color.fromRGBO(255, 192, 133, 1),
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(20.0),right: ScreenUtil().setWidth(20.0)),
                        alignment: Alignment.centerLeft,
                        child: Flex(
                          direction : Axis.horizontal,
                          children: <Widget>[
                            Text('\uE8B6',
                              style: TextStyle(
                                fontFamily: "MaterialIcons",
                                fontSize: ScreenUtil().setSp(36.0),
                                color: Colors.white
                              ),
                            ),                      
                            Container(
                              width: ScreenUtil().setWidth(16.0),
                            ),
                            Expanded(
                              child: Text('岗位名、岗位ID、门店名岗位名、岗位ID、门店名',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24.0),
                                  color: Colors.white,
                                ),
                              ),
                            )

                          ],
                          
                        ),

                      )
                    )
                  )
                ],
              )
            ),
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(88.0))
        ),

        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: _carousel(),
              ),
              SliverPersistentHeader(
                pinned: true, //是否固定在顶部
                floating: false,
                delegate: _SliverAppBarDelegate(
                    minHeight: ScreenUtil().setWidth(162.0), //收起的高度
                    maxHeight: ScreenUtil().setWidth(162.0), //展开的最大高度
                    child: Column(
                      children: <Widget>[
                          Container(
                                color: Colors.white,
                                height: ScreenUtil().setWidth(86.0),
                                child: TabBar(
                                        controller: _tabController,
                                        isScrollable: false,
                                        indicator: UnderlineTabIndicator(
                                          borderSide: BorderSide(width: ScreenUtil().setWidth(6.0), color: Color.fromRGBO(253, 124, 4, 1)),
                                          insets: EdgeInsets.fromLTRB(ScreenUtil().setWidth(80.0),0.0,ScreenUtil().setWidth(80.0),0.0)
                                        ),
                                        labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28.0), fontWeight: FontWeight.bold),
                                        labelColor: Colors.black87,
                                        unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
                                        tabs: <Widget>[
                                          Tab(
                                            text: "兼职",
                                          ),
                                          Tab(
                                            text: "全职",
                                          ),
                                          
                                        ],
                                ),
                          ),
                          Container(
                            height: ScreenUtil().setWidth(76.0),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              //设置四周边框
                              border: Border(
                                top: BorderSide(
                                  width: ScreenUtil().setWidth(2.0),
                                  color: Color.fromRGBO(215, 215, 215, 1)
                                )
                              ),
                            ),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: _getFiltrates()
                            ),
                          )
                      ]
                    )
  
                ),
              )
            ];
          },


          body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(30.0),left:ScreenUtil().setWidth(32.0),right: ScreenUtil().setWidth(32.0)),
                      child: ListView.builder(
                          itemCount: 40,
                          itemExtent: ScreenUtil().setWidth(360.0),
                            itemBuilder: (BuildContext context, int index) {
                              return PostItemWidget();
                            }
                          )
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15.0,left:16.0,right: 16.0),
                      child: ListView.builder(
                          itemCount: 40,
                          itemExtent: ScreenUtil().setWidth(360.0), //强制高度为180.0
                          itemBuilder: (BuildContext context, int index) {
                            return PostItemWidget();
                          }
                      )
                    ),
                  ],                
                ),
        
        ),


    );

  }

  //4大筛选条件
  List<Widget> _getFiltrates(){
    List titleList = ['排序','岗位','班次','筛选'];
    List<Widget>  lists = new List();
    titleList.forEach((v){
      lists.add(
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    v,
                    style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontSize: ScreenUtil().setSp(24.0)
                    ),
                  ),
                  Text('\uE5C5',
                    style: TextStyle(
                        fontFamily: "MaterialIcons",
                        fontSize: ScreenUtil().setSp(48.0),
                        color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  )
                ],
              ),
       
          ),
      );
    });
    return lists;
  }

  //首页幻灯片
  Widget _carousel(){
    return  Container(
        height: ScreenUtil().setWidth(200.0),
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                  "images/test/timg.jpeg",
                  fit: BoxFit.fill,
                );
            },
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            // loop: false,
            // duration: 300,
            // autoplay: false,
            // onIndexChanged: (index) {
            //   debugPrint("index:$index");
            // },
            // onTap: (index) {
            //   debugPrint("点击了第:$index个");
            // },
            //control:SwiperControl(),
              pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                activeColor: Colors.white,
              )),
            //autoplayDelay: 3000,
            autoplayDisableOnInteraction : true
        ),
    );
  }
}




class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}


// class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar child;
 
//   StickyTabBarDelegate({@required this.child});
 
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