import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<PlacesRecord> getPlacesList(
  List<PlacesRecord> list,
  List<PlacesRecord> searchResult,
) {
  return searchResult.length > 0 ? searchResult : list;
}

int calBasePrice(
  int pricePerNight,
  DateTime startDate,
  DateTime endDate,
) {
  return endDate.difference(startDate).inDays * pricePerNight;
}

DateTime add7Days(DateTime date1) {
  return date1.add(Duration(days: 7));
}
