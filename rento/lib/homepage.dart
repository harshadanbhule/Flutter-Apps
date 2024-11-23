// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inventory.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Function to return Gradient Colour in Inventory
  LinearGradient inventoryColor(int index) {
    if (index % 2 == 0) {
      return const LinearGradient(
        colors: [
          
          Colors.white,
          Colors.red,
          Colors.red,
        ],
        stops: [ 0.55, 0.55,1.0],
      );
    } else {
      return const LinearGradient(
        colors: [
      
          Colors.red,
          Colors.white,
          Colors.white,
        ],
        stops: [ 0.54, 0.54, 1.0],
      );
    }
  }

  // function for positioning text
  Positioned textPosition(int index) {
    if (index % 2 == 1) {
      return Positioned(
        top: 30,
        right: 10,
        child: Text(
          inventory[index].cycletitle,
          style: GoogleFonts.barlow(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Positioned(
        top: 30,
        left: 10,
        child: Text(
          inventory[index].cycletitle,
          style: GoogleFonts.barlow(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black),
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
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black),
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
              ),
            ),
            //color: Colors.black,
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
        left: 100,
        child: Image.asset(
          inventory[i].cycleImage,
          width: 320,
          height: 168,
          // You might need to adjust fit based on your SVG aspect ratio
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Positioned(
        top: 10,
        left: 10,
        child: Image.asset(
          inventory[i].cycleImage,
          width: 295,
          height: 168,
          // You might need to adjust fit based on your SVG aspect ratio
          fit: BoxFit.contain,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
            child: Container(
              color: Colors.white,
              //  padding: const EdgeInsets.only(left: 7, top: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.arrow_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(CupertinoIcons.shopping_cart),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(CupertinoIcons.person),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 7,
                  offset: const Offset(5, 10),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "  Find Bicycles, Accessories",
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
      ),
    );
  }
}
