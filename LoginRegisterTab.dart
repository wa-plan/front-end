import 'package:flutter/material.dart';
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
@override
  void initState() {
    tabController.addListener(() {
      /// 프레임당 콜백
    });

    /// 탭바의 index가 변경되고 있는지 체크
    /// true or false
    tabController.indexIsChanging;

    /// 탭바의 개수
    tabController.length;

    /// 변경 전의 index
    tabController.previousIndex;

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginMainPage"),
      ),
  body: Column(
        children: [
          _tabBar(),
          ElevatedButton(
            onPressed: () {
              /// 애니메이션 없이 바로 변경
              tabController.index = 2;
            },
            child: const Text("이동"),
          ),
          ElevatedButton(
            onPressed: () {
              /// 애니메이션 없이 바로 변경
              tabController.animateTo(5);
            },
            child: const Text("이동 animateTo"),
          ),
        ],
      ),
    );
  }

  //탭 색상 및 폰트
  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),

      /// indicator에서  UnderlineTabIndicator 미사용
      indicatorWeight: 0,

      indicatorSize: TabBarIndicatorSize.label,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      
      onTap: (index) {},
      tabs: const [
        Tab(text: "로그인"),
        Tab(text: "회원가입"),
      ],
    );
  }

}
