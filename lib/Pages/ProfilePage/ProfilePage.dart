import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CCTVPage/CctvPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfilePage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${authController.auth.currentUser!.displayName ?? "Root User"}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${authController.auth.currentUser!.email}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Your Bookings",
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "Assets/Photos/car.png",
                                  width: 150,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("SLOT A-01",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                    SizedBox(height: 10),
                                    Text("Nitish Kumar",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Booking Time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    Text(
                                      "2021-05-20  10:00 AM",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Paking Time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    Text(
                                      "2021-05-20  10:00 AM",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 30),
                                const Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text("Booking Amount"),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          size: 40,
                                        ),
                                        Text(
                                          "300",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.done),
                                  label: Text("Check Out"),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.local_parking),
                                  label: Text("Car Parked"),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Get.to(
                                    //   CctvPage(),
                                    // );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.videocam_rounded,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
