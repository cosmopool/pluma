/// The thickness of the glyphs used to draw the text.
///
/// Fonts are typically weighted on a 9-point scale, which, for historical
/// reasons, uses the names 100 to 900. In Flutter, these are named `w100` to
/// `w900` and have the following conventional meanings:
///
///  * [w100]: Thin, the thinnest font weight.
///
///  * [w200]: Extra light.
///
///  * [w300]: Light.
///
///  * [w400]: Normal.
///
///  * [w500]: Medium.
///
///  * [w600]: Semi-bold.
///
///  * [w700]: Bold.
///
///  * [w800]: Extra-bold.
///
///  * [w900]: Black, the thickest font weight.
///
/// For example, the font named "Roboto Medium" is typically exposed as a font
/// with the name "Roboto" and the weight [FontWeight.w500].
///
/// Some modern fonts allow the weight to be adjusted in arbitrary increments.
/// See [FontVariation.weight] for details.
enum FontWeight {
  /// Thin, the least thick.
  w100,

  /// Extra-light.
  w200,

  /// Light.
  w300,

  /// Normal / regular / plain.
  w400,

  /// Medium.
  w500,

  /// Semi-bold.
  w600,

  /// Bold.
  w700,

  /// Extra-bold.
  w800,

  /// Black, the most thick.
  w900;

  /// An anlias for [FontWeight.w100] value.
  static const FontWeight thin = w100;

  /// An anlias for [FontWeight.w200] value.
  static const FontWeight extraLight = w200;

  /// An anlias for [FontWeight.w300] value.
  static const FontWeight light = w300;

  /// An anlias for [FontWeight.w400] value.
  static const FontWeight normal = w400;

  /// An anlias for [FontWeight.w500] value.
  static const FontWeight medium = w500;

  /// An anlias for [FontWeight.w600] value.
  static const FontWeight semiBold = w600;

  /// An anlias for [FontWeight.w700] value.
  static const FontWeight bold = w700;

  /// An anlias for [FontWeight.w800] value.
  static const FontWeight extraBold = w800;

  /// An anlias for [FontWeight.w900] value.
  static const FontWeight black = w900;
}

/// A way to disambiguate a [TextPosition] when its offset could match two
/// different locations in the rendered string.
///
/// For example, at an offset where the rendered text wraps, there are two
/// visual positions that the offset could represent: one prior to the line
/// break (at the end of the first line) and one after the line break (at the
/// start of the second line). A text affinity disambiguates between these two
/// cases.
///
/// This affects only line breaks caused by wrapping, not explicit newline
/// characters. For newline characters, the position is fully specified by the
/// offset alone, and there is no ambiguity.
///
/// [TextAffinity] also affects bidirectional text at the interface between LTR
/// and RTL text. Consider the following string, where the lowercase letters
/// will be displayed as LTR and the uppercase letters RTL: "helloHELLO".  When
/// rendered, the string would appear visually as "helloOLLEH".  An offset of 5
/// would be ambiguous without a corresponding [TextAffinity].  Looking at the
/// string in code, the offset represents the position just after the "o" and
/// just before the "H".  When rendered, this offset could be either in the
/// middle of the string to the right of the "o" or at the end of the string to
/// the right of the "H".
enum TextAffinity {
  /// The position has affinity for the upstream side of the text position, i.e.
  /// in the direction of the beginning of the string.
  ///
  /// In the example of an offset at the place where text is wrapping, upstream
  /// indicates the end of the first line.
  ///
  /// In the bidirectional text example "helloHELLO", an offset of 5 with
  /// [TextAffinity] upstream would appear in the middle of the rendered text,
  /// just to the right of the "o". See the definition of [TextAffinity] for the
  /// full example.
  upstream,

  /// The position has affinity for the downstream side of the text position,
  /// i.e. in the direction of the end of the string.
  ///
  /// In the example of an offset at the place where text is wrapping,
  /// downstream indicates the beginning of the second line.
  ///
  /// In the bidirectional text example "helloHELLO", an offset of 5 with
  /// [TextAffinity] downstream would appear at the end of the rendered text,
  /// just to the right of the "H". See the definition of [TextAffinity] for the
  /// full example.
  downstream,
}

/// Whether and how to align text horizontally.
// The order of this enum must match the order of the values in RenderStyleConstants.h's ETextAlign.
enum TextAlign {
  /// Align the text on the left edge of the container.
  left,

  /// Align the text on the right edge of the container.
  right,

  /// Align the text in the center of the container.
  center,

  /// Stretch lines of text that end with a soft line break to fill the width of
  /// the container.
  ///
  /// Lines that end with hard line breaks are aligned towards the [start] edge.
  justify,

  /// Align the text on the leading edge of the container.
  ///
  /// For left-to-right text ([TextDirection.ltr]), this is the left edge.
  ///
  /// For right-to-left text ([TextDirection.rtl]), this is the right edge.
  start,

  /// Align the text on the trailing edge of the container.
  ///
  /// For left-to-right text ([TextDirection.ltr]), this is the right edge.
  ///
  /// For right-to-left text ([TextDirection.rtl]), this is the left edge.
  end,
}

/// A direction in which text flows.
///
/// Some languages are written from the left to the right (for example, English,
/// Tamil, or Chinese), while others are written from the right to the left (for
/// example Aramaic, Hebrew, or Urdu). Some are also written in a mixture, for
/// example Arabic is mostly written right-to-left, with numerals written
/// left-to-right.
///
/// The text direction must be provided to APIs that render text or lay out
/// boxes horizontally, so that they can determine which direction to start in:
/// either right-to-left, [TextDirection.rtl]; or left-to-right,
/// [TextDirection.ltr].
///
/// ## Design discussion
///
/// Flutter is designed to address the needs of applications written in any of
/// the world's currently-used languages, whether they use a right-to-left or
/// left-to-right writing direction. Flutter does not support other writing
/// modes, such as vertical text or boustrophedon text, as these are rarely used
/// in computer programs.
///
/// It is common when developing user interface frameworks to pick a default
/// text direction — typically left-to-right, the direction most familiar to the
/// engineers working on the framework — because this simplifies the development
/// of applications on the platform. Unfortunately, this frequently results in
/// the platform having unexpected left-to-right biases or assumptions, as
/// engineers will typically miss places where they need to support
/// right-to-left text. This then results in bugs that only manifest in
/// right-to-left environments.
///
/// In an effort to minimize the extent to which Flutter experiences this
/// category of issues, the lowest levels of the Flutter framework do not have a
/// default text reading direction. Any time a reading direction is necessary,
/// for example when text is to be displayed, or when a
/// writing-direction-dependent value is to be interpreted, the reading
/// direction must be explicitly specified. Where possible, such as in `switch`
/// statements, the right-to-left case is listed first, to avoid the impression
/// that it is an afterthought.
///
/// At the higher levels (specifically starting at the widgets library), an
/// ambient [Directionality] is introduced, which provides a default. Thus, for
/// instance, a [widgets.Text] widget in the scope of a [MaterialApp] widget
/// does not need to be given an explicit writing direction. The
/// [Directionality.of] static method can be used to obtain the ambient text
/// direction for a particular [BuildContext].
///
/// ### Known left-to-right biases in Flutter
///
/// Despite the design intent described above, certain left-to-right biases have
/// nonetheless crept into Flutter's design. These include:
///
///  * The [Canvas] origin is at the top left, and the x-axis increases in a
///    left-to-right direction.
///
///  * The default localization in the widgets and material libraries is
///    American English, which is left-to-right.
///
/// ### Visual properties vs directional properties
///
/// Many classes in the Flutter framework are offered in two versions, a
/// visually-oriented variant, and a text-direction-dependent variant. For
/// example, [EdgeInsets] is described in terms of top, left, right, and bottom,
/// while [EdgeInsetsDirectional] is described in terms of top, start, end, and
/// bottom, where start and end correspond to right and left in right-to-left
/// text and left and right in left-to-right text.
///
/// There are distinct use cases for each of these variants.
///
/// Text-direction-dependent variants are useful when developing user interfaces
/// that should "flip" with the text direction. For example, a paragraph of text
/// in English will typically be left-aligned and a quote will be indented from
/// the left, while in Arabic it will be right-aligned and indented from the
/// right. Both of these cases are described by the direction-dependent
/// [TextAlign.start] and [EdgeInsetsDirectional.start].
///
/// In contrast, the visual variants are useful when the text direction is known
/// and not affected by the reading direction. For example, an application
/// giving driving directions might show a "turn left" arrow on the left and a
/// "turn right" arrow on the right — and would do so whether the application
/// was localized to French (left-to-right) or Hebrew (right-to-left).
///
/// In practice, it is also expected that many developers will only be
/// targeting one language, and in that case it may be simpler to think in
/// visual terms.
// The order of this enum must match the order of the values in TextDirection.h's TextDirection.
enum TextDirection {
  /// The text flows from right to left (e.g. Arabic, Hebrew).
  rtl,

  /// The text flows from left to right (e.g., English, French).
  ltr,
}
