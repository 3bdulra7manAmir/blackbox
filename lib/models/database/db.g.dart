// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetItemsCollection on Isar {
  IsarCollection<Items> get items => this.collection();
}

const ItemsSchema = CollectionSchema(
  name: r'Items',
  id: -1972178876443806045,
  properties: {
    r'barcodePNG': PropertySchema(
      id: 0,
      name: r'barcodePNG',
      type: IsarType.longList,
    ),
    r'sNumber': PropertySchema(
      id: 1,
      name: r'sNumber',
      type: IsarType.string,
    ),
    r'svgDATA': PropertySchema(
      id: 2,
      name: r'svgDATA',
      type: IsarType.string,
    )
  },
  estimateSize: _itemsEstimateSize,
  serialize: _itemsSerialize,
  deserialize: _itemsDeserialize,
  deserializeProp: _itemsDeserializeProp,
  idName: r'item_ID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _itemsGetId,
  getLinks: _itemsGetLinks,
  attach: _itemsAttach,
  version: '3.1.0+1',
);

int _itemsEstimateSize(
  Items object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barcodePNG;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.sNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.svgDATA;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _itemsSerialize(
  Items object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.barcodePNG);
  writer.writeString(offsets[1], object.sNumber);
  writer.writeString(offsets[2], object.svgDATA);
}

Items _itemsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Items();
  object.barcodePNG = reader.readLongList(offsets[0]);
  object.item_ID = id;
  object.sNumber = reader.readStringOrNull(offsets[1]);
  object.svgDATA = reader.readStringOrNull(offsets[2]);
  return object;
}

P _itemsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _itemsGetId(Items object) {
  return object.item_ID;
}

List<IsarLinkBase<dynamic>> _itemsGetLinks(Items object) {
  return [];
}

void _itemsAttach(IsarCollection<dynamic> col, Id id, Items object) {
  object.item_ID = id;
}

extension ItemsQueryWhereSort on QueryBuilder<Items, Items, QWhere> {
  QueryBuilder<Items, Items, QAfterWhere> anyItem_ID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ItemsQueryWhere on QueryBuilder<Items, Items, QWhereClause> {
  QueryBuilder<Items, Items, QAfterWhereClause> item_IDEqualTo(Id item_ID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: item_ID,
        upper: item_ID,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterWhereClause> item_IDNotEqualTo(Id item_ID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: item_ID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: item_ID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: item_ID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: item_ID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Items, Items, QAfterWhereClause> item_IDGreaterThan(Id item_ID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: item_ID, includeLower: include),
      );
    });
  }

  QueryBuilder<Items, Items, QAfterWhereClause> item_IDLessThan(Id item_ID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: item_ID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Items, Items, QAfterWhereClause> item_IDBetween(
    Id lowerItem_ID,
    Id upperItem_ID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerItem_ID,
        includeLower: includeLower,
        upper: upperItem_ID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ItemsQueryFilter on QueryBuilder<Items, Items, QFilterCondition> {
  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barcodePNG',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barcodePNG',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcodePNG',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition>
      barcodePNGElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcodePNG',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcodePNG',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcodePNG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> barcodePNGLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'barcodePNG',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> item_IDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'item_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> item_IDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'item_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> item_IDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'item_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> item_IDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'item_ID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sNumber',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sNumber',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> sNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'svgDATA',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'svgDATA',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATALessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATABetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'svgDATA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'svgDATA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'svgDATA',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'svgDATA',
        value: '',
      ));
    });
  }

  QueryBuilder<Items, Items, QAfterFilterCondition> svgDATAIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'svgDATA',
        value: '',
      ));
    });
  }
}

extension ItemsQueryObject on QueryBuilder<Items, Items, QFilterCondition> {}

extension ItemsQueryLinks on QueryBuilder<Items, Items, QFilterCondition> {}

extension ItemsQuerySortBy on QueryBuilder<Items, Items, QSortBy> {
  QueryBuilder<Items, Items, QAfterSortBy> sortBySNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sNumber', Sort.asc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> sortBySNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sNumber', Sort.desc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> sortBySvgDATA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'svgDATA', Sort.asc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> sortBySvgDATADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'svgDATA', Sort.desc);
    });
  }
}

extension ItemsQuerySortThenBy on QueryBuilder<Items, Items, QSortThenBy> {
  QueryBuilder<Items, Items, QAfterSortBy> thenByItem_ID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item_ID', Sort.asc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> thenByItem_IDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item_ID', Sort.desc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> thenBySNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sNumber', Sort.asc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> thenBySNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sNumber', Sort.desc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> thenBySvgDATA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'svgDATA', Sort.asc);
    });
  }

  QueryBuilder<Items, Items, QAfterSortBy> thenBySvgDATADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'svgDATA', Sort.desc);
    });
  }
}

extension ItemsQueryWhereDistinct on QueryBuilder<Items, Items, QDistinct> {
  QueryBuilder<Items, Items, QDistinct> distinctByBarcodePNG() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcodePNG');
    });
  }

  QueryBuilder<Items, Items, QDistinct> distinctBySNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Items, Items, QDistinct> distinctBySvgDATA(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'svgDATA', caseSensitive: caseSensitive);
    });
  }
}

extension ItemsQueryProperty on QueryBuilder<Items, Items, QQueryProperty> {
  QueryBuilder<Items, int, QQueryOperations> item_IDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item_ID');
    });
  }

  QueryBuilder<Items, List<int>?, QQueryOperations> barcodePNGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcodePNG');
    });
  }

  QueryBuilder<Items, String?, QQueryOperations> sNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sNumber');
    });
  }

  QueryBuilder<Items, String?, QQueryOperations> svgDATAProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'svgDATA');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetControlCollection on Isar {
  IsarCollection<Control> get controls => this.collection();
}

const ControlSchema = CollectionSchema(
  name: r'Control',
  id: -2555879398145959945,
  properties: {
    r'perM': PropertySchema(
      id: 0,
      name: r'perM',
      type: IsarType.long,
    ),
    r'uName': PropertySchema(
      id: 1,
      name: r'uName',
      type: IsarType.string,
    ),
    r'uPassWord': PropertySchema(
      id: 2,
      name: r'uPassWord',
      type: IsarType.string,
    )
  },
  estimateSize: _controlEstimateSize,
  serialize: _controlSerialize,
  deserialize: _controlDeserialize,
  deserializeProp: _controlDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _controlGetId,
  getLinks: _controlGetLinks,
  attach: _controlAttach,
  version: '3.1.0+1',
);

int _controlEstimateSize(
  Control object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.uName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uPassWord;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _controlSerialize(
  Control object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.perM);
  writer.writeString(offsets[1], object.uName);
  writer.writeString(offsets[2], object.uPassWord);
}

Control _controlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Control();
  object.id = id;
  object.perM = reader.readLongOrNull(offsets[0]);
  object.uName = reader.readStringOrNull(offsets[1]);
  object.uPassWord = reader.readStringOrNull(offsets[2]);
  return object;
}

P _controlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _controlGetId(Control object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _controlGetLinks(Control object) {
  return [];
}

void _controlAttach(IsarCollection<dynamic> col, Id id, Control object) {
  object.id = id;
}

extension ControlQueryWhereSort on QueryBuilder<Control, Control, QWhere> {
  QueryBuilder<Control, Control, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ControlQueryWhere on QueryBuilder<Control, Control, QWhereClause> {
  QueryBuilder<Control, Control, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Control, Control, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Control, Control, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Control, Control, QAfterWhereClause> idBetween(
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

extension ControlQueryFilter
    on QueryBuilder<Control, Control, QFilterCondition> {
  QueryBuilder<Control, Control, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Control, Control, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Control, Control, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Control, Control, QAfterFilterCondition> perMIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perM',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> perMIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perM',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> perMEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perM',
        value: value,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> perMGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perM',
        value: value,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> perMLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perM',
        value: value,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> perMBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perM',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uName',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uName',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uName',
        value: '',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uName',
        value: '',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uPassWord',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uPassWord',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uPassWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uPassWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uPassWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uPassWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Control, Control, QAfterFilterCondition> uPassWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uPassWord',
        value: '',
      ));
    });
  }
}

extension ControlQueryObject
    on QueryBuilder<Control, Control, QFilterCondition> {}

extension ControlQueryLinks
    on QueryBuilder<Control, Control, QFilterCondition> {}

extension ControlQuerySortBy on QueryBuilder<Control, Control, QSortBy> {
  QueryBuilder<Control, Control, QAfterSortBy> sortByPerM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perM', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> sortByPerMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perM', Sort.desc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> sortByUName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uName', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> sortByUNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uName', Sort.desc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> sortByUPassWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uPassWord', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> sortByUPassWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uPassWord', Sort.desc);
    });
  }
}

extension ControlQuerySortThenBy
    on QueryBuilder<Control, Control, QSortThenBy> {
  QueryBuilder<Control, Control, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByPerM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perM', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByPerMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perM', Sort.desc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByUName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uName', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByUNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uName', Sort.desc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByUPassWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uPassWord', Sort.asc);
    });
  }

  QueryBuilder<Control, Control, QAfterSortBy> thenByUPassWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uPassWord', Sort.desc);
    });
  }
}

extension ControlQueryWhereDistinct
    on QueryBuilder<Control, Control, QDistinct> {
  QueryBuilder<Control, Control, QDistinct> distinctByPerM() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perM');
    });
  }

  QueryBuilder<Control, Control, QDistinct> distinctByUName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Control, Control, QDistinct> distinctByUPassWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uPassWord', caseSensitive: caseSensitive);
    });
  }
}

extension ControlQueryProperty
    on QueryBuilder<Control, Control, QQueryProperty> {
  QueryBuilder<Control, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Control, int?, QQueryOperations> perMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perM');
    });
  }

  QueryBuilder<Control, String?, QQueryOperations> uNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uName');
    });
  }

  QueryBuilder<Control, String?, QQueryOperations> uPassWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uPassWord');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWatcherCollection on Isar {
  IsarCollection<Watcher> get watchers => this.collection();
}

const WatcherSchema = CollectionSchema(
  name: r'Watcher',
  id: 8626635636475944568,
  properties: {
    r'id_INT': PropertySchema(
      id: 0,
      name: r'id_INT',
      type: IsarType.long,
    ),
    r'systemLOG': PropertySchema(
      id: 1,
      name: r'systemLOG',
      type: IsarType.string,
    )
  },
  estimateSize: _watcherEstimateSize,
  serialize: _watcherSerialize,
  deserialize: _watcherDeserialize,
  deserializeProp: _watcherDeserializeProp,
  idName: r'watcher_ID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _watcherGetId,
  getLinks: _watcherGetLinks,
  attach: _watcherAttach,
  version: '3.1.0+1',
);

int _watcherEstimateSize(
  Watcher object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.systemLOG;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _watcherSerialize(
  Watcher object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_INT);
  writer.writeString(offsets[1], object.systemLOG);
}

Watcher _watcherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Watcher();
  object.id_INT = reader.readLong(offsets[0]);
  object.systemLOG = reader.readStringOrNull(offsets[1]);
  object.watcher_ID = id;
  return object;
}

P _watcherDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _watcherGetId(Watcher object) {
  return object.watcher_ID;
}

List<IsarLinkBase<dynamic>> _watcherGetLinks(Watcher object) {
  return [];
}

void _watcherAttach(IsarCollection<dynamic> col, Id id, Watcher object) {
  object.watcher_ID = id;
}

extension WatcherQueryWhereSort on QueryBuilder<Watcher, Watcher, QWhere> {
  QueryBuilder<Watcher, Watcher, QAfterWhere> anyWatcher_ID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WatcherQueryWhere on QueryBuilder<Watcher, Watcher, QWhereClause> {
  QueryBuilder<Watcher, Watcher, QAfterWhereClause> watcher_IDEqualTo(
      Id watcher_ID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: watcher_ID,
        upper: watcher_ID,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterWhereClause> watcher_IDNotEqualTo(
      Id watcher_ID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: watcher_ID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: watcher_ID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: watcher_ID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: watcher_ID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterWhereClause> watcher_IDGreaterThan(
      Id watcher_ID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: watcher_ID, includeLower: include),
      );
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterWhereClause> watcher_IDLessThan(
      Id watcher_ID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: watcher_ID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterWhereClause> watcher_IDBetween(
    Id lowerWatcher_ID,
    Id upperWatcher_ID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerWatcher_ID,
        includeLower: includeLower,
        upper: upperWatcher_ID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WatcherQueryFilter
    on QueryBuilder<Watcher, Watcher, QFilterCondition> {
  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> id_INTEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_INT',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> id_INTGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_INT',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> id_INTLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_INT',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> id_INTBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_INT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemLOG',
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemLOG',
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemLOG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemLOG',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemLOG',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemLOG',
        value: '',
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> systemLOGIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemLOG',
        value: '',
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> watcher_IDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watcher_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> watcher_IDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watcher_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> watcher_IDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watcher_ID',
        value: value,
      ));
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterFilterCondition> watcher_IDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watcher_ID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WatcherQueryObject
    on QueryBuilder<Watcher, Watcher, QFilterCondition> {}

extension WatcherQueryLinks
    on QueryBuilder<Watcher, Watcher, QFilterCondition> {}

extension WatcherQuerySortBy on QueryBuilder<Watcher, Watcher, QSortBy> {
  QueryBuilder<Watcher, Watcher, QAfterSortBy> sortById_INT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_INT', Sort.asc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> sortById_INTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_INT', Sort.desc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> sortBySystemLOG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemLOG', Sort.asc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> sortBySystemLOGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemLOG', Sort.desc);
    });
  }
}

extension WatcherQuerySortThenBy
    on QueryBuilder<Watcher, Watcher, QSortThenBy> {
  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenById_INT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_INT', Sort.asc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenById_INTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_INT', Sort.desc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenBySystemLOG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemLOG', Sort.asc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenBySystemLOGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemLOG', Sort.desc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenByWatcher_ID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watcher_ID', Sort.asc);
    });
  }

  QueryBuilder<Watcher, Watcher, QAfterSortBy> thenByWatcher_IDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watcher_ID', Sort.desc);
    });
  }
}

extension WatcherQueryWhereDistinct
    on QueryBuilder<Watcher, Watcher, QDistinct> {
  QueryBuilder<Watcher, Watcher, QDistinct> distinctById_INT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_INT');
    });
  }

  QueryBuilder<Watcher, Watcher, QDistinct> distinctBySystemLOG(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemLOG', caseSensitive: caseSensitive);
    });
  }
}

extension WatcherQueryProperty
    on QueryBuilder<Watcher, Watcher, QQueryProperty> {
  QueryBuilder<Watcher, int, QQueryOperations> watcher_IDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watcher_ID');
    });
  }

  QueryBuilder<Watcher, int, QQueryOperations> id_INTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_INT');
    });
  }

  QueryBuilder<Watcher, String?, QQueryOperations> systemLOGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemLOG');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNew_ItemCollection on Isar {
  IsarCollection<New_Item> get new_Items => this.collection();
}

const New_ItemSchema = CollectionSchema(
  name: r'New_Item',
  id: -2613130514680560886,
  properties: {
    r'NewItem_Brand': PropertySchema(
      id: 0,
      name: r'NewItem_Brand',
      type: IsarType.string,
    ),
    r'NewItem_Name': PropertySchema(
      id: 1,
      name: r'NewItem_Name',
      type: IsarType.string,
    ),
    r'NewItem_Place': PropertySchema(
      id: 2,
      name: r'NewItem_Place',
      type: IsarType.string,
    )
  },
  estimateSize: _new_ItemEstimateSize,
  serialize: _new_ItemSerialize,
  deserialize: _new_ItemDeserialize,
  deserializeProp: _new_ItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _new_ItemGetId,
  getLinks: _new_ItemGetLinks,
  attach: _new_ItemAttach,
  version: '3.1.0+1',
);

int _new_ItemEstimateSize(
  New_Item object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.NewItem_Brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.NewItem_Name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.NewItem_Place;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _new_ItemSerialize(
  New_Item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.NewItem_Brand);
  writer.writeString(offsets[1], object.NewItem_Name);
  writer.writeString(offsets[2], object.NewItem_Place);
}

New_Item _new_ItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = New_Item();
  object.NewItem_Brand = reader.readStringOrNull(offsets[0]);
  object.NewItem_Name = reader.readStringOrNull(offsets[1]);
  object.NewItem_Place = reader.readStringOrNull(offsets[2]);
  object.id = id;
  return object;
}

P _new_ItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _new_ItemGetId(New_Item object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _new_ItemGetLinks(New_Item object) {
  return [];
}

void _new_ItemAttach(IsarCollection<dynamic> col, Id id, New_Item object) {
  object.id = id;
}

extension New_ItemQueryWhereSort on QueryBuilder<New_Item, New_Item, QWhere> {
  QueryBuilder<New_Item, New_Item, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension New_ItemQueryWhere on QueryBuilder<New_Item, New_Item, QWhereClause> {
  QueryBuilder<New_Item, New_Item, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<New_Item, New_Item, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterWhereClause> idBetween(
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

extension New_ItemQueryFilter
    on QueryBuilder<New_Item, New_Item, QFilterCondition> {
  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'NewItem_Brand',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'NewItem_Brand',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'NewItem_Brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'NewItem_Brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_BrandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'NewItem_Brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Brand',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_BrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'NewItem_Brand',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'NewItem_Name',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_NameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'NewItem_Name',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_NameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'NewItem_Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_NameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'NewItem_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_NameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'NewItem_Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Name',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'NewItem_Name',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'NewItem_Place',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'NewItem_Place',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'NewItem_Place',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'NewItem_Place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> newItem_PlaceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'NewItem_Place',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'NewItem_Place',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition>
      newItem_PlaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'NewItem_Place',
        value: '',
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<New_Item, New_Item, QAfterFilterCondition> idBetween(
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
}

extension New_ItemQueryObject
    on QueryBuilder<New_Item, New_Item, QFilterCondition> {}

extension New_ItemQueryLinks
    on QueryBuilder<New_Item, New_Item, QFilterCondition> {}

extension New_ItemQuerySortBy on QueryBuilder<New_Item, New_Item, QSortBy> {
  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_Brand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Brand', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_BrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Brand', Sort.desc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Name', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Name', Sort.desc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_Place() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Place', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> sortByNewItem_PlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Place', Sort.desc);
    });
  }
}

extension New_ItemQuerySortThenBy
    on QueryBuilder<New_Item, New_Item, QSortThenBy> {
  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_Brand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Brand', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_BrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Brand', Sort.desc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Name', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Name', Sort.desc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_Place() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Place', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByNewItem_PlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'NewItem_Place', Sort.desc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<New_Item, New_Item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension New_ItemQueryWhereDistinct
    on QueryBuilder<New_Item, New_Item, QDistinct> {
  QueryBuilder<New_Item, New_Item, QDistinct> distinctByNewItem_Brand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'NewItem_Brand',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<New_Item, New_Item, QDistinct> distinctByNewItem_Name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'NewItem_Name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<New_Item, New_Item, QDistinct> distinctByNewItem_Place(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'NewItem_Place',
          caseSensitive: caseSensitive);
    });
  }
}

extension New_ItemQueryProperty
    on QueryBuilder<New_Item, New_Item, QQueryProperty> {
  QueryBuilder<New_Item, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<New_Item, String?, QQueryOperations> NewItem_BrandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'NewItem_Brand');
    });
  }

  QueryBuilder<New_Item, String?, QQueryOperations> NewItem_NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'NewItem_Name');
    });
  }

  QueryBuilder<New_Item, String?, QQueryOperations> NewItem_PlaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'NewItem_Place');
    });
  }
}
