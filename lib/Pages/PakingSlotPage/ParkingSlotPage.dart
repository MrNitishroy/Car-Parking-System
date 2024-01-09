import 'package:car_parking_system/ConstData.dart';
import 'package:car_parking_system/Pages/PakingSlotPage/Widgets/ParkingSlot.dart';
import 'package:flutter/material.dart';

class ParkingSlotPage extends StatelessWidget {
  const ParkingSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PARKING SLOTS",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Text("ENTRY"), Icon(Icons.keyboard_arrow_down)],
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: ParkingSlot(
                    isBooked: true,
                    isParked: true,
                    slotName: "A-1",
                    slotId: "1",
                    time: "12:00",
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: ParkingSlot(
                    isBooked: true,
                    isParked: true,
                    slotName: "A-2",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-1",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-2",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-1",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-2",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-1",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: ParkingSlot(
                    isBooked: false,
                    isParked: false,
                    slotName: "A-2",
                    slotId: "1",
                    time: "0:0",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Text("EXIT"), Icon(Icons.keyboard_arrow_down)],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Made By ❤️ : $LeaderName",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
