// ignore_for_file: non_constant_identifier_names
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tvchart_types.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class Bar {
  final int time;
  final double open;
  final double high;
  final double low;
  final double close;
  final int? volume;

  Bar({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    this.volume,
  });

  factory Bar.fromJson(Map<String, dynamic> json) => _$BarFromJson(json);
  Map<String, dynamic> toJson() => _$BarToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class Exchange {
  final String value;
  final String name;
  final String desc;

  Exchange({
    required this.value,
    required this.name,
    required this.desc,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) =>
      _$ExchangeFromJson(json);
  Map<String, dynamic> toJson() => _$ExchangeToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class DatafeedConfiguration {
  final List<Exchange>? exchanges;
  final List<String>? supported_resolutions;
  final List<String>? currency_codes;
  final bool? supports_marks;
  final bool? supports_time;
  final bool? supports_timescale_marks;
  final List<DatafeedSymbolType>? symbols_types;

  DatafeedConfiguration({
    this.exchanges,
    this.supported_resolutions,
    this.currency_codes,
    this.supports_marks,
    this.supports_time,
    this.supports_timescale_marks,
    this.symbols_types,
  });

  factory DatafeedConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DatafeedConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$DatafeedConfigurationToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class DatafeedSymbolType {
  final String name;
  final String value;

  DatafeedSymbolType({
    required this.name,
    required this.value,
  });

  factory DatafeedSymbolType.fromJson(Map<String, dynamic> json) =>
      _$DatafeedSymbolTypeFromJson(json);
  Map<String, dynamic> toJson() => _$DatafeedSymbolTypeToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class SearchSymbolResultItem {
  final String symbol;
  final String full_name;
  final String description;
  final String exchange;
  final String ticker;
  final String type;

  SearchSymbolResultItem({
    required this.symbol,
    required this.full_name,
    required this.description,
    required this.exchange,
    required this.ticker,
    required this.type,
  });

  factory SearchSymbolResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchSymbolResultItemFromJson(json);
  Map<String, dynamic> toJson() => _$SearchSymbolResultItemToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class LibrarySymbolInfo {
  final String name;
  final String full_name;
  final List<String>? base_name;
  final String? ticker;
  final String description;
  final String type;
  final String session;
  final String? session_display;
  final String? holidays;
  final String? corrections;
  final String exchange;
  final String listed_exchange;
  final String timezone;
  final String format;
  final double pricescale;
  final double minmov;
  final bool? fractional;
  final double? minmove2;
  final bool? has_intraday;
  final List<String> supported_resolutions;
  final List<String>? intraday_multipliers;
  final bool? has_seconds;
  final List<String>? seconds_multipliers;
  final bool? has_daily;
  final bool? has_weekly_and_monthly;
  final bool? has_empty_bars;
  final bool? force_session_rebuild;
  final bool? has_no_volume;
  final double? volume_precision;
  final String? data_status;
  final bool? expired;
  final int? expiration_date;
  final String? sector;
  final String? industry;
  final String? currency_code;
  final String? original_currency_code;

  LibrarySymbolInfo({
    required this.name,
    required this.full_name,
    this.base_name,
    this.ticker,
    required this.description,
    required this.type,
    required this.session,
    this.session_display,
    this.holidays,
    this.corrections,
    required this.exchange,
    required this.listed_exchange,
    required this.timezone,
    required this.format,
    required this.pricescale,
    required this.minmov,
    this.fractional,
    this.minmove2,
    this.has_intraday,
    required this.supported_resolutions,
    this.intraday_multipliers,
    this.has_seconds,
    this.seconds_multipliers,
    this.has_daily,
    this.has_weekly_and_monthly,
    this.has_empty_bars,
    this.force_session_rebuild,
    this.has_no_volume,
    this.volume_precision,
    this.data_status,
    this.expired,
    this.expiration_date,
    this.sector,
    this.industry,
    this.currency_code,
    this.original_currency_code,
  });

  factory LibrarySymbolInfo.fromJson(Map<String, dynamic> json) =>
      _$LibrarySymbolInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LibrarySymbolInfoToJson(this);
}

/// Some property is not here and you should add it on JS side if needed:
/// ```md
/// required on JS side
/// - container_id
/// - datafeed
/// ```
@immutable
@JsonSerializable(includeIfNull: false)
class ChartingLibraryWidgetOptions {
  final String interval;
  final String? symbol;
  final int? auto_save_delay;
  final bool? autosize;
  final bool? debug;
  final List<String>? disabled_features;
  final AccessList? drawings_access;
  final List<String>? enabled_features;
  final bool? fullscreen;
  final int? height;
  final String locale;
  final NumericFormattingParams? numeric_formatting;
  final Map<String, dynamic>? saved_data;
  final SavedStateMetaInfo? saved_data_meta_info;
  final AccessList? studies_access;
  final int? study_count_limit;
  final int? symbol_search_request_delay;
  final String? timeframe;
  final String? timezone;
  final String? toolbar_bg;
  final int? width;
  final String? charts_storage_url;
  final String? charts_storage_api_version;
  final String? client_id;
  final String? user_id;
  final bool? load_last_chart;
  final Map<String, dynamic>? studies_overrides;
  final Map<String, dynamic>? overrides;
  final String? snapshot_url;
  final String? preset;
  final TimeFrameItem? time_frames;
  final String? custom_css_url;
  final Favorites? favorites;
  final LoadingScreenOptions? loading_screen;
  final String? theme;
  final List<CompareSymbol>? compare_symbols;

  ChartingLibraryWidgetOptions({
    required this.interval,
    this.symbol,
    this.auto_save_delay,
    this.autosize,
    this.debug,
    this.disabled_features,
    this.drawings_access,
    this.enabled_features,
    this.fullscreen,
    this.height,
    required this.locale,
    this.numeric_formatting,
    this.saved_data,
    this.saved_data_meta_info,
    this.studies_access,
    this.study_count_limit,
    this.symbol_search_request_delay,
    this.timeframe,
    this.timezone,
    this.toolbar_bg,
    this.width,
    this.charts_storage_url,
    this.charts_storage_api_version,
    this.client_id,
    this.user_id,
    this.load_last_chart,
    this.studies_overrides,
    this.overrides,
    this.snapshot_url,
    this.preset,
    this.time_frames,
    this.custom_css_url,
    this.favorites,
    this.loading_screen,
    this.theme,
    this.compare_symbols,
  });

  factory ChartingLibraryWidgetOptions.fromJson(Map<String, dynamic> json) =>
      _$ChartingLibraryWidgetOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$ChartingLibraryWidgetOptionsToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class SavedStateMetaInfo {
  final int uid;
  final String name;
  final String description;

  SavedStateMetaInfo({
    required this.uid,
    required this.name,
    required this.description,
  });

  factory SavedStateMetaInfo.fromJson(Map<String, dynamic> json) =>
      _$SavedStateMetaInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SavedStateMetaInfoToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class CompareSymbol {
  final String symbol;
  final String title;

  CompareSymbol({
    required this.symbol,
    required this.title,
  });

  factory CompareSymbol.fromJson(Map<String, dynamic> json) =>
      _$CompareSymbolFromJson(json);
  Map<String, dynamic> toJson() => _$CompareSymbolToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class LoadingScreenOptions {
  final String? foregroundColor;
  final String? backgroundColor;

  LoadingScreenOptions({
    this.foregroundColor,
    this.backgroundColor,
  });

  factory LoadingScreenOptions.fromJson(Map<String, dynamic> json) =>
      _$LoadingScreenOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$LoadingScreenOptionsToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class Favorites {
  final List<String> intervals;
  final List<String> chartTypes;

  Favorites({
    required this.intervals,
    required this.chartTypes,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) =>
      _$FavoritesFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritesToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class TimeFrameItem {
  final String text;
  final String resolution;
  final String? description;
  final String? title;

  TimeFrameItem({
    required this.text,
    required this.resolution,
    this.description,
    this.title,
  });

  factory TimeFrameItem.fromJson(Map<String, dynamic> json) =>
      _$TimeFrameItemFromJson(json);
  Map<String, dynamic> toJson() => _$TimeFrameItemToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class NumericFormattingParams {
  final String decimal_sign;

  NumericFormattingParams({
    required this.decimal_sign,
  });

  factory NumericFormattingParams.fromJson(Map<String, dynamic> json) =>
      _$NumericFormattingParamsFromJson(json);
  Map<String, dynamic> toJson() => _$NumericFormattingParamsToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class AccessList {
  final String type;
  final List<AccessListItem> tools;

  AccessList({
    required this.type,
    required this.tools,
  });

  factory AccessList.fromJson(Map<String, dynamic> json) =>
      _$AccessListFromJson(json);
  Map<String, dynamic> toJson() => _$AccessListToJson(this);
}

@immutable
@JsonSerializable(includeIfNull: false)
class AccessListItem {
  final String name;
  final bool? grayed;

  AccessListItem({
    required this.name,
    this.grayed,
  });

  factory AccessListItem.fromJson(Map<String, dynamic> json) =>
      _$AccessListItemFromJson(json);
  Map<String, dynamic> toJson() => _$AccessListItemToJson(this);
}
