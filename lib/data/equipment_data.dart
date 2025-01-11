import 'package:workout_planner_app/models/equipment_model.dart';

class EquipmentData {
  final List<Equipment> equipmentList = [
    Equipment(
      id: 1,
      equipmentName: "Exercise Bike",
      equipmentDescription:
          "A stationary bicycle is a device used as exercise equipment for indoor cycling.",
      equipmentImgUrl: "assest/equipments/cycling.png",
      noOfMinutes: 30,
      noOfCalories: 200,
      handOvered: false,
    ),
    Equipment(
      id: 2,
      equipmentName: "Treadmill",
      equipmentDescription:
          "A treadmill is a device generally used for walking, running, or climbing while staying in the same place.",
      equipmentImgUrl: "assest/exercises/exercise3.png",
      noOfMinutes: 30,
      noOfCalories: 100,
      handOvered: false,
    ),
    Equipment(
      id: 3,
      equipmentName: "Dumbbell",
      equipmentDescription:
          "The dumbbell, a type of free weight, is a piece of equipment used in weight training.",
      equipmentImgUrl: "assest/equipments/gymAccessories.png",
      noOfMinutes: 30,
      noOfCalories: 100,
      handOvered: false,
    ),
    Equipment(
      id: 4,
      equipmentName: "Bench",
      equipmentDescription:
          "A weight training bench is a piece of exercise equipment used for weight training.",
      equipmentImgUrl: "assest/equipments/gym.png",
      noOfMinutes: 30,
      noOfCalories: 100,
      handOvered: false,
    ),
    Equipment(
      id: 5,
      equipmentName: "Jump Rope",
      equipmentDescription:
          "A skipping rope or jump rope is a tool used in the sport of skipping/jump rope",
      equipmentImgUrl: "assest/equipments/jumpingRope.png",
      noOfMinutes: 30,
      noOfCalories: 100,
      handOvered: false,
    ),
  ];
}
