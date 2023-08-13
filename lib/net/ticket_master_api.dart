import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/remote/ticket_master_category/tm_category.dart';
import '../models/remote/ticket_master_event/tm_event.dart';
import '../util/logger.dart';

class TicketMasterApi {
  static final TicketMasterApi _instance = TicketMasterApi._internal();

  TicketMasterApi._internal();

  final String? _apiKey = dotenv.env['API_KEY'];
  TMCategory category = TMCategory.empty();

  factory TicketMasterApi() {
    return _instance;
  }

  Future<List<TMCategory>> getCategories() async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      throw Exception('No API key!');
    }

    final Uri uri = _composeUri('classifications', {});

    final http.Response response = await _get(uri: uri);
    _handleErrors(response, 'getCategories');
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;
    return TMCategory.fromJsonList(
        body['_embedded']['classifications'] as List<dynamic>);
  }

  Future<List<TMEvent>> getEvents() async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      throw Exception('No API key!');
    }

    final Uri uri = _composeUri('events', {'size': '10'});

    final http.Response response = await _get(uri: uri);
    _handleErrors(response, 'getEvents');
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;
    return TMEvent.fromJsonList(body['_embedded']['events'] as List<dynamic>);
  }

  Future<List<TMEvent>> getPaginatedEvents(
      int pageNumber, int pageSize, String keyWord) async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      throw Exception('No API key!');
    }

    final Uri uri = _composeUri('events', {
      'keyword': keyWord,
      'size': pageSize.toString(),
      'page': pageNumber.toString(),
    });

    final http.Response response = await _get(uri: uri);
    _handleErrors(response, 'getEvents');
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;
    return TMEvent.fromJsonList(body['_embedded']['events'] as List<dynamic>);
  }

  void toggleCategory(TMCategory category) {
    if(this.category == category) {
      this.category = TMCategory.empty();
    } else {
      this.category = category;
    }
  }

  Uri _composeUri(String path, Map<String, String> params) {
    params['apikey'] = _apiKey!;
    if(category.id != '1') {
      params['classificationName'] = category.name;
    }
    return Uri(
      scheme: 'https',
      host: 'app.ticketmaster.com',
      path: '/discovery/v2/$path',
      queryParameters: params,
    );
  }

  Future<http.Response> _get({String? path, Uri? uri}) {
    return http.get(
      uri ?? Uri.parse(path!),
      headers: _getSimpleHeaders(),
    );
  }

  Map<String, String> _getSimpleHeaders() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

  /// Handle request errors to log the error and throw an exception
  void _handleErrors(http.Response? response, String from) {
    if (response == null) {
      throw Exception('Received null response from server $from');
    }
    if (response.statusCode < 200 || response.statusCode >= 400) {
      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;
      logger.e('$from;\ncode: ${response.statusCode};\n$body');
      throw Exception(body['message']);
    }
  }
}
