import 'package:flutter/material.dart';

//一级路由页面
import '../pages/home_page.dart';//首页
import '../pages/job_page.dart';//求职者
import '../pages/group_page.dart';//V团队
import '../pages/user_page.dart';//会员中心页面

//二级路由页面
import '../pages/home/position_details.dart';//岗位详情


class RouterConfig {

 Map<String, WidgetBuilder> routers = {
    "home": (context) {
      return HomePage();
    },
    "job": (context) {
      return JobPage();
    },
    "group": (context) {
      return GroupPage();
    },
    "job": (context) {
      return JobPage();
    },
    "user": (context) {
      return UserPage();
    },
    "home/post_details": (context) {
      return PositionDetails();
    },
  }; 

  //get
  getRouter(String name){
    return routers[name];
  }

  getRouterMap(){
    return routers;
  }

}