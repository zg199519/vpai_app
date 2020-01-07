import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItemWidget extends StatefulWidget {
  @override
  _PostItemWidgetState createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> with AutomaticKeepAliveClientMixin{

  final String title = "Levis李维斯南方友谊天全职零售员";//岗位名称
  final String orgName = "李维斯（徐汇港汇店）";//门店名称
  final String jobPay = "5000-8000元/月";//岗位薪资
  final String distance = "距离100米";//岗位距离
  final List<String> tags = ['月结','限女生','20-50岁','包吃','包住'];//标签列表 最多5个
  final String vleaderReward = "2000";//微领队奖励
  final String vleaderRewardunit = "元/月";//微领队奖励单位
  final int button = 0;//0立即转发 1 继续转发

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
        child: GestureDetector(
          child: Container(
            height: ScreenUtil().setWidth(340.0),
            color: Colors.white,
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(30.0),left:ScreenUtil().setWidth(20.0),right: ScreenUtil().setWidth(20.0)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20.0)),
            child: Column(
              children: <Widget>[
                _getInfo(),
                Container(
                  height:ScreenUtil().setWidth(70.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            width: ScreenUtil().setWidth(140.0),
                            child: Text(
                              distance,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:ScreenUtil().setSp(24.0),
                                color:Color.fromRGBO(153, 153, 153, 1),
                              ),
                              ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(left:ScreenUtil().setWidth(20.0)),
                            child: Wrap(
                              spacing: ScreenUtil().setWidth(12.0), 
                              runSpacing: ScreenUtil().setWidth(8.0), 
                              alignment: WrapAlignment.start, 
                              children: _getTags(),
                            ),
                          )
                        ),

                    ],

                  ),
                ),
                //底部按钮区域
                Container(
                  height: ScreenUtil().setWidth(100.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: ScreenUtil().setWidth(2.0),
                          color: Color.fromRGBO(215, 215, 215, 1)
                        )
                      ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Image.asset("images/reward_icon_@2x.png",
                              height: ScreenUtil().setWidth(30.0)
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: ScreenUtil().setWidth(20.0),right: ScreenUtil().setWidth(20.0)),
                              child: Text('奖励',
                                style: TextStyle(
                                  fontSize:ScreenUtil().setSp(24.0),
                                  color:Color.fromRGBO(50, 50, 50, 1),
                                )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text('2000',
                                  style: TextStyle(
                                    fontSize:ScreenUtil().setSp(36.0),
                                    color:Color.fromRGBO(253, 124, 4, 1),
                                    fontWeight: FontWeight.w800
                                  ),
                                ),
                            ),
                            Text('元/月',
                              style: TextStyle(
                                fontSize:ScreenUtil().setSp(24.0),
                                color:Color.fromRGBO(50, 50, 50, 1),
                              )
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          width: ScreenUtil().setWidth(190.0),
                          height:  ScreenUtil().setWidth(60.0),
                          child: RaisedButton(
                            color:Color.fromRGBO(253, 124, 4, 1),
                            textColor:Colors.white,
                            child: Text("立即转发",style: TextStyle(fontSize: ScreenUtil().setSp(28.0))),
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenUtil().setWidth(40.0))),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ] 
                  ),
                ),
              ],
            ),

          ),
          onTap: (){
            Navigator.of(context).pushNamed('home/post_details');
          },//点击
        )
      );
  }


  //获取标签列表
  List<Widget> _getTags(){
    List<Widget> lists = new List();
    void getItem(String element) {
      lists.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(4.0)),
          child: Container(
            color:Color.fromRGBO(51, 140, 255, 0.2),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8.0), vertical: ScreenUtil().setWidth(4.0)),
            // margin: EdgeInsets.only(right: 6.0),
            child: Text(
                  element, 
                  style: TextStyle(
                    color: Color.fromRGBO(51, 140, 255, 1),
                    fontSize:ScreenUtil().setSp(20.0),
                  )
            )
          )
        ),
      );
    }
    tags.forEach(getItem);
    return lists;

  }

  //岗位基本信息
  Widget _getInfo(){
      return Container(
              height: ScreenUtil().setWidth(140.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Image(
                        image: NetworkImage(
                            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4274440928,80693673&fm=26&gp=0.jpg"),
                            width: ScreenUtil().setWidth(140.0),
                            height: ScreenUtil().setWidth(140.0),
                            fit:BoxFit.cover
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(20.0)),
                        // alignment:Alignment.centerLeft,
                        height: ScreenUtil().setWidth(140.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: ScreenUtil().setWidth(46.0),
                              width: double.infinity,
                              child: Text(
                                title,
                                maxLines:1,
                                textAlign: TextAlign.left,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize:ScreenUtil().setSp(28.0),
                                  color:Color.fromRGBO(50, 50, 50, 1),
                                  fontWeight:FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenUtil().setWidth(46.0),
                              width: double.infinity,
                              child: Text(
                                orgName,
                                maxLines:1,
                                textAlign: TextAlign.left,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize:ScreenUtil().setSp(24.0),
                                  color:Color.fromRGBO(153, 153, 153, 1),
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenUtil().setWidth(48.0),
                              width: double.infinity,
                              child: Text(
                                jobPay,
                                maxLines:1,
                                textAlign: TextAlign.left,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize:ScreenUtil().setSp(32.0),
                                  color:Color.fromRGBO(253, 124, 4, 1),
                                  fontWeight:FontWeight.w800,
                                ),                              
                              ),
                            )                     
                          ],
                        ),
                        
                      ),
                    )
                ],

              ),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

