import 'package:car_parking_system/Models/ParkingModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../Components/ConfirmPop.dart';

class ParkingController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  String parkingSlot1Id = "A-0";
  String parkingSlot2Id = "A-1";
  String parkingSlot3Id = "A-2";
  String parkingSlot4Id = "A-3";
  String parkingSlot5Id = "A-4";
  String parkingSlot6Id = "A-5";
  String parkingSlot7Id = "A-6";
  String parkingSlot8Id = "A-7";
  String parkingSlot9Id = "A-8";
  RxList<ParkingModel> parkingList = RxList<ParkingModel>();
  RxList<ParkingModel> yourBooking = RxList<ParkingModel>();
  RxBool isYourCarParked = false.obs;
  RxDouble time = 10.0.obs;
  RxDouble amount = 50.0.obs;
  RxBool isLoading = false.obs;
  Rx<ParkingModel> parkingSlot0 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot1 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot2 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot3 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot4 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot5 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot6 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot7 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot8 = ParkingModel().obs;
  void onInit() async {
//  await   dataInit();
    // getSlot1Info();
    // await dataInit();
    await getParkingInfo();
    super.onInit();
  }

  Future<void> dataInit() async {
    parkingList = RxList<ParkingModel>([
      ParkingModel(
        id: parkingSlot1Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-0",
      ),
      ParkingModel(
        id: parkingSlot2Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-1",
      ),
      ParkingModel(
        id: parkingSlot3Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-2",
      ),
      ParkingModel(
        id: parkingSlot4Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-3",
      ),
      ParkingModel(
        id: parkingSlot5Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-4",
      ),
      ParkingModel(
        id: parkingSlot6Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-5",
      ),
      ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-6",
      ),
      ParkingModel(
        id: parkingSlot8Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-7",
      ),
      ParkingModel(
        id: parkingSlot8Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-8",
      ),
    ]);
    for (var item in parkingList) {
      await db.collection("parking").doc(item.id).set(item.toJson());
    }
    print("Parking Slots Initialized");
  }

  Future<void> getParkingInfo() async {
    isLoading.value = true;
    parkingList.clear();
    await db.collection("parking").get().then((value) {
      for (var item in value.docs) {
        parkingList.add(ParkingModel.fromJson(item.data()));
      }
      isLoading.value = false;
    }, onError: (e) {
      print(e);
      isLoading.value = false;
    });
  }

  Future<void> bookSlot(
    String name,
    String vehicalNumber,
    String slotId,
    BuildContext context,
  ) async {
    try {
      await db.collection("parking").doc(slotId).update(
        {
          "id": slotId,
          "name": name,
          "slotNumber": slotId,
          "status": "booked",
          "parkingStatus": "booked",
          "vehicalNumber": vehicalNumber,
          "totalAmount": amount.value.toString(),
          "totalTime": time.value.toString(),
        },
      );
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection("parking")
          .doc(slotId)
          .set(
        {
          "name": name,
          "status": "booked",
          "parkingStatus": "booked",
          "vehicalNumber": vehicalNumber,
          "slotNumber": slotId,
          "id": slotId,
          "totalAmount": amount.value.toString(),
          "totalTime": time.value.toString(),
        },
      );
      await getParkingInfo();
      BookedPopup(context, slotId, amount.value.toString(),
          time.value.toString(), name, vehicalNumber);
    } catch (e) {
      print(e);
    }
  }

  Future<void> personalBooking() async {
    isLoading.value = true;
    yourBooking.clear();
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .get()
        .then((value) {
      for (var item in value.docs) {
        yourBooking.add(ParkingModel.fromJson(item.data()));
      }
    });
    isLoading.value = false;
  }

  Future<void> checkout(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "id": slotId,
        "name": "",
        "slotNumber": slotId,
        "parkingStatus": "available",
        "vehicalNumber": "",
        "totalAmount": "",
        "totalTime": "",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .delete();
    await personalBooking();
    await getParkingInfo();
    isLoading.value = false;
  }

  Future<void> parked(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "parkingStatus": "parked",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .update(
      {
        "parkingStatus": "parked",
      },
    );
    await personalBooking();
    await getParkingInfo();
    isLoading.value = false;
  }

  Future<void> cancleBooking(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "id": slotId,
        "name": "",
        "slotNumber": slotId,
        "parkingStatus": "available",
        "vehicalNumber": "",
        "totalAmount": "",
        "totalTime": "",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .delete();
    await personalBooking();
    await getParkingInfo();
    isLoading.value = false;
  }

  Future<void> checkingCarisParkedOrNot() async{
    for(var car in yourBooking)
    {
      if(car.parkingStatus=="parked")
      {
        isYourCarParked.value = true;
        return;

      }
      else{
        isYourCarParked.value = false;
        return;
      }
    }
  }
}
