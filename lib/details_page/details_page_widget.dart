import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_page_model.dart';
export 'details_page_model.dart';

class DetailsPageWidget extends StatefulWidget {
  const DetailsPageWidget({
    Key? key,
    required this.placeRef,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  final DocumentReference? placeRef;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  _DetailsPageWidgetState createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  late DetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PlacesRecord>(
      stream: PlacesRecord.getDocument(widget.placeRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailsPagePlacesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Details',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: detailsPagePlacesRecord.image,
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 250.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            detailsPagePlacesRecord.name,
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 0.0),
                          child: Text(
                            detailsPagePlacesRecord.disc,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 0.0),
                          child: StreamBuilder<List<ReviewsRecord>>(
                            stream: queryReviewsRecord(
                              parent: widget.placeRef,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ReviewsRecord> optionTitleReviewsRecordList =
                                  snapshot.data!;
                              return Text(
                                '(${optionTitleReviewsRecordList.length.toString()})revies(s)',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 24.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: detailsPagePlacesRecord.amentities
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.amentitiesValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  elevation: 4.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 24.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 12.0, 8.0),
                                  elevation: 0.0,
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                                controller: _model.amentitiesValueController ??=
                                    FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 24.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData('Breakfast'),
                                      ChipData('No Breakfast')
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.choiceChipsValue = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      iconSize: 18.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 4.0, 8.0, 4.0),
                                      elevation: 4.0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 4.0, 8.0, 4.0),
                                      elevation: 0.0,
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'start Date',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              Text(
                                dateTimeFormat('yMMMd', widget.startDate),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'end Date',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              Text(
                                dateTimeFormat('yMMMd', widget.endDate),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 2.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Base Price',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              Text(
                                formatNumber(
                                  functions.calBasePrice(
                                      detailsPagePlacesRecord.price,
                                      widget.startDate!,
                                      widget.endDate!),
                                  formatType: FormatType.custom,
                                  currency: '',
                                  format: '',
                                  locale: '',
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 10.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                formatNumber(
                                  functions.calBasePrice(
                                      detailsPagePlacesRecord.price,
                                      widget.startDate!,
                                      widget.endDate!),
                                  formatType: FormatType.custom,
                                  currency: '',
                                  format: '',
                                  locale: '',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await BookingsRecord.createDoc(currentUserReference!)
                        .set(createBookingsRecordData(
                      placeRef: widget.placeRef,
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                    ));

                    context.pushNamed(
                      'conformation',
                      queryParameters: {
                        'placeRef': serializeParam(
                          widget.placeRef,
                          ParamType.DocumentReference,
                        ),
                        'startDate': serializeParam(
                          widget.startDate,
                          ParamType.DateTime,
                        ),
                        'endDate': serializeParam(
                          widget.endDate,
                          ParamType.DateTime,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x55000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'conformation',
                            queryParameters: {
                              'placeRef': serializeParam(
                                widget.placeRef,
                                ParamType.DocumentReference,
                              ),
                              'startDate': serializeParam(
                                widget.startDate,
                                ParamType.DateTime,
                              ),
                              'endDate': serializeParam(
                                widget.endDate,
                                ParamType.DateTime,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Book Now',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 20.0,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
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
