import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './group_page.dart';
import './job_page.dart';
import './user_page.dart';
import './home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex = 0;//底部导航索引值
  var currentPage;

  //底部页面
  final List tabBodies = [
    HomePage(),
    GroupPage(),
    JobPage(),
    UserPage()
  ];

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
        ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

        List<BottomNavigationBarItem> tabs = [
        BottomNavigationBarItem(
          icon: Image.asset("images/home.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          activeIcon: Image.asset("images/home_pitch.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          title: Text("岗位"),
        ),
        BottomNavigationBarItem(
          icon: Image.asset("images/v_group.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          activeIcon: Image.asset("images/v_group_pitch.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          title: Text("V团队"),
        ),
        BottomNavigationBarItem(
          icon: Image.asset("images/job.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          activeIcon: Image.asset("images/job_pitch.png", width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          title: Text("求职者"),
        ),
        BottomNavigationBarItem(
          icon: Image.asset("images/user.png", width: 24, height: 24),
          activeIcon: Image.asset("images/user_pitch.png", width: 24 , height: 24),
          title: Text("我的"),
        ),
      ];

      return Scaffold(
        
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: tabs,
          onTap: (index){
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          },
        ),
        body: currentPage,
      );
  }
}