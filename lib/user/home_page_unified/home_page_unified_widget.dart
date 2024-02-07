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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_unified_model.dart';
export 'home_page_unified_model.dart';

class HomePageUnifiedWidget extends StatefulWidget {
  const HomePageUnifiedWidget({super.key});

  @override
  State<HomePageUnifiedWidget> createState() => _HomePageUnifiedWidgetState();
}

class _HomePageUnifiedWidgetState extends State<HomePageUnifiedWidget> {
  late HomePageUnifiedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageUnifiedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.categoryfilter = FFAppConstants.category.toList().cast<String>();
      });
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

    return StreamBuilder<List<ReportsRecord>>(
      stream: FFAppState().feed(
        requestFn: () => queryReportsRecord(
          queryBuilder: (reportsRecord) => reportsRecord
              .whereIn('category', _model.categoryfilter)
              .orderBy('timestamp', descending: true),
        ),
      ),
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
        List<ReportsRecord> homePageUnifiedReportsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF2D1A53),
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.headerBarModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderBarWidget(
                      title: 'Home Page',
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.5),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.78,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        if (!valueOrDefault<bool>(
                                currentUserDocument?.isModerator, false) &&
                            !valueOrDefault<bool>(
                                currentUserDocument?.isReceiver, false))
                          AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.homePageFeedModel,
                              updateCallback: () => setState(() {}),
                              child: HomePageFeedWidget(
                                allReports: homePageUnifiedReportsRecordList,
                              ),
                            ),
                          ),
                        if (!valueOrDefault<bool>(
                                currentUserDocument?.isReceiver, false) &&
                            valueOrDefault<bool>(
                                currentUserDocument?.isModerator, false))
                          AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.homePageFeedMModel,
                              updateCallback: () => setState(() {}),
                              child: HomePageFeedMWidget(
                                allReports: homePageUnifiedReportsRecordList,
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isReceiver, false) &&
                            !valueOrDefault<bool>(
                                currentUserDocument?.isModerator, false))
                          AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.homePageFeedRModel,
                              updateCallback: () => setState(() {}),
                              child: HomePageFeedRWidget(
                                allReports: homePageUnifiedReportsRecordList,
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.89, 0.86),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Visibility(
                                visible: responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.tune_rounded,
                                    color: Color(0xFFCECCCC),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: FilterNotiWidget(
                                                filter: _model.categoryfilter,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.filters = value));

                                    setState(() {
                                      _model.categoryfilter = _model.filters!
                                          .toList()
                                          .cast<String>();
                                    });

                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
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
