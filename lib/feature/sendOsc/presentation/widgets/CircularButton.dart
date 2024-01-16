import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laser_slides_flutter/colors/Colors.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkEntity.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkSettings.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/button_config_bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/button_config_bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/button_config_bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/osc_bloc/OscEvent.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/osc_bloc/OscSenderBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/EditButtonConfig.dart';
import 'package:lottie/lottie.dart';

import '../../../../dinjection.dart';
import '../bloc/local/network_settings_bloc/NetworkSettingsBloc.dart';
import '../bloc/local/network_settings_bloc/NetworkSettingsEvent.dart';
import '../bloc/local/network_settings_bloc/NetworkSettingsState.dart';

class MyCircularButton extends StatefulWidget {
  final int id;
  final List<NetworkSettings> networkSettings;
  final List<NetworkEntity> networkEntity;

  const MyCircularButton(
      {Key? key,
      required this.id,
      required this.networkSettings,
      required this.networkEntity})
      : super(key: key);

  @override
  _MyCircularButtonState createState() => _MyCircularButtonState();
}

class _MyCircularButtonState extends State<MyCircularButton>
    with TickerProviderStateMixin {
  bool isButtonPressed = false;
  void buttonPressed() {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
    print("this is networkentitiy ${widget.networkEntity.length}");
    print("this is widget id ${widget.networkSettings.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: BlocProvider(
          create: (_) => sl<OSCSenderBloc>(),
          child: CircularButton(
            onTap: buttonPressed,
            isButtonPressed: isButtonPressed,
            id: widget.id,
            networkSettings: widget.networkSettings,
            networkEntity: widget.networkEntity,
          ),
        ));
  }
}

class CircularButton extends StatelessWidget {
  final int id;
  final onTap;
  final bool isButtonPressed;
  final List<NetworkSettings> networkSettings;
  final List<NetworkEntity> networkEntity;
  const CircularButton(
      {Key? key,
      required this.onTap,
      required this.isButtonPressed ,
      required this.id,
      required this.networkSettings,
      required this.networkEntity})
      : super(key: key);

List<String> get oscPath {
  return [
    networkSettings.last.incomingIp, // Destination IP
    networkSettings.last.incomingPort, // Port
    "${networkSettings.last.incomingStartPath}/${networkEntity[id-1].buttonPressedCommand}"
  ];  // OSC address
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<NetworkBloc>()..add(GetSavedNetworkConfigEvent()),
        child: BlocBuilder<NetworkBloc, NetworkConfigState>(
          builder: (context, state) {
            if (state is NetworkConfigStateLoaded){
              return Builder(
                  builder: (context0) => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          try{
                            String oscPath =
                              "${networkSettings.last.incomingIp} ${networkSettings.last.incomingPort} ${networkSettings.last.incomingStartPath}/${state.networkEntities[id-1].buttonPressedCommand}";
                            List<String> OscPath= oscPath.split(" ");
                            onTap();
                            BlocProvider.of<OSCSenderBloc>(context0)
                                .add(SendOscEvent(OscPath));
                          }catch(e){
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Configure the Button first'),
                              ),
                            );
                          }

                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: !isButtonPressed
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: const Offset(6, 6),
                                  ),
                                  //lighter shadow
                                  const BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: Offset(-6, -6),
                                  ),
                                ],
                              ),
                              child: Icon(
                                !isButtonPressed? Icons.device_hub_outlined: Icons.device_hub,
                                color: !isButtonPressed ? Colors.grey : Colors.green[700],
                                size: 36,
                              ),
                            ),
                            Text(
                              (state.networkEntities.isNotEmpty && id >= 0 && id < state.networkEntities.length)
                                  ? state.networkEntities[id-1].label
                                  : "Button $id",
                              style: TextStyle(
                                color: !isButtonPressed? Colors.black: Colors.white,
                                fontWeight: !isButtonPressed? FontWeight.normal: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),

                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyEditButtonConfig(
                                    id: id,
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black, // Customize the color as needed
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ));
            }else if(state is NetworkConfigStateLoading){
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
            );
          }
        )
    );


  }
}
