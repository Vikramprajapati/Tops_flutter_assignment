import 'package:flutter/material.dart';

class TrafficSigns extends StatelessWidget {
  const TrafficSigns({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> trafficSigns = [
      {'icon': Icons.stop, 'iconName': 'Stop'},
      {'icon': Icons.warning_amber_rounded, 'iconName': 'Warning'},
      {'icon': Icons.add_road, 'iconName': 'Add Road'},
      {'icon': Icons.traffic, 'iconName': 'Traffic Signal'},
      {'icon': Icons.directions_walk, 'iconName': 'Pedestrian Crossing'},
      {'icon': Icons.directions_bike, 'iconName': 'Bicycle Path'},
      {'icon': Icons.water_damage, 'iconName': 'Flood Area'},
      {'icon': Icons.local_hospital, 'iconName': 'Hospital Nearby'},
      {'icon': Icons.fire_hydrant, 'iconName': 'Fire Hydrant'},
      {'icon': Icons.park, 'iconName': 'Park Zone'},
      {'icon': Icons.railway_alert, 'iconName': 'Railroad Crossing'},
      {'icon': Icons.snowmobile, 'iconName': 'Snowmobile Area'},
      {'icon': Icons.speed, 'iconName': 'Speed Limit'},
      {'icon': Icons.hail, 'iconName': 'Hail Warning'},
      {'icon': Icons.electric_car,'iconName': 'Electric Vehicle Charging Station'},
      {'icon': Icons.no_meals, 'iconName': 'No Eating'},
      {'icon': Icons.no_drinks, 'iconName': 'No Drinking'},
      {'icon': Icons.no_photography, 'iconName': 'No Photography'},
      {'icon': Icons.smoke_free, 'iconName': 'No Smoking'},
      {'icon': Icons.child_friendly, 'iconName': 'Child Friendly Area'},
      {'icon': Icons.pets, 'iconName': 'Pet Area'},
      {'icon': Icons.wc, 'iconName': 'Restroom'},
      {'icon': Icons.wheelchair_pickup, 'iconName': 'Wheelchair Access'},
      {'icon': Icons.no_stroller, 'iconName': 'No Strollers'},
      {'icon': Icons.escalator_warning, 'iconName': 'Beware of Escalators'},
      {'icon': Icons.no_cell, 'iconName': 'No Cell Phones'},
      {'icon': Icons.no_flash, 'iconName': 'No Flash Photography'},
      {'icon': Icons.no_food, 'iconName': 'No Food or Drink'},
      {'icon': Icons.no_transfer, 'iconName': 'No Transfers'},
      {'icon': Icons.fork_left, 'iconName': 'Fork Left'},
      {'icon': Icons.fork_right, 'iconName': 'Fork Right'},
      {'icon': Icons.roundabout_left, 'iconName': 'Roundabout Left'},
      {'icon': Icons.roundabout_right, 'iconName': 'Roundabout Right'},
      {'icon': Icons.merge_type, 'iconName': 'Merge'},
      {'icon': Icons.ramp_right, 'iconName': 'Ramp Right'},
      {'icon': Icons.ramp_left, 'iconName': 'Ramp Left'},
      {'icon': Icons.two_wheeler, 'iconName': 'Motorcycle Area'},
      {'icon': Icons.car_rental, 'iconName': 'Car Rental'},
      {'icon': Icons.car_repair, 'iconName': 'Car Repair'},
      {'icon': Icons.local_parking, 'iconName': 'Parking Area'},
    ];

    int gridCrossAxisCount = 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Traffic Signs",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCrossAxisCount, // Number of columns
            crossAxisSpacing: 8.0, // Horizontal space between cards
            mainAxisSpacing: 8.0, // Vertical space between cards
          ),
          itemCount: trafficSigns.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer: Center(
                    child: Text(
                      trafficSigns[index]['iconName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  child: Icon(
                    trafficSigns[index]['icon'],
                    size: 70.0,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}