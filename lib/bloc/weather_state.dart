part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  final String city;

  WeatherSuccess({required this.weatherModel, required this.city});
}

final class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure(this.error);
}

final class WeatherLoading extends WeatherState {}
