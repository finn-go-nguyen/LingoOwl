import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/logger.dart';

abstract class DeepLinkRepository {
  Future<String> getCourseLink(String courseId);
}

class FirebaseDynamicLinkRepository implements DeepLinkRepository {
  const FirebaseDynamicLinkRepository(this.client);

  final Dio client;

  static const _apiBaseUrl = 'firebasedynamiclinks.googleapis.com';
  static const _domainUriPrefix = 'owllearning.page.link';
  static const _webappUrl = 'owllearning.web.app';
  static const _packageName = 'asia.goldenowl.online_course_app';

  @override
  Future<String> getCourseLink(String courseId) async {
    const apiKey = String.fromEnvironment('WEB_API_KEY');
    final params = {'key': apiKey};
    final url = Uri.https(
      _apiBaseUrl,
      '/v1/shortLinks',
      params,
    );
    log.wtf(url.toString());
    final res = await client.post(
      url.toString(),
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
      data: _buildDynamicLinkInfo(courseId),
    );

    return res.data['shortLink'];
  }

  Map<String, Object?> _buildDynamicLinkInfo([String? subPath]) {
    return {
      'dynamicLinkInfo': {
        'domainUriPrefix': Uri.https(_domainUriPrefix).toString(),
        'link': Uri.https(_webappUrl, subPath ?? '').toString(),
        'androidInfo': {'androidPackageName': _packageName}
      },
      'suffix': {'option': 'SHORT'}
    };
  }
}
