import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_Detail.dart';
import 'login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LoginController getDataController;
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  final List<String> _appBarTitles = ['All Courses', 'My Courses'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

 @override
  void initState() {
   super.initState();
   print("data is coming ");
   getDataController = Get.put(LoginController());
   getDataController.getDataFromApi();
  }


  @override
  Widget build(BuildContext context) {
    return  Obx(() =>
        Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF00008B).withOpacity(0.1),
              title: Center(child: Text(_appBarTitles[_selectedIndex])),
              automaticallyImplyLeading: false, // Remove the back button
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'signout') {
                      Future.delayed(Duration.zero, () {
                        Get.toNamed('/login');
                      });
                    } else if (value == 'option2') {
                      print("profile screen");
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'signout',
                        // onTap: (){
                        //   Get.toNamed('/login');
                        // },
                        child: Text('SignOut'),
                      ),
                      PopupMenuItem<String>(
                        value: 'option2',
                        child: Text('Profile'),
                      ),
                      // Add more PopupMenuItem widgets for additional options
                    ];
                  },
                ),
              ],
            ),
          // ... The rest of your Scaffold content ...
            body:   !getDataController.isLoading.value?
            PageView(
                controller: _pageController,
                onPageChanged: _onItemTapped,
                children: [
                  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: getDataController.getDataModel.value.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            print("object");
                            // Get.toNamed('/detail');
                            // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Detail()));
                            // Button action
                          },
                          child: Container(
                            color: Color(0xFF00008B).withOpacity(0.1),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Image.network(
                                    getDataController.getDataModel.value.data![index].imageUrl ?? 'assets/images/almond.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: Text(
                                      getDataController.getDataModel.value.data![index].name??"name",
                                      style: TextStyle(fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
                  Center(
                    child: Text('My Courses Screen'),
                  ),
                ]
            ) :const Center(
              child: CircularProgressIndicator(),
            ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: 'All Courses',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'My Courses',
              ),
            ],
          ),
        )
    );
  }
}
