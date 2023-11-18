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

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

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

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _isResolved = snapshotData['isResolved'] as bool?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _category = snapshotData['category'] as String?;
    _image = snapshotData['image'] as String?;
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
  String? userId,
  String? title,
  String? description,
  bool? isResolved,
  bool? isVerified,
  DateTime? timestamp,
  LatLng? location,
  String? category,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'isResolved': isResolved,
      'isVerified': isVerified,
      'timestamp': timestamp,
      'location': location,
      'category': category,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.userId == e2?.userId &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.isResolved == e2?.isResolved &&
        e1?.isVerified == e2?.isVerified &&
        e1?.timestamp == e2?.timestamp &&
        e1?.location == e2?.location &&
        e1?.category == e2?.category &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userId,
        e?.title,
        e?.description,
        e?.isResolved,
        e?.isVerified,
        e?.timestamp,
        e?.location,
        e?.category,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
