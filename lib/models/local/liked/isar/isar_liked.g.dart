// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_liked.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarLikedCollection on Isar {
  IsarCollection<IsarLiked> get isarLikeds => this.collection();
}

const IsarLikedSchema = CollectionSchema(
  name: r'IsarLiked',
  id: -3508305931380181802,
  properties: {
    r'likedAt': PropertySchema(
      id: 0,
      name: r'likedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(
      id: 1,
      name: r'localId',
      type: IsarType.string,
    )
  },
  estimateSize: _isarLikedEstimateSize,
  serialize: _isarLikedSerialize,
  deserialize: _isarLikedDeserialize,
  deserializeProp: _isarLikedDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarLikedGetId,
  getLinks: _isarLikedGetLinks,
  attach: _isarLikedAttach,
  version: '3.1.0+1',
);

int _isarLikedEstimateSize(
  IsarLiked object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.localId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarLikedSerialize(
  IsarLiked object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.likedAt);
  writer.writeString(offsets[1], object.localId);
}

IsarLiked _isarLikedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarLiked();
  object.id = id;
  object.likedAt = reader.readDateTimeOrNull(offsets[0]);
  object.localId = reader.readStringOrNull(offsets[1]);
  return object;
}

P _isarLikedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarLikedGetId(IsarLiked object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarLikedGetLinks(IsarLiked object) {
  return [];
}

void _isarLikedAttach(IsarCollection<dynamic> col, Id id, IsarLiked object) {
  object.id = id;
}

extension IsarLikedQueryWhereSort
    on QueryBuilder<IsarLiked, IsarLiked, QWhere> {
  QueryBuilder<IsarLiked, IsarLiked, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarLikedQueryWhere
    on QueryBuilder<IsarLiked, IsarLiked, QWhereClause> {
  QueryBuilder<IsarLiked, IsarLiked, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarLikedQueryFilter
    on QueryBuilder<IsarLiked, IsarLiked, QFilterCondition> {
  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'likedAt',
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'likedAt',
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> likedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition> localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterFilterCondition>
      localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localId',
        value: '',
      ));
    });
  }
}

extension IsarLikedQueryObject
    on QueryBuilder<IsarLiked, IsarLiked, QFilterCondition> {}

extension IsarLikedQueryLinks
    on QueryBuilder<IsarLiked, IsarLiked, QFilterCondition> {}

extension IsarLikedQuerySortBy on QueryBuilder<IsarLiked, IsarLiked, QSortBy> {
  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> sortByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> sortByLikedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }
}

extension IsarLikedQuerySortThenBy
    on QueryBuilder<IsarLiked, IsarLiked, QSortThenBy> {
  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenByLikedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }
}

extension IsarLikedQueryWhereDistinct
    on QueryBuilder<IsarLiked, IsarLiked, QDistinct> {
  QueryBuilder<IsarLiked, IsarLiked, QDistinct> distinctByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likedAt');
    });
  }

  QueryBuilder<IsarLiked, IsarLiked, QDistinct> distinctByLocalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarLikedQueryProperty
    on QueryBuilder<IsarLiked, IsarLiked, QQueryProperty> {
  QueryBuilder<IsarLiked, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarLiked, DateTime?, QQueryOperations> likedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likedAt');
    });
  }

  QueryBuilder<IsarLiked, String?, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }
}
