import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';

ImageProvider<Object> customCachedImageProvider({String? image}) {
  return (image == null)
      ? const AssetImage(AssetsManager.loadingShimmer) as ImageProvider
      : CachedNetworkImageProvider(image);
}

// To clear the cache for all the images of a specific provider
void clearCacheForProvider(String providerUrl) {
  CachedNetworkImage.evictFromCache(providerUrl);
}
