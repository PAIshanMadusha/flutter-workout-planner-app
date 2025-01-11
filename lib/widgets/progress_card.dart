import 'package:flutter/material.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue;
  final int total;

  const ProgressCard({
    super.key,
    required this.progressValue,
    required this.total,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();

    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [kCardColor, kCardColor2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kCardColor,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Proteins, Fats & Carbohydrates",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: kMainWhiteColor,
              ),
            ),
            SizedBox(
              height: sizedBoxValue,
            ),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainWhiteColor,
              valueColor: AlwaysStoppedAnimation(kDoneButtonColor),
              minHeight: 10,
              borderRadius: BorderRadius.circular(100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag("Done", done.toString(),),
                _buildTag("Total", widget.total.toString(),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kMainWhiteColor),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kMainWhiteColor,
          ),
        ),
      ],
    );
  }
}
