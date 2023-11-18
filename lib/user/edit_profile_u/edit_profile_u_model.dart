import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_profile_u_widget.dart' show EditProfileUWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileUModel extends FlutterFlowModel<EditProfileUWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    userIDFocusNode?.dispose();
    userIDController?.dispose();

    usernameFocusNode?.dispose();
    usernameController?.dispose();

    emailAddFocusNode?.dispose();
    emailAddController?.dispose();

    contactNumFocusNode?.dispose();
    contactNumController?.dispose();

    userNameFocusNode?.dispose();
    userNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
