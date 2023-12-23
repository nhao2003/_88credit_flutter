enum Operation {
  equals,
  notEquals,
  greaterThan,
  greaterThanOrEqual,
  lessThan,
  lessThanOrEqual,
  inValue,
  notIn,
  like,
  notLike,
  isNull,
  isNotNull,
  between,
  notBetween;

  String getOperationString() {
    switch (this) {
      case Operation.equals:
        return 'eq';
      case Operation.notEquals:
        return 'ne';
      case Operation.greaterThan:
        return 'gt';
      case Operation.greaterThanOrEqual:
        return 'ge';
      case Operation.lessThan:
        return 'lt';
      case Operation.lessThanOrEqual:
        return 'le';
      case Operation.inValue:
        return 'in';
      case Operation.notIn:
        return 'nin';
      case Operation.like:
        return 'like';
      case Operation.notLike:
        return 'nlike';
      // case Operation.isNull:
      //   return 'null';
      // case Operation.isNotNull:
      //   return 'nnull';
      case Operation.between:
        return 'btw';
      case Operation.notBetween:
        return 'nbtw';
      default:
        return '';
    }
  }
}

enum OrderBy {
  asc,
  desc,
}

class QueryBuilder {
  String _query = '';
  String _orderBy = '';
  int page = 1;
  String search = '';
  int provinceCode = 0;

  QueryBuilder();

  QueryBuilder addQuery(String param, Operation operation, dynamic value) {
    if (value == null) return this;
    if (_query.isEmpty) {
      _query += '?';
    } else {
      _query += '&';
    }
    _query += '$param[${operation.getOperationString()}]=$value';
    return this;
  }

  QueryBuilder addOrderBy(String param, OrderBy orderBy) {
    if (_orderBy.isNotEmpty) {
      _orderBy += ',';
    }
    // +param if orderBy == asc
    // -param if orderBy == desc
    _orderBy += '${orderBy == OrderBy.asc ? '+' : '-'}$param';
    return this;
  }

  QueryBuilder addPage(int page) {
    assert(page > 0);
    this.page = page;
    return this;
  }

  QueryBuilder addSearch(String search) {
    this.search = search;
    return this;
  }

  QueryBuilder addProvince(int provinceCode) {
    this.provinceCode = provinceCode;
    return this;
  }

  String build() {
    if (_query.isNotEmpty) {
      _query += '&';
    } else {
      _query += '?';
    }
    _query += 'page=$page';
    if (_orderBy.isNotEmpty) {
      _query += '&orders=$_orderBy';
    }
    if (search.isNotEmpty) {
      _query += '&search=$search';
    }
    if (provinceCode != 0) {
      _query += '&post_address->>province_code[eq]=\'$provinceCode\'';
    }
    return _query;
  }
}
