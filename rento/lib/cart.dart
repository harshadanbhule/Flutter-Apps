import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rento/models/cartModelclass.dart'; // Assuming your CartItem class is in this file

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Function to calculate total price
  double getTotalPrice() {
    return viewCart.fold(
      0.0,
      (total, item) => total + (item.price ?? 0),
    );
  }

  // Function to calculate GST (8%)
  double getGST() {
    return getTotalPrice() * 0.08; // 8% GST
  }

  // Function to calculate final price with GST and deposit
  double getFinalPrice() {
    return getTotalPrice() + getGST() + 100; // Adding deposit of 100 INR
  }

  // Function to remove an item
  void removeItem(int index) {
    setState(() {
      viewCart.removeAt(index);
    });
  }
   void showBookingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                "Booking Completed!",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your booking is confirmed. You can now proceed with payment.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Okay",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Booking Cart",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: viewCart.isEmpty
                  ? Center(
                      child: Text(
                        "Your cart is empty",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: viewCart.length,
                      itemBuilder: (context, i) {
                        return buildCartItem(viewCart[i], i);
                      },
                    ),
            ),
          ),
          // Total Price Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price:",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${getTotalPrice().toStringAsFixed(2)} INR",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(41, 41, 41, 0.87),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST (8%):",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${getGST().toStringAsFixed(2)} INR",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(41, 41, 41, 0.87),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Deposit:",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "100 INR",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(41, 41, 41, 0.87),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Final Price:",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${getFinalPrice().toStringAsFixed(2)} INR",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(221, 18, 18, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Book Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
             child: SizedBox(
              height: 42,
              width: 160,
               child: ElevatedButton(
                onPressed: (){
                 showBookingDialog();
                },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shadowColor: const Color.fromRGBO(203, 214, 255, 1),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromRGBO(221, 18, 18, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                child: Text(
                  "Book",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                           ),
             ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget buildCartItem(dynamic cartItem, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 0,
              blurRadius: 4.96,
              offset: Offset(4, 4),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.3, 1.0],
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 0.5),
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 152,
              child: Image.asset(cartItem.asset!),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  cartItem.model!.join(''),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Bicycle",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: const Color.fromRGBO(193, 193, 193, 1)),
                ),
                const SizedBox(height: 22),
                Text(
                  '${cartItem.price} INR',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "per day",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                      color: const Color.fromRGBO(193, 193, 193, 1)),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 28,
              width: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.96),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  removeItem(index); // Call the remove function
                },
                child: Center(
                child: Text(
                                      "Remove",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        color: const Color.fromRGBO(
                                            221, 18, 18, 1),
                                      ),
                                    ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
