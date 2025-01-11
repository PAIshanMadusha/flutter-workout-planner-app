class Equipment{
  final int id;
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImgUrl;
  final int noOfMinutes;
  final double noOfCalories;
  bool handOvered;

  Equipment({
    required this.id,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImgUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.handOvered,
  });
}