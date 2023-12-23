import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/header_bar/header_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_unified_widget.dart' show ProfileUnifiedWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUnifiedModel extends FlutterFlowModel<ProfileUnifiedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerBar component.
  late HeaderBarModel headerBarModel;
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
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
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    bottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
