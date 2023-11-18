import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModeratorsRecord extends FirestoreRecord {
  ModeratorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "is_receiver" field.
  bool? _isReceiver;
  bool get isReceiver => _isReceiver ?? false;
  bool hasIsReceiver() => _isReceiver != null;

  // "is_moderator" field.
  bool? _isModerator;
  bool get isModerator => _isModerator ?? false;
  bool hasIsModerator() => _isModerator != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isReceiver = snapshotData['is_receiver'] as bool?;
    _isModerator = snapshotData['is_moderator'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moderators');

  static Stream<ModeratorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModeratorsRecord.fromSnapshot(s));

  static Future<ModeratorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModeratorsRecord.fromSnapshot(s));

  static ModeratorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModeratorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModeratorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModeratorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModeratorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModeratorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModeratorsRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isReceiver,
  bool? isModerator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'is_receiver': isReceiver,
      'is_moderator': isModerator,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModeratorsRecordDocumentEquality implements Equality<ModeratorsRecord> {
  const ModeratorsRecordDocumentEquality();

  @override
  bool equals(ModeratorsRecord? e1, ModeratorsRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isReceiver == e2?.isReceiver &&
        e1?.isModerator == e2?.isModerator;
  }

  @override
  int hash(ModeratorsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isReceiver,
        e?.isModerator
      ]);

  @override
  bool isValidKey(Object? o) => o is ModeratorsRecord;
}
