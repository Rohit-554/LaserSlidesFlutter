import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/network_settings_bloc/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/network_settings_bloc/NetworkSettingsEvent.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/network_settings_bloc/NetworkSettingsState.dart';

import '../../../../../colors/Colors.dart';
import '../../../../../dinjection.dart';

class PastNetworks extends StatefulWidget {
  const PastNetworks({Key? key}) : super(key: key);

  @override
  State<PastNetworks> createState() => _PastNetworksState();
}

class _PastNetworksState extends State<PastNetworks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Available Networks',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: darkappbar,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocProvider(
        create: (_) => sl<NetworkSettingsBloc>()..add(GetSavedNetworkSettingsEvent()),
        child: BlocBuilder<NetworkSettingsBloc, NetworkSettingsState>(
          builder: (context, state) {
            if (state is NetworkSettingsStateLoaded) {
              return  ListView.builder(
                itemCount: state.networkSettings.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        margin: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                        color: Colors.white, // Set your desired card color here
                        elevation: 3, // Set your desired elevation here
                        child: ListTile(
                          title: Text(
                            state.networkSettings[index].incomingIp,
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Colors.black, // Adjust the text color as needed
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            state.networkSettings[index].incomingPort,
                            style: TextStyle(
                              color: Colors.black, // Adjust the text color as needed
                            ),
                          ),
                        ),
                      ),
                      if (index < state.networkSettings.length - 1)
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                        ),
                    ],
                  );
                },
              );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),

    );
  }
}


