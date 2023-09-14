import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calender_view_model.dart';
export 'calender_view_model.dart';

class CalenderViewWidget extends StatefulWidget {
  const CalenderViewWidget({
    Key? key,
    required this.startDate,
  }) : super(key: key);

  final bool? startDate;

  @override
  _CalenderViewWidgetState createState() => _CalenderViewWidgetState();
}

class _CalenderViewWidgetState extends State<CalenderViewWidget> {
  late CalenderViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: false,
                  weekStartsMonday: true,
                  rowHeight: 64.0,
                  onChange: (DateTimeRange? newSelectedDate) async {
                    _model.calendarSelectedDay = newSelectedDate;
                    if (widget.startDate!) {
                      _model.updatePage(() {
                        FFAppState().startDate =
                            _model.calendarSelectedDay?.start;
                      });
                    } else {
                      _model.updatePage(() {
                        FFAppState().endDate = _model.calendarSelectedDay?.end;
                      });
                    }

                    setState(() {});
                  },
                  titleStyle: FlutterFlowTheme.of(context).headlineSmall,
                  dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                  selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
                  inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'close',
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
