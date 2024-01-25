import 'dart:ui';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/bloc/weather_bloc_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Widget getWeatherIcon(int code) {
      switch (code) {
        case >= 200 && < 300:
          return Image.asset('assets/images/1.png');
        case >= 300 && < 400:
          return Image.asset('assets/images/2.png');
        case >= 500 && < 600:
          return Image.asset('assets/images/3.png');
        case >= 600 && < 700:
          return Image.asset('assets/images/4.png');
        case >= 700 && < 800:
          return Image.asset('assets/images/5.png');
        case == 800:
          return Image.asset('assets/images/6.png');
        case >= 800 && < 804:
          return Image.asset('assets/images/7.png');
        
        default:
            return Image.asset('assets/images/8.png');
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 280,
                    width: 280,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 280,
                    width: 280,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 280,
                    width: 580,
                    decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "📍${state.weather.areaName}",
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                             Text(
                              DateFormat('a').format(DateTime.now()).toString()=="PM"?"Good Afternoon": "Good Morning",
                              style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            Center(
                                child: Text(
                              "${state.weather.temperature!.celsius!.round()} °C ",
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 45.0),
                            )),
                            Center(
                                child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0),
                            )),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                              DateFormat('EEEE DD *').add_jm().format(state.weather.date!),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16.0),
                            )),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/6.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Sunrise",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Sunset",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunset!),
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/3.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Max Temp",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round()}°C",
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/11.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Min Temp",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round()}°C",
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Server Error ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
