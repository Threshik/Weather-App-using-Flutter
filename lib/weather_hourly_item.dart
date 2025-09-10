import 'package:flutter/material.dart';
//these hourlyforcast cards are repeating so i am creating a widget and i can reuse them

class HourlyForcastItem extends StatelessWidget {

  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForcastItem({super.key, required this.time, required this.icon, required this.temperature, });
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                time,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Icon(icon, size: 32),
              SizedBox(height: 8),
              Text(temperature),
            ],
          ),
        ),
      ),
    );
  }
}
