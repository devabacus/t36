/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Customer implements _i1.SerializableModel {
  Customer._({
    this.id,
    required this.userId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.name,
    this.email,
    this.info,
    this.subscriptionStatus,
  }) : isDeleted = isDeleted ?? false;

  factory Customer({
    _i1.UuidValue? id,
    required int userId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      lastModified: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastModified'],
      ),
      isDeleted: jsonSerialization['isDeleted'] as bool,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String?,
      info: jsonSerialization['info'] as String?,
      subscriptionStatus: jsonSerialization['subscriptionStatus'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  int userId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  String name;

  String? email;

  String? info;

  String? subscriptionStatus;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    _i1.UuidValue? id,
    int? userId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? name,
    String? email,
    String? info,
    String? subscriptionStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Customer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'name': name,
      if (email != null) 'email': email,
      if (info != null) 'info': info,
      if (subscriptionStatus != null) 'subscriptionStatus': subscriptionStatus,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerImpl extends Customer {
  _CustomerImpl({
    _i1.UuidValue? id,
    required int userId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
  }) : super._(
         id: id,
         userId: userId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
         name: name,
         email: email,
         info: info,
         subscriptionStatus: subscriptionStatus,
       );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    int? userId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? name,
    Object? email = _Undefined,
    Object? info = _Undefined,
    Object? subscriptionStatus = _Undefined,
  }) {
    return Customer(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      email: email is String? ? email : this.email,
      info: info is String? ? info : this.info,
      subscriptionStatus: subscriptionStatus is String?
          ? subscriptionStatus
          : this.subscriptionStatus,
    );
  }
}
