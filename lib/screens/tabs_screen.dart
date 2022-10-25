import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorite_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        //type:BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              //     backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              //         backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}

/*
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
            ],
          ),
        ),
      body: const TabBarView(children: [ //يجب أن يتوافق ترتيب الشاشات مع ترتيب التابات
        CategoriesScreen(),
        FavoriteScreen(),
      ],),
      ),
*/
