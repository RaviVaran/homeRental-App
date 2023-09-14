import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "disc" field.
  String? _disc;
  String get disc => _disc ?? '';
  bool hasDisc() => _disc != null;

  // "max_people" field.
  int? _maxPeople;
  int get maxPeople => _maxPeople ?? 0;
  bool hasMaxPeople() => _maxPeople != null;

  // "amentities" field.
  List<String>? _amentities;
  List<String> get amentities => _amentities ?? const [];
  bool hasAmentities() => _amentities != null;

  // "coord" field.
  LatLng? _coord;
  LatLng? get coord => _coord;
  bool hasCoord() => _coord != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _location = snapshotData['location'] as String?;
    _image = snapshotData['image'] as String?;
    _disc = snapshotData['disc'] as String?;
    _maxPeople = castToType<int>(snapshotData['max_people']);
    _amentities = getDataList(snapshotData['amentities']);
    _coord = snapshotData['coord'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  String? name,
  int? price,
  String? location,
  String? image,
  String? disc,
  int? maxPeople,
  LatLng? coord,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'location': location,
      'image': image,
      'disc': disc,
      'max_people': maxPeople,
      'coord': coord,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.disc == e2?.disc &&
        e1?.maxPeople == e2?.maxPeople &&
        listEquality.equals(e1?.amentities, e2?.amentities) &&
        e1?.coord == e2?.coord;
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.location,
        e?.image,
        e?.disc,
        e?.maxPeople,
        e?.amentities,
        e?.coord
      ]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
