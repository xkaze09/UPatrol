import '/backend/backend.dart';
import '/components/report_tab/report_tab_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_feed_r_widget.dart' show HomePageFeedRWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageFeedRModel extends FlutterFlowModel<HomePageFeedRWidget> {
  ///  Local state fields for this component.

  String? sortCondition;

  bool sortIncreasing = false;

  List<ReportsRecord> reportsList = [];
  void addToReportsList(ReportsRecord item) => reportsList.add(item);
  void removeFromReportsList(ReportsRecord item) => reportsList.remove(item);
  void removeAtIndexFromReportsList(int index) => reportsList.removeAt(index);
  void insertAtIndexInReportsList(int index, ReportsRecord item) =>
      reportsList.insert(index, item);
  void updateReportsListAtIndex(int index, Function(ReportsRecord) updateFn) =>
      reportsList[index] = updateFn(reportsList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
