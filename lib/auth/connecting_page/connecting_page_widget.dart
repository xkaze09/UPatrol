import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'connecting_page_model.dart';
export 'connecting_page_model.dart';

class ConnectingPageWidget extends StatefulWidget {
  const ConnectingPageWidget({Key? key}) : super(key: key);

  @override
  _ConnectingPageWidgetState createState() => _ConnectingPageWidgetState();
}

class _ConnectingPageWidgetState extends State<ConnectingPageWidget> {
  late ConnectingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.isModerator, false)) {
        context.pushNamed('HomePage-M');
      } else {
        if (valueOrDefault<bool>(currentUserDocument?.isReceiver, false)) {
          context.pushNamed('HomePage-R');
        } else {
          context.pushNamed('HomePage-U');
        }
      }
    });
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 402.0,
                      height: 398.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF9C78B7),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    Container(
                      width: 400.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF9C78B7),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/UPatrol-logo.png',
                          width: double.infinity,
                          height: 168.0,
                          fit: BoxFit.contain,
                          alignment: Alignment(-0.30, 0.00),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.40),
              child: Text(
                'Connecting...',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF5B3491),
                      fontSize: 35.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
