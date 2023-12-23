import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/header_bar/header_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_profile_u_widget.dart' show EditProfileUWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileUModel extends FlutterFlowModel<EditProfileUWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerBar component.
  late HeaderBarModel headerBarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for UserID widget.
  FocusNode? userIDFocusNode;
  TextEditingController? userIDController;
  String? Function(BuildContext, String?)? userIDControllerValidator;
  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  // State field(s) for EmailAdd widget.
  FocusNode? emailAddFocusNode;
  TextEditingController? emailAddController;
  String? Function(BuildContext, String?)? emailAddControllerValidator;
  // State field(s) for ContactNum widget.
  FocusNode? contactNumFocusNode;
  TextEditingController? contactNumController;
  String? Function(BuildContext, String?)? contactNumControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ReportsRecord>? userReports;
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

    userIDFocusNode?.dispose();
    userIDController?.dispose();

    usernameFocusNode?.dispose();
    usernameController?.dispose();

    emailAddFocusNode?.dispose();
    emailAddController?.dispose();

    contactNumFocusNode?.dispose();
    contactNumController?.dispose();

    bottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
