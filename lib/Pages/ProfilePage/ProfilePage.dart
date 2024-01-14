import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Controller/ParkingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CCTVPage/CctvPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfilePage"),
        actions: [
          IconButton(
            onPressed: () {
              parkingController.personalBooking();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
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
                        "Root User",
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
            Obx(
              () => parkingController.isLoading.value
                  ? LinearProgressIndicator()
                  : Column(
                      children: parkingController.yourBooking
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "Assets/Photos/car.png",
                                              width: 150,
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("SLOT NO: ${e.slotNumber}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium),
                                                SizedBox(height: 10),
                                                Text("${e.name}",
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Booking Time",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                ),
                                                Text(
                                                  "${e.parkingFromTime}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Parking Time",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                ),
                                                Text(
                                                  "${e.parkingToTime}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 30),
                                            Column(
                                              children: [
                                                SizedBox(height: 20),
                                                Text("Booking Amount"),
                                                Row(
                                                  children: [
                                                   Image.asset("Assets/Icons/currency.png",width: 40,),
                                                    Text(
                                                      "${e.totalAmount}",
                                                      style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            e.parkingStatus == "parked"
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController
                                                          .checkout(
                                                              e.slotNumber!);
                                                    },
                                                    icon: Icon(Icons.done),
                                                    label: Text("Check Out"),
                                                  )
                                                : ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController.cancleBooking(e.slotNumber!);
                                                    },
                                                    icon: Icon(Icons.close),
                                                    label:
                                                        Text("Cancel Booking"),
                                                  ),
                                            e.parkingStatus == "booked"
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController.parked(
                                                          e.slotNumber!);
                                                    },
                                                    icon: Icon(
                                                        Icons.local_parking),
                                                    label: Text(
                                                        "Car Parked"),
                                                  )
                                                : const Text("Car parked"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
