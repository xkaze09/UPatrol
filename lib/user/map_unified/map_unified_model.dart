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
import 'map_unified_widget.dart' show MapUnifiedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapUnifiedModel extends FlutterFlowModel<MapUnifiedWidget> {
  ///  Local state fields for this page.

  List<ReportsRecord> markersss = [];
  void addToMarkersss(ReportsRecord item) => markersss.add(item);
  void removeFromMarkersss(ReportsRecord item) => markersss.remove(item);
  void removeAtIndexFromMarkersss(int index) => markersss.removeAt(index);
  void insertAtIndexInMarkersss(int index, ReportsRecord item) =>
      markersss.insert(index, item);
  void updateMarkersssAtIndex(int index, Function(ReportsRecord) updateFn) =>
      markersss[index] = updateFn(markersss[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - filterByDistanceAction] action in GoogleMap widget.
  List<ReportsRecord>? distres;
  // Model for headerBar component.
  late HeaderBarModel headerBarModel;
  // Model for bottomBar component.
  late BottomBarModel bottomBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerBarModel = createModel(context, () => HeaderBarModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerBarModel.dispose();
    bottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
