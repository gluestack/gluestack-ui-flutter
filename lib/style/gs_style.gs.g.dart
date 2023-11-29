// **************************************************************************
// ToStringGenerator
// **************************************************************************
part of 'gs_style.dart';

// GS - Generated .toString() Method File //
String _$GSPropsToString(GSProps instance) => ''' GSProps(
action: ${instance.action},
variant: ${instance.variant},
size: ${instance.size},
space: ${instance.space},
style: ${instance.style},
orientation: ${instance.orientation},
color: ${instance.color},
)''';

// GS - Generated .toString() Method File //
String _$GSOrientationToString(GSOrientation instance) => ''' GSOrientation(
vertical: ${instance.vertical},
horizontal: ${instance.horizontal},
)''';

// GS - Generated .toString() Method File //
String _$GSVariantToString(GSVariant instance) => ''' GSVariant(
underlined: ${instance.underlined},
outline: ${instance.outline},
rounded: ${instance.rounded},
solid: ${instance.solid},
link: ${instance.link},
accent: ${instance.accent},
)''';

// GS - Generated .toString() Method File //
String _$GSSizeToString(GSSize instance) => ''' GSSize(
\$xs: ${instance.$xs},
\$sm: ${instance.$sm},
\$md: ${instance.$md},
\$lg: ${instance.$lg},
\$xl: ${instance.$xl},
\$2xs: ${instance.$2xs},
\$2xl: ${instance.$2xl},
\$3xl: ${instance.$3xl},
\$4xl: ${instance.$4xl},
\$5xl: ${instance.$5xl},
\$6xl: ${instance.$6xl},
\$full: ${instance.$full},
)''';

// GS - Generated .toString() Method File //
String _$GSActionToString(GSAction instance) => ''' GSAction(
primary: ${instance.primary},
secondary: ${instance.secondary},
positive: ${instance.positive},
negative: ${instance.negative},
defaultStyle: ${instance.defaultStyle},
error: ${instance.error},
warning: ${instance.warning},
success: ${instance.success},
info: ${instance.info},
muted: ${instance.muted},
attention: ${instance.attention},
)''';

// GS - Generated .toString() Method File //
String _$GSSpaceToString(GSSpace instance) => ''' GSSpace(
\$none: ${instance.$none},
\$xs: ${instance.$xs},
\$sm: ${instance.$sm},
\$md: ${instance.$md},
\$lg: ${instance.$lg},
\$xl: ${instance.$xl},
\$2xl: ${instance.$2xl},
\$3xl: ${instance.$3xl},
\$4xl: ${instance.$4xl},
)''';

// GS - Generated .toString() Method File //
String _$VariantsToString(Variants instance) => ''' Variants(
variant: ${instance.variant},
size: ${instance.size},
action: ${instance.action},
space: ${instance.space},
highlight: ${instance.highlight},
sub: ${instance.sub},
orientation: ${instance.orientation},
)''';

// GS - Generated .toString() Method File //
String _$GSStyleToString(GSStyle instance) => ''' GSStyle(
borderWidth: ${instance.borderWidth},
borderColor: ${instance.borderColor},
borderRadius: ${instance.borderRadius},
padding: ${instance.padding},
margin: ${instance.margin},
opacity: ${instance.opacity},
color: ${instance.color},
fontWeight: ${instance.fontWeight},
bg: ${instance.bg},
gap: ${instance.gap},
borderBottomColor: ${instance.borderBottomColor},
height: ${instance.height},
width: ${instance.width},
outlineWidth: ${instance.outlineWidth},
outlineStyle: ${instance.outlineStyle},
borderBottomWidth: ${instance.borderBottomWidth},
borderLeftWidth: ${instance.borderLeftWidth},
      textStyle: TextStyle(
        color: ${instance.textStyle?.color},
        fontSize: ${instance.textStyle?.fontSize},
        fontWeight: ${instance.textStyle?.fontWeight},
        fontStyle: ${instance.textStyle?.fontStyle},
        letterSpacing: ${instance.textStyle?.letterSpacing},
        wordSpacing: ${instance.textStyle?.wordSpacing},
        height: ${instance.textStyle?.height},
        backgroundColor: ${instance.textStyle?.backgroundColor},
        decoration: ${instance.textStyle?.decoration},
        decorationColor: ${instance.textStyle?.decorationColor},
        decorationStyle: ${instance.textStyle?.decorationStyle},
        decorationThickness: ${instance.textStyle?.decorationThickness},
        textBaseline: ${instance.textStyle?.textBaseline},
        fontFamily: ${instance.textStyle?.fontFamily},
        fontFamilyFallback: ${instance.textStyle?.fontFamilyFallback},
        locale: ${instance.textStyle?.locale},
        foreground: ${instance.textStyle?.foreground},
      ),
    
checked: ${instance.checked},
variants: ${instance.variants},
props: ${instance.props},
      descendantStyles: {
      ${instance.descendantStyles != null && instance.descendantStyles!.isNotEmpty ? instance.descendantStyles!.entries.map(
          (entry) =>
              '\'${entry.key}\': ${entry.value != null ? entry.value!.toString() : 'null'}',
        ).join(',\n') : ''}
    },
    
flexDirection: ${instance.flexDirection},
alignItems: ${instance.alignItems},
justifyContent: ${instance.justifyContent},
maxWidth: ${instance.maxWidth},
alignment: ${instance.alignment},
progressValueColor: ${instance.progressValueColor},
highlightColor: ${instance.highlightColor},
splashColor: ${instance.splashColor},
badge: ${instance.badge},
textTransform: ${instance.textTransform},
iconSize: ${instance.iconSize},
trackColorTrue: ${instance.trackColorTrue},
trackColorFalse: ${instance.trackColorFalse},
thumbColor: ${instance.thumbColor},
activeThumbColor: ${instance.activeThumbColor},
iosBackgroundColor: ${instance.iosBackgroundColor},
scale: ${instance.scale},
outlineColor: ${instance.outlineColor},
cursors: ${instance.cursors},
dark: ${instance.dark},
md: ${instance.md},
lg: ${instance.lg},
sm: ${instance.sm},
xs: ${instance.xs},
onHover: ${instance.onHover},
onFocus: ${instance.onFocus},
onDisabled: ${instance.onDisabled},
input: ${instance.input},
icon: ${instance.icon},
onInvaild: ${instance.onInvaild},
onActive: ${instance.onActive},
web: ${instance.web},
android: ${instance.android},
ios: ${instance.ios},
      contextStyles: TextStyle(
        color: ${instance.textStyle?.color},
        fontSize: ${instance.textStyle?.fontSize},
        fontWeight: ${instance.textStyle?.fontWeight},
        fontStyle: ${instance.textStyle?.fontStyle},
        letterSpacing: ${instance.textStyle?.letterSpacing},
        wordSpacing: ${instance.textStyle?.wordSpacing},
        height: ${instance.textStyle?.height},
        backgroundColor: ${instance.textStyle?.backgroundColor},
        decoration: ${instance.textStyle?.decoration},
        decorationColor: ${instance.textStyle?.decorationColor},
        decorationStyle: ${instance.textStyle?.decorationStyle},
        decorationThickness: ${instance.textStyle?.decorationThickness},
        textBaseline: ${instance.textStyle?.textBaseline},
        fontFamily: ${instance.textStyle?.fontFamily},
        fontFamilyFallback: ${instance.textStyle?.fontFamilyFallback},
        locale: ${instance.textStyle?.locale},
        foreground: ${instance.textStyle?.foreground},
      ),
    
)''';
