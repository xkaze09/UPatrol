import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isResolved" field.
  bool? _isResolved;
  bool get isResolved => _isResolved ?? false;
  bool hasIsResolved() => _isResolved != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "reporter" field.
  DocumentReference? _reporter;
  DocumentReference? get reporter => _reporter;
  bool hasReporter() => _reporter != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "verifyTime" field.
  DateTime? _verifyTime;
  DateTime? get verifyTime => _verifyTime;
  bool hasVerifyTime() => _verifyTime != null;

  // "resolveTime" field.
  DateTime? _resolveTime;
  DateTime? get resolveTime => _resolveTime;
  bool hasResolveTime() => _resolveTime != null;

  // "resolvedBy" field.
  DocumentReference? _resolvedBy;
  DocumentReference? get resolvedBy => _resolvedBy;
  bool hasResolvedBy() => _resolvedBy != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _isResolved = snapshotData['isResolved'] as bool?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _image = snapshotData['image'] as String?;
    _address = snapshotData['address'] as String?;
    _reporter = snapshotData['reporter'] as DocumentReference?;
    _category = snapshotData['category'] as String?;
    _verifyTime = snapshotData['verifyTime'] as DateTime?;
    _resolveTime = snapshotData['resolveTime'] as DateTime?;
    _resolvedBy = snapshotData['resolvedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? id,
  String? title,
  String? description,
  bool? isResolved,
  bool? isVerified,
  DateTime? timestamp,
  LatLng? location,
  String? image,
  String? address,
  DocumentReference? reporter,
  String? category,
  DateTime? verifyTime,
  DateTime? resolveTime,
  DocumentReference? resolvedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isResolved': isResolved,
      'isVerified': isVerified,
      'timestamp': timestamp,
      'location': location,
      'image': image,
      'address': address,
      'reporter': reporter,
      'category': category,
      'verifyTime': verifyTime,
      'resolveTime': resolveTime,
      'resolvedBy': resolvedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.isResolved == e2?.isResolved &&
        e1?.isVerified == e2?.isVerified &&
        e1?.timestamp == e2?.timestamp &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.address == e2?.address &&
        e1?.reporter == e2?.reporter &&
        e1?.category == e2?.category &&
        e1?.verifyTime == e2?.verifyTime &&
        e1?.resolveTime == e2?.resolveTime &&
        e1?.resolvedBy == e2?.resolvedBy;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.title,
        e?.description,
        e?.isResolved,
        e?.isVerified,
        e?.timestamp,
        e?.location,
        e?.image,
        e?.address,
        e?.reporter,
        e?.category,
        e?.verifyTime,
        e?.resolveTime,
        e?.resolvedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
