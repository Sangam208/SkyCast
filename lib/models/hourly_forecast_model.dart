import 'dart:convert';

class HourlyForecastModel {
  final String hourlySky;
  final double hourlyTemp;
  final String time;
  HourlyForecastModel({
    required this.hourlySky,
    required this.hourlyTemp,
    required this.time,
  });

  HourlyForecastModel copyWith({
    String? hourlySky,
    double? hourlyTemp,
    String? time,
  }) {
    return HourlyForecastModel(
      hourlySky: hourlySky ?? this.hourlySky,
      hourlyTemp: hourlyTemp ?? this.hourlyTemp,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hourlySky': hourlySky,
      'hourlyTemp': hourlyTemp,
      'time': time,
    };
  }

  factory HourlyForecastModel.fromMap(Map<String, dynamic> map) {
    return HourlyForecastModel(
      hourlySky: map['weather'][0]['main'] as String,
      hourlyTemp: map['main']['temp'] as double,
      time: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyForecastModel.fromJson(String source) =>
      HourlyForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HourlyForecastModel(hourlySky: $hourlySky, hourlyTemp: $hourlyTemp, time: $time)';

  @override
  bool operator ==(covariant HourlyForecastModel other) {
    if (identical(this, other)) return true;

    return other.hourlySky == hourlySky &&
        other.hourlyTemp == hourlyTemp &&
        other.time == time;
  }

  @override
  int get hashCode => hourlySky.hashCode ^ hourlyTemp.hashCode ^ time.hashCode;
}
