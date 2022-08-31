import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../data/data.dart';
import '../widgets/following_users.dart';
import '../widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: GradientText('FRIENDY',colors:const [Colors.lightBlue,Colors.lightGreen],style:const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),) ,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          tabs: const <Widget>[
            Tab(
              text: 'Following',
              icon: Icon(Icons.trending_up),
            ),
            Tab(
              text: 'For You',
              icon: Icon(Icons.local_fire_department),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: <Widget>[
              const FollowingUsers(),
              PostsCarousel(
                pageController: _pageController,
                title: 'Posts',
                posts: posts,
              ),
            ],
          ),
         ListView(
            children: <Widget>[
              const FollowingUsers(),
              PostsCarousel(
                pageController: _favoritesPageController,
                title: 'Posts',
                posts: posts,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.blue,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.blue,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.blue,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,),label: '')
      ]),
    );
  }
}
