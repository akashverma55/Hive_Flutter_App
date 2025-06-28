import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                "--:Hive Database:--",
                style: TextStyle(
                  color: Colors.teal[50],
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.tealAccent.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 80, 75),
                fontWeight: FontWeight.bold,
              ), // Optional: set input text color
              decoration: InputDecoration(
                hintText: "Enter Product Name",
                prefixIcon: Icon(
                  Icons.shopping_cart_outlined,
                  color: const Color.fromARGB(255, 0, 80, 75),
                ),
                hintStyle: TextStyle(color: Colors.teal.withOpacity(0.9)),
                filled: true, // ✅ This enables the background color
                fillColor: Colors.teal[85], // ✅ This is the background color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 80, 75),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.tealAccent.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 80, 75),
                fontWeight: FontWeight.bold,
              ), // Optional: set input text color
              decoration: InputDecoration(
                hintText: "Enter Price",
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: const Color.fromARGB(255, 0, 80, 75),
                ),
                hintStyle: TextStyle(color: Colors.teal.withOpacity(0.9)),
                filled: true, // ✅ This enables the background color
                fillColor: Colors.teal[85], // ✅ This is the background color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 80, 75),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
            child: ElevatedButton(
              onPressed: (){
            
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[900],
                foregroundColor: Colors.teal[50],
                elevation: 5,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save,size: 20,),
                    SizedBox(width: 10),
                    Text("Save",style: TextStyle(fontSize: 18),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
