// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});
//
//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }
//
// class _CounterScreenState extends State<CounterScreen> {
//   int number = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           backgroundColor: Colors.amber,
//           title: Text(
//             "Counter App",
//             style: TextStyle(
//               fontSize: 35,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 200.0),
//           child: Column(
//             children: [
//               Text(
//                 number.toString(),
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           number++;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         height: 50,
//                         width: 100,
//                         child: Center(
//                           child: Text(
//                             "UP",
//                             style: TextStyle(
//                               fontSize: 35,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 125,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         number--;
//                       });
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.amber,
//                       ),
//                       height: 50,
//                       width: 100,
//                       child: Center(
//                         child: Text(
//                           "Down",
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:counter_app/Auth_Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int value = 0; // initial value
  double percentage = 0.5; // initial percentage for progress (50%)
  Color color = Colors.blue; // initial color

  void increment() {
    setState(() {
      if (value < 100) {
        value += 10;
        percentage = value / 100;
        color = Colors.green;
      }
    });
  }

  void decrement() {
    setState(() {
      if (value > 0) {
        value -= 10;
        percentage = value / 100;
        color = Colors.blue;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey,
                          title: Text(
                            "Are you sure you want to Logout?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          actions: [
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.black,
                                    ),
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                SizedBox(
                                  width: 90,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                          (route) => false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.black),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                              ],
                            )
                          ],
                        ));
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circular progress for dial
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: CircularProgressIndicator(
                          value: percentage,
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation(color),
                          backgroundColor: Colors.grey[700],
                        ),
                      ),
                      // Value in the center
                      Positioned(
                        bottom: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$value',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Wh',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Increment and decrement buttons
                      Positioned(
                        bottom: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: decrement,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                                shape: CircleBorder(),
                              ),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: increment,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                                shape: CircleBorder(),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 30),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 150,
                    width: 150,
                    child: Stack(alignment: Alignment.center, children: [
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 38.0, right: 10),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0, right: 10),
                        child: Text(
                          'Add Image',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20),
                  child: Stack(children: [
                    Container(
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 38.0, right: 10),
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      alignment: Alignment.topRight,
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, left: 30),
                      child: Text(
                        'Add Text',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ]),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30),
                  child: Container(
                    child: Stack(children: [
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 38.0, right: 10),
                          child: Icon(
                            Icons.account_balance,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0, left: 20),
                        child: Text(
                          'Add Count',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ]),
                    alignment: Alignment.topLeft,
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Container(
                    child: Stack(children: [
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 38.0, right: 10),
                          child: Icon(
                            Icons.access_time_filled,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0, left: 20),
                        child: Text(
                          'Add Watch',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ]),
                    alignment: Alignment.topRight,
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
