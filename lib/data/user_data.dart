import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/models/exercise_model.dart';
import 'package:workout_planner_app/models/user_model.dart';

User user = User(
  userId: "01",
  fullName: "Ishan Madusha",
  gender: "Male",
  address: "Horana, Ilimba",
  age: 23,
  description: "Fitness Enthusiasm",
  exerciseList: [
    Exercise(
      id: 1,
      exerciseName: "Triangle",
      exerciseImgUrl: "assest/exercises/triangle.png",
      noOfMinutes: 10,
      completed: false,
    ),
    Exercise(
      id: 2,
      exerciseName: "Yoga",
      exerciseImgUrl: "assest/exercises/yoga.png",
      noOfMinutes: 10,
      completed: false,
    ),
  ],
  equipmentList: [
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
  ],
  favoriteExerciseList: [
    Exercise(
      id: 1,
      exerciseName: "Triangle",
      exerciseImgUrl: "assest/exercises/triangle.png",
      noOfMinutes: 10,
      completed: false,
    ),
  ],
  favoriteEquipmentList: [
    Equipment(
      id: 5,
      equipmentName: "Jump Rope",
      equipmentDescription:
          "A skipping rope or jump rope is a tool used in the sport of skipping/jump rope",
      equipmentImgUrl: "assest/equipments/jumpingRope.png",
      noOfMinutes: 30,
      noOfCalories: 100,
      handOvered: false,
    )
  ],
);
