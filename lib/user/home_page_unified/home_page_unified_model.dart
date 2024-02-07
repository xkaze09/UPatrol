import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/filter_noti/filter_noti_widget.dart';
import '/components/header_bar/header_bar_widget.dart';
import '/components/home_page_feed/home_page_feed_widget.dart';
import '/components/home_page_feed_m/home_page_feed_m_widget.dart';
import '/components/home_page_feed_r/home_page_feed_r_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_unified_widget.dart' show HomePageUnifiedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageUnifiedModel extends FlutterFlowModel<HomePageUnifiedWidget> {
  ///  Local state fields for this page.

  List<String> categoryfilter = [];
  void addToCategoryfilter(String item) => categoryfilter.add(item);
  void removeFromCategoryfilter(String item) => categoryfilter.remove(item);
  void removeAtIndexFromCategoryfilter(int index) =>
      categoryfilter.removeAt(index);
  void insertAtIndexInCategoryfilter(int index, String item) =>
      categoryfilter.insert(index, item);
  void updateCategoryfilterAtIndex(int index, Function(String) updateFn) =>
      categoryfilter[index] = updateFn(categoryfilter[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerBar component.
  late HeaderBarModel headerBarModel;
  // Model for homePageFeed component.
  late HomePageFeedModel homePageFeedModel;
  // Model for homePageFeed-M component.
  late HomePageFeedMModel homePageFeedMModel;
  // Model for homePageFeed-R component.
  late HomePageFeedRModel homePageFeedRModel;
  // Stores action output result for [Bottom Sheet - filterNoti] action in IconButton widget.
  List<String>? filters;
  // Model for bottomBar component.
  late BottomBarModel bottomBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerBarModel = createModel(context, () => HeaderBarModel());
    homePageFeedModel = createModel(context, () => HomePageFeedModel());
    homePageFeedMModel = createModel(context, () => HomePageFeedMModel());
    homePageFeedRModel = createModel(context, () => HomePageFeedRModel());
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerBarModel.dispose();
    homePageFeedModel.dispose();
    homePageFeedMModel.dispose();
    homePageFeedRModel.dispose();
    bottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
