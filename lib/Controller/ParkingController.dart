import 'package:car_parking_system/Models/ParkingModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ParkingController extends GetxController {
  final db = FirebaseFirestore.instance;
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

 void onInit() async {
//  await   dataInit();
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
  
  Future<void> getParkingInfo() async{
    parkingList.clear();
    await db.collection("parking").get().then((value) {
      for (var item in value.docs) {
        parkingList.add(ParkingModel.fromJson(item.data()));
      }
    }, onError: (e) {
      print(e);
    });
  }

  



}
