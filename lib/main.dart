import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("MyBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final mybox = Hive.box("MyBox");
  List mydata = [];
  int? selectedKey;

  @override
  void initState() {
    super.initState();
    getItem();
  }

  Future<void> addItem(Map<String, dynamic> data) async {
    //data will come in key:value format
    await mybox.add(data);
    getItem();
  }

  Future<void> deleteItem(dynamic key) async {
    await mybox.delete(key);
    getItem();
  }

  Future<void> updateItem(dynamic key, Map<String, dynamic> updatedData) async {
    await mybox.put(key, updatedData);
    getItem();
  }

  // Hive Data                                              Mydata
  // {                                                       [
  // 0: {'title': 'Apple', 'price': '20'},                      {'Key': 0, 'title': 'Apple', 'price': '20'},
  // 1: {'title': 'Banana', 'price': '10'},                     {'key': 1, 'title': 'Banana', 'price': '10'}
  // }                                                       ]
  void getItem() {
    setState(() {
      mydata = mybox.keys
          .map(
            (e) => {
              'Key': e,
              'title': mybox.get(e)['title'] ?? '',
              'price': mybox.get(e)['price'] ?? '',
            },
          )
          .toList();
    });
  }

  // void handleEdit(int key, String title, String price) {
  //   setState(() {
  //     selectedKey = key;
  //     nameController.text = title;
  //     priceController.text = price;
  //   });
  // }

  // void clearForm() {
  //   setState(() {
  //     selectedKey = null;
  //     nameController.clear();
  //     priceController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(width: 4, color: Colors.tealAccent),
              ),
              child: const Center(
                child: Text(
                  "--:Hive Database App:--",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                controller: nameController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 80, 75),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Product Name",
                  prefixIcon: Icon(
                    Icons.shopping_cart_outlined,
                    color: const Color.fromARGB(255, 0, 80, 75),
                  ),
                  hintStyle: TextStyle(color: Colors.teal.withOpacity(0.9)),
                  filled: true,
                  fillColor: Colors.teal[50],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 80, 75),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                controller: priceController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 80, 75),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Price",
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: const Color.fromARGB(255, 0, 80, 75),
                  ),
                  hintStyle: TextStyle(color: Colors.teal.withOpacity(0.9)),
                  filled: true,
                  fillColor: Colors.teal[50],
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text.trim().isNotEmpty &&
                          priceController.text.trim().isNotEmpty) {
                        final Map<String, dynamic> m1 = {
                          "title": nameController.text,
                          "price": priceController.text,
                        };

                        if (selectedKey != null) {
                          updateItem(selectedKey, m1);
                        } else {
                          addItem(m1);
                        }
                        setState(() {
                          selectedKey = null;
                          nameController.clear();
                          priceController.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please fill in both fields",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 50, 50),
                      foregroundColor: Colors.teal[50],
                      elevation: 5,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(
                      selectedKey != null ? Icons.update : Icons.save,
                      size: 20,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        selectedKey != null ? "Update" : "Save",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),

                if (selectedKey != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedKey = null;
                          nameController.clear();
                          priceController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.teal[50],
                        elevation: 5,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.cancel, size: 20),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mydata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${mydata[index]['title']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                      ),
                    ),
                    subtitle: Text(
                      "${mydata[index]['price']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedKey = mydata[index]['Key'];
                          nameController.text = mydata[index]['title'];
                          priceController.text = mydata[index]['price'];
                        });
                      },
                      icon: const Icon(Icons.edit, color: Colors.tealAccent),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        deleteItem(mydata[index]['Key']);
                      },
                      icon: const Icon(Icons.delete, color: Colors.tealAccent),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
