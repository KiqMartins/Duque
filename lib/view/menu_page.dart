import 'package:duque_v1/view/marketplaces_page.dart';
import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:duque_v1/widgets/transitions.dart';
import 'package:duque_v1/widgets/about_me_screen.dart';
import 'package:duque_v1/view/products_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final _pageViewController = PageController();

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: const [
          MarketPlacesPage(),
          ProductPage()
          ],
          onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        }
      ),
      appBar: AppBar(
        title: Text(currentPageIndex == 0 ? 'Marketplaces' : 'Produtos'),
        backgroundColor: mainGreen,
      ),
      drawer: SidebarX(
        headerBuilder: (context, extended) {
        return  SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
            child: Row(
              children: const [
                Text(
                  'Olá, ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  'Caique!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 223, 221, 221)
                  )
                ),
              ],
            ),
          ),
        );
      },
        theme: SidebarXTheme(
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: mainWhite.withOpacity(0.5)),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: mainWhite,),
          ),
          iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 25,
        ),
          width: 205,
          selectedTextStyle: TextStyle(
            color: mainWhite
          ),
          itemTextPadding: const EdgeInsets.only(
            left: 30
          ),
          selectedItemTextPadding: const EdgeInsets.only(
            left: 30
          ),
          decoration: BoxDecoration(
            color: mainGreen
          )
        ),
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: [
          SidebarXItem(
            icon: Icons.help_rounded, 
            label: 'Sobre',
            onTap: (){
              Navigator.of(context).push(transition(AboutMeScreen())
              );
            }
          ),
        ],
      ),
      
      bottomNavigationBar: NavigationBar(
        height: 60,
        surfaceTintColor: mainGreen,
        shadowColor: mainGreen,
        backgroundColor: mainGreen,
        //animationDuration: const Duration(milliseconds: 10),
        selectedIndex: currentPageIndex,
       onDestinationSelected: (int index){
        setState(() {
          currentPageIndex = index;
          _pageViewController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.bounceOut);          
          }
        );
       },
       destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.shopping_cart), 
          label: '',
          ),
        NavigationDestination(
          icon: Icon(Icons.shopping_bag) , 
          label: '')
       ],
    ),
    );
  }
}


