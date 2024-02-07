import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/header_bar/header_bar_widget.dart';
import '/components/report_tab/report_tab_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_unified_model.dart';
export 'map_unified_model.dart';

class MapUnifiedWidget extends StatefulWidget {
  const MapUnifiedWidget({super.key});

  @override
  State<MapUnifiedWidget> createState() => _MapUnifiedWidgetState();
}

class _MapUnifiedWidgetState extends State<MapUnifiedWidget> {
  late MapUnifiedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapUnifiedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.markersss = _model.markersss.toList().cast<ReportsRecord>();
      if (await getPermissionStatus(locationPermission)) {
        await _model.googleMapsController.future.then(
          (c) => c.animateCamera(
            CameraUpdate.newLatLng(currentUserLocationValue!.toGoogleMaps()),
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Permission Error'),
              content: Text('Location permission not granted.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        await requestPermission(locationPermission);
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitThreeBounce(
              color: Color(0xFFB12FF6),
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<ReportsRecord>>(
      stream: queryReportsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF2D1A53),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: Color(0xFFB12FF6),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ReportsRecord> mapUnifiedReportsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFF2D1A53),
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.38),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.71,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => setState(
                                () => _model.googleMapsCenter = latLng),
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markers: functions
                                .filterByDistance(
                                    mapUnifiedReportsRecordList.toList(),
                                    currentUserLocationValue!,
                                    3.0)
                                .map(
                                  (marker) => FlutterFlowMarker(
                                    marker.reference.path,
                                    marker.location!,
                                    () async {
                                      _model.distres =
                                          await actions.filterByDistanceAction(
                                        mapUnifiedReportsRecordList.toList(),
                                        _model.googleMapsCenter!,
                                        0.5,
                                      );
                                      if ((_model.distres != null &&
                                              (_model.distres)!.isNotEmpty) ==
                                          true) {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: ReportTabWidget(
                                                    report:
                                                        _model.distres!.first,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }

                                      setState(() {});
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 17.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: false,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: true,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: 100.0,
                        height: MediaQuery.sizeOf(context).height * 0.08,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.headerBarModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderBarWidget(
                      title: 'Map',
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.bottomBarModel,
                      updateCallback: () => setState(() {}),
                      child: BottomBarWidget(
                        disable: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
