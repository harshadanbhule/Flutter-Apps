import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rento/cart.dart';
import 'inventory.dart';
import 'product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isHovered = false;

  LinearGradient inventoryColor(int index) {
    if (index % 2 == 0) {
      return const LinearGradient(
        colors: [
          Colors.transparent,
          Colors.transparent,
          Color.fromRGBO(221, 18, 18, 1),
          Color.fromRGBO(221, 18, 18, 1),
        ],
        stops: [0.0, 0.55, 0.55, 1.0],
      );
    } else {
      return const LinearGradient(
        colors: [
          Color.fromRGBO(221, 18, 18, 1),
          Color.fromRGBO(221, 18, 18, 1),
          Colors.transparent,
          Colors.transparent,
        ],
        stops: [0.0, 0.54, 0.54, 1.0],
      );
    }
  }

  // Function for positioning text
  Positioned textPosition(int index) {
    if (index % 2 == 1) {
      return Positioned(
        top: 30,
        right: 10,
        child: Text(
          inventory[index].cycletitle,
          style: GoogleFonts.barlowCondensed(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      );
    } else {
      return Positioned(
        top: 30,
        left: 10,
        child: Text(
          inventory[index].cycletitle,
          style: GoogleFonts.barlowCondensed(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      );
    }
  }

  // Function for Button Position
  Positioned buttonPosition(int i) {
    if (i % 2 == 1) {
      return Positioned(
        top: 140,
        right: 20,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Product()),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black),
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
              ),
            ),
            height: 30,
            width: 100,
            child: Center(
              child: Text(
                "VIEW COLLECTION",
                style: GoogleFonts.barlow(
                    fontSize: 11, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        top: 140,
        left: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Product()),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black),
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
              ),
            ),
            height: 30,
            width: 100,
            child: Center(
              child: Text(
                "VIEW COLLECTION",
                style: GoogleFonts.barlow(
                    fontSize: 11, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      );
    }
  }

  Positioned imagePosition(int i) {
    if (i % 2 == 0) {
      return Positioned(
        top: 10,
        left: 110,
        child: Image.asset(
          inventory[i].cycleImage,
          width: 320,
          height: 168,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Positioned(
        top: 10,
        right: 126,
        child: Image.asset(
          inventory[i].cycleImage,
          width: 295,
          height: 168,
          fit: BoxFit.contain,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(221, 18, 18, 1),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Rento",
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 80,
                            width: 80,
                            child:
                                Image.asset("assets/images/enter/profile.png")),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "harshadanbhule",
                              style: GoogleFonts.roboto(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "harshad@gmail.com",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                tileColor: isHovered ? Colors.grey[300] : Colors.transparent, 
                leading: const Icon(CupertinoIcons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Product()),
                  );
                },
                
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.shopping_cart),
                title: const Text("Cart"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 7, top: 40, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.bars),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()),
                          );
                        },
                        child: const Icon(CupertinoIcons.shopping_cart),
                      ),
                      const SizedBox(width: 10),
                      const Icon(CupertinoIcons.person),
                    ],
                  ),
                ],
              ),
            ),
            // Additional UI for HomePage
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Find Your Favorite",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Bicycle!",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            // Added SizedBox to provide spacing between widgets
            // const SizedBox(
            //   height: 20,
            // ),
            // Wrapped the TextField with a Container and applied shadow
            Container(
              width: 316,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 7,
                    offset: const Offset(5, 10),
                  ),
                ],
              ),
              child: SizedBox(
                width: 316,
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "  Find Bicycles, Accessories",
                  ),
                ),
              ),
            ),

            // Wrapped ListView.builder with a SizedBox to provide finite height
            Expanded(
              child: ListView.builder(
                itemCount: inventory.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 185.7,
                        decoration: BoxDecoration(
                          gradient: inventoryColor(index),
                        ),
                      ),
                      textPosition(index),
                      imagePosition(index),
                      buttonPosition(index),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
