// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:Cat_Care_App/CatBreed_model.dart';
import 'package:Cat_Care_App/http_service.dart';
// ignore_for_file: prefer_const_constructors

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected_inx = 0;
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var Price_Container = <GestureDetector>[];
    var list = List<int>.generate(6, (i) => i + 1);
    list.forEach((i) {
      Color _color = (i == selected_inx)
          ? Color.fromRGBO(112, 130, 228, 1)
          : Color.fromRGBO(240, 241, 255, 1);
      return Price_Container.add(Budget_select(i, screenSize, _color));
    });

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromRGBO(242, 243, 251, 1),
            body: SafeArea(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: Offset(0, 7),
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(234, 152, 181, 1)),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(Icons.perm_identity_sharp,
                              size: 35, color: Colors.white)),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: const Offset(0, 7),
                                    blurRadius: 6)
                              ],
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_none_rounded,
                                  size: 35, color: Colors.black)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: const Offset(0, 7),
                                    blurRadius: 6)
                              ],
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.menu,
                                  size: 35, color: Colors.black)),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, top: 50),
                  child: Text(
                    "Budget for preparation",
                    style: TextStyle(
                        color: Color.fromRGBO(54, 57, 95, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 50,
                        children: Price_Container)),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Cat breed",
                    style: TextStyle(
                        color: Color.fromRGBO(54, 57, 95, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //TODO:
                FutureBuilder(
                    future: httpService.getCatBreeds(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CatBreed>> snapshot) {
                      if (snapshot.hasData) {
                        List<CatBreed>? catBreeds = snapshot.data;
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 30, right: 20),
                            child: GridView.count(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                children: catBreeds!
                                    .map((CatBreed catBreeds) => Cat_breeds(
                                        catBreeds.name, catBreeds.url))
                                    .toList()),
                          ),
                        );
                      } else {
                        return Center(
                            child: Center(child: CircularProgressIndicator()));
                      }
                    })
              ],
            ))));
  }

  GestureDetector Cat_breeds(String name, String image) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromRGBO(255, 255, 255, 1)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "${image}",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "${name}",
                  style: TextStyle(
                      color: Color.fromRGBO(54, 57, 95, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector Budget_select(int i, Size screenSize, Color _color) {
    return GestureDetector(
      onTap: () {
        // print("hello world");
        setState(() {
          selected_inx = i;
        });
        print(i * 50);
      },
      child: Container(
        width: screenSize.width * 0.2,
        height: screenSize.height * 0.0783,
        // padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '${i * 50}\$',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
