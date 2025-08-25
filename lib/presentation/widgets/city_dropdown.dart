import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class CityDropdown extends StatelessWidget {
  const CityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedCity = 'London';
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          selectedCity = state.city;
        }

        return DropdownButton<String>(
          value: selectedCity,
          items: ["Tokyo", "Paris", "London", "Kathmandu", "New Delhi"].map((
            city,
          ) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
          onChanged: (city) {
            if (city != null) {
              print(city);
              context.read<WeatherBloc>().add(WeatherFetched(city: city));
            }
          },
        );
      },
    );
  }
}
