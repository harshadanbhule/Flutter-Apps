import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'enter.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late AnimationController _controller5;

  @override
  void initState() {
    super.initState();

    // Initialize controllers for each animation
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _controller5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
            colors: [
              Color(0xFF090808),
              Color(0xFF101010),
              Color(0xFF151414),
              Color(0xFF1C1B1B),
              Color(0xFF201F1F),
              Color(0xFF282727),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            // Row 1 with left animation
            AnimatedBuilder(
              animation: _controller1,
              builder: (context, child) {
                final offset = _controller1.value * 50;
                return Transform.translate(
                  offset: Offset(-50 + offset, 0),
                  child: child,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BE ",
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w500,
                      fontSize: 56,
                      color: const Color.fromARGB(228, 255, 255, 255),
                      letterSpacing: 5.0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "UNIQUE",
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w500,
                      fontSize: 56,
                      color: const Color.fromRGBO(222, 19, 19, 0.9),
                      letterSpacing: 5.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            // Row 2 with right animation
            AnimatedBuilder(
              animation: _controller2,
              builder: (context, child) {
                final offset = _controller2.value * 50;
                return Transform.translate(
                  offset: Offset(50 - offset, 0),
                  child: child,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "RIDE",
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w500,
                      fontSize: 56,
                      color: const Color.fromRGBO(222, 19, 19, 0.9),
                      letterSpacing: 5.0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "WITH",
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w500,
                      fontSize: 56,
                      color: const Color.fromARGB(228, 255, 255, 255),
                      letterSpacing: 5.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            // Row 3 with left animation
            AnimatedBuilder(
              animation: _controller3,
              builder: (context, child) {
                final offset = _controller3.value * 50;
                return Transform.translate(
                  offset: Offset(-50 + offset, 0),
                  child: child,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "STYLE",
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w500,
                      fontSize: 56,
                      color: const Color.fromARGB(228, 255, 255, 255),
                      letterSpacing: 5.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Image.asset("assets/images/Rectangle 51.png"),
            const SizedBox(height: 2),
            SizedBox(
              width: 102,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Enter()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(0, 88, 57, 241),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  "Next",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: const Color.fromARGB(228, 255, 255, 255),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
