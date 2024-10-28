pragma Singleton

import QtQuick
import QtQuick.Controls.Material

Item {
    enum ThemeNames {
        // Generic mobile themes
        THEME_MOBILE_LIGHT,
        THEME_MOBILE_DARK,

        // Generic mobile material themes
        THEME_MATERIAL_LIGHT,
        THEME_MATERIAL_DARK,

        // Generic desktop themes
        THEME_DESKTOP_LIGHT,
        THEME_DESKTOP_DARK,

        // Jianwei themes
        THEME_JW_LIGHT,
        THEME_JW_DARK,

        THEME_LAST
    }
    property int currentTheme: -1

    ////////////////

    property bool isHdpi: (utilsScreen.screenDpi >= 128 || utilsScreen.screenPar >= 2.0)
    property bool isDesktop: (Qt.platform.os !== "ios" && Qt.platform.os !== "android")
    property bool isMobile: (Qt.platform.os === "ios" || Qt.platform.os === "android")
    property bool isPhone: ((Qt.platform.os === "ios" || Qt.platform.os === "android") && (utilsScreen.screenSize < 7.0))
    property bool isTablet: ((Qt.platform.os === "ios" || Qt.platform.os === "android") && (utilsScreen.screenSize >= 7.0))

    ////////////////
    property int sidebarWidth: isHdpi ? 60: 60
    property int headerHeight: 40
    property int footerHeight: 32
    ////////////////

    property bool isLight
    property bool isDark

    // Status bar (mobile)
    property int themeStatusbar
    property color colorStatusbar

    // Header
    property color colorHeader
    property color colorHeaderContent
    property color colorHeaderHighlight

    // Action bar (mobile)
    property color colorActionbar
    property color colorActionbarContent
    property color colorActionbarHighlight

    // Side bar (desktop)
    property color colorSidebar
    property color colorSidebarContent
    property color colorSidebarHighlight
    property color colorSidebarIndicator

    // Tablet bar (mobile)
    property color colorTabletmenu
    property color colorTabletmenuContent
    property color colorTabletmenuHighlight

    // Content
    property color colorBackground
    property color colorForeground

    property color colorPrimary
    property color colorSecondary
    property color colorSuccess
    property color colorWarning
    property color colorError

    property color colorText
    property color colorSubText
    property color colorIcon
    property color colorSeparator

    property color colorLowContrast
    property color colorHighContrast

    ////////////////

    // App specific (toolBLEx)
    property color colorBox: "white"
    property color colorBoxBorder: "#f4f4f4"
    property color colorBoxShadow: "#20000000"
    property color colorGrid: "#ebebeb"
    property color colorLVheader: "#fafafa"
    property color colorLVpair: "white"
    property color colorLVimpair: "#f5f5f5"
    property color colorLVselected: "#0080e0"
    property color colorLVseparator: "#e2e2e2"


    ////////////////

    // Palette colors
    property color colorRed: "#ff7657"
    property color colorGreen: "#8cd200"
    property color colorBlue: "#4cafe9"
    property color colorYellow: "#ffcf00"
    property color colorOrange: "#ffa635"
    property color colorGrey: "#666"

    // Material colors
    readonly property color colorMaterialRed: "#F44336"
    readonly property color colorMaterialPink: "#E91E63"
    readonly property color colorMaterialPurple: "#9C27B0"
    readonly property color colorMaterialDeepPurple: "#673AB7"
    readonly property color colorMaterialIndigo: "#3F51B5"
    readonly property color colorMaterialBlue: "#2196F3"
    readonly property color colorMaterialLightBlue: "#03A9F4"
    readonly property color colorMaterialCyan: "#00BCD4"
    readonly property color colorMaterialTeal: "#009688"
    readonly property color colorMaterialGreen: "#4CAF50"
    readonly property color colorMaterialLightGreen: "#8BC34A"
    readonly property color colorMaterialLime: "#CDDC39"
    readonly property color colorMaterialYellow: "#FFEB3B"
    readonly property color colorMaterialAmber: "#FFC107"
    readonly property color colorMaterialOrange: "#FF9800"
    readonly property color colorMaterialDeepOrange: "#FF5722"
    readonly property color colorMaterialBrown: "#795548"
    readonly property color colorMaterialGrey: "#9E9E9E"
    readonly property color colorMaterialLightGrey: "#f8f8f8"
    readonly property color colorMaterialDarkGrey: "#ececec"

    // Jianwei colors
    readonly property color colorJwGreen: "#57957d"
    readonly property color colorJwLightGreen: "#8ebf64"
    readonly property color colorJwDarkGreen: "#305873"

    ////////////////

    // Qt Quick Controls & theming
    property color colorComponent
    property color colorComponentText
    property color colorComponentContent
    property color colorComponentBorder
    property color colorComponentDown
    property color colorComponentBackground
    property color colorComponentShadow: isLight ? "#33000000" : "#aaffffff"

    property int componentRadius: 4
    property int componentBorderWidth: 2

    property int componentFontSize: isHdpi ? 14 : 15

    property int componentMarginXS: isHdpi ? 4 : 8
    property int componentMarginS: isHdpi ? 8 : 12
    property int componentMargin: isHdpi ? 12 : 16
    property int componentMarginL: isHdpi ? 16 : 20
    property int componentMarginXL: isHdpi ? 20 : 24

    property int componentHeight: {
        if (isDesktop && isHdpi) return 34
        if (isDesktop) return 38
        return 40
    }
    property int componentHeightL: {
        if (isDesktop && isHdpi) return 42
        if (isDesktop) return 46
        return 48
    }
    property int componentHeightXL: {
        if (isDesktop && isHdpi) return 50
        if (isDesktop) return 54
        return 56
    }

    ////////////////

    // Fonts (sizes in pixel)
    readonly property int fontSizeHeader: isMobile ? 22 : 26
    readonly property int fontSizeTitle: isMobile ? 24 : 28
    readonly property int fontSizeContentVeryVerySmall: 10
    readonly property int fontSizeContentVerySmall: 12
    readonly property int fontSizeContentSmall: 14
    readonly property int fontSizeContent: 16
    readonly property int fontSizeContentBig: 18
    readonly property int fontSizeContentVeryBig: 20
    readonly property int fontSizeContentVeryVeryBig: 22

    // Fonts
    property font headerFont: Qt.font({
        family: 'Encode Sans',
        weight: Font.Black,
        italic: false,
        pixelSize: fontSizeHeader
    })

    ////////////////////////////////////////////////////////////////////////////

    function getThemeIndex(name) {
        if (name === "THEME_MOBILE_LIGHT") return ThemeEngine.THEME_MOBILE_LIGHT
        if (name === "THEME_MOBILE_DARK") return ThemeEngine.THEME_MOBILE_DARK

        if (name === "THEME_MATERIAL_LIGHT") return ThemeEngine.THEME_MATERIAL_LIGHT
        if (name === "THEME_MATERIAL_DARK") return ThemeEngine.THEME_MATERIAL_DARK

        if (name === "THEME_DESKTOP_LIGHT") return ThemeEngine.THEME_DESKTOP_LIGHT
        if (name === "THEME_DESKTOP_DARK") return ThemeEngine.THEME_DESKTOP_DARK

        if (name === "THEME_JW_LIGHT") return ThemeEngine.THEME_JW_LIGHT
        if (name === "THEME_JW_DARK") return ThemeEngine.THEME_JW_DARK

        return -1
    }

    function getThemeName(index) {
        if (index === ThemeEngine.THEME_MOBILE_LIGHT) return "THEME_MOBILE_LIGHT"
        if (index === ThemeEngine.THEME_MOBILE_DARK) return "THEME_MOBILE_DARK"

        if (index === ThemeEngine.THEME_MATERIAL_LIGHT) return "THEME_MATERIAL_LIGHT"
        if (index === ThemeEngine.THEME_MATERIAL_DARK) return "THEME_MATERIAL_DARK"

        if (index === ThemeEngine.THEME_DESKTOP_LIGHT) return "THEME_DESKTOP_LIGHT"
        if (index === ThemeEngine.THEME_DESKTOP_DARK) return "THEME_DESKTOP_DARK"

        if (index === ThemeEngine.THEME_JW_LIGHT) return "THEME_JW_LIGHT"
        if (index === ThemeEngine.THEME_JW_DARK) return "THEME_JW_DARK"

        return ""
    }

    ////////////////////////////////////////////////////////////////////////////

    Component.onCompleted: loadTheme(settingsManager.appTheme)
    Connections {
        target: settingsManager
        function onAppThemeChanged() { loadTheme(settingsManager.appTheme) }
    }

    function loadTheme(newIndex) {
        //console.log("ThemeEngine.loadTheme(" + newIndex + ")")
        var themeIndex = -1

        // Get the theme index
        if ((typeof newIndex === 'string' || newIndex instanceof String)) {
            themeIndex = getThemeIndex(newIndex)
        } else {
            themeIndex = newIndex
        }

        // Validate the result (or set the default)
        if (themeIndex < 0 || themeIndex >= ThemeEngine.THEME_LAST) {
            if (isDesktop) themeIndex = ThemeEngine.THEME_DESKTOP_LIGHT
            else if (isMobile) themeIndex = ThemeEngine.THEME_MOBILE_LIGHT
            else themeIndex = 1
        }

        // Handle day/night themes
        if (settingsManager.appThemeAuto) {
            var rightnow = new Date()
            var hour = Qt.formatDateTime(rightnow, "hh")
            if (hour >= 21 || hour <= 8) {
                if (themeIndex === ThemeEngine.THEME_MOBILE_LIGHT)
                    themeIndex = ThemeEngine.THEME_MOBILE_DARK

                if (themeIndex === ThemeEngine.THEME_MATERIAL_LIGHT)
                    themeIndex = ThemeEngine.THEME_MATERIAL_DARK

                if (themeIndex === ThemeEngine.THEME_DESKTOP_LIGHT)
                    themeIndex = ThemeEngine.THEME_DESKTOP_DARK

                if (themeIndex === ThemeEngine.THEME_JW_LIGHT)
                    themeIndex = ThemeEngine.THEME_JW_DARK
            }
        }

        // Do not reload the same theme
        if (themeIndex === currentTheme) return

        // Set the theme
        if (themeIndex === ThemeEngine.THEME_MOBILE_LIGHT) { ///////////////////

            colorGreen  = "#07bf97"
            colorBlue   = "#4CA1D5"
            colorYellow = "#ffba5a"
            colorOrange = "#ff863a"
            colorRed    = "#ff523a"

            isLight = true
            isDark = false

            themeStatusbar = Material.Light
            colorStatusbar = "#eeeeee"

            colorHeader                 = "#eeeeee"
            colorHeaderContent          = "#ff7b36"
            colorHeaderHighlight        = "white"

            colorActionbar              = colorGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#00a27d"

            colorSidebar                = "#eee"
            colorSidebarContent         = "#777"
            colorSidebarHighlight       = "#ddd"

            colorTabletmenu             = "#f3f3f3"
            colorTabletmenuContent      = "#9d9d9d"
            colorTabletmenuHighlight    = colorMaterialDeepOrange // "#ff7b36"

            colorBackground             = colorMaterialLightGrey
            colorForeground             = "#f0f0f0"

            colorPrimary                = colorMaterialDeepOrange // colorRed
            colorSecondary              = colorMaterialOrange // "#ff7b36"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "#303030"
            colorSubText                = "#666666"
            colorIcon                   = "#303030"
            colorSeparator              = "#ececec"
            colorLowContrast            = "white"
            colorHighContrast           = "black"

            colorComponent              = "#f0f0f0"
            colorComponentText          = "black"
            colorComponentContent       = "black"
            colorComponentBorder        = "#e0e0e0"
            colorComponentDown          = "#e9e9e9"
            colorComponentBackground    = "white"

            componentRadius = 6
            componentBorderWidth = 2

        } else if (themeIndex === ThemeEngine.THEME_MOBILE_DARK) {

            colorGreen  = "#58CF77"
            colorBlue   = "#4dceeb"
            colorYellow = "#fcc632"
            colorOrange = "#ff7657"
            colorRed    = "#e8635a"

            isLight = false
            isDark = true

            themeStatusbar = Material.Dark
            colorStatusbar = "#292929"

            colorHeader                 = "#292929"
            colorHeaderContent          = "#ee8c21"
            colorHeaderHighlight        = "#444"

            colorActionbar              = colorGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#00a27d"

            colorSidebar                = "#333"
            colorSidebarContent         = "#ccc"
            colorSidebarHighlight       = "#555"

            colorTabletmenu             = "#292929"
            colorTabletmenuContent      = "#808080"
            colorTabletmenuHighlight    = "#ff9f1a"

            colorBackground             = "#313236"
            colorForeground             = "#292929"

            colorPrimary                = "#ff9f1a"
            colorSecondary              = "#ffb81a"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "white"
            colorSubText                = "#aaa"
            colorIcon                   = "#ddd"
            colorSeparator              = "#404040"
            colorLowContrast            = "black"
            colorHighContrast           = "white"

            colorComponent              = "#666"
            colorComponentText          = "#eee"
            colorComponentContent       = "white"
            colorComponentBorder        = "#666"
            colorComponentDown          = "#444"
            colorComponentBackground    = "#505050"

            componentRadius = 6
            componentBorderWidth = 2

        } else if (themeIndex === ThemeEngine.THEME_MATERIAL_LIGHT) { /////////

            colorGreen  = "#07bf97"
            colorBlue   = "#4CA1D5"
            colorYellow = "#ffba5a"
            colorOrange = "#ff863a"
            colorRed    = "#ff523a"

            isLight = true
            isDark = false

            themeStatusbar = Material.Light
            colorStatusbar = "white"

            colorHeader                 = "white"
            colorHeaderContent          = "#1a73e8"
            colorHeaderHighlight        = "white"

            colorActionbar              = colorGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#00a27d"

            colorSidebar                = "#eee"
            colorSidebarContent         = "#777"
            colorSidebarHighlight       = "#ddd"

            colorTabletmenu             = "#f3f3f3"
            colorTabletmenuContent      = "#888"
            colorTabletmenuHighlight    = colorMaterialDeepOrange

            colorBackground             = "white"
            colorForeground             = "#f9f9f9"

            colorPrimary                = "#1a73e8"
            colorSecondary              = "#ff7b36"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "#303030"
            colorSubText                = "#666"
            colorIcon                   = "#303030"
            colorSeparator              = "#ececec"
            colorLowContrast            = "white"
            colorHighContrast           = "black"

            colorComponent              = "#f6f6f6"
            colorComponentText          = "black"
            colorComponentContent       = "black"
            colorComponentBorder        = "#f2f2f2"
            colorComponentDown          = "#eee"
            colorComponentBackground    = "white"

            componentRadius = 6
            componentBorderWidth = 2

        } else if (themeIndex === ThemeEngine.THEME_MATERIAL_DARK) {

            colorGreen  = "#58CF77"
            colorBlue   = "#4dceeb"
            colorYellow = "#fcc632"
            colorOrange = "#ff7657"
            colorRed    = "#e8635a"

            isLight = false
            isDark = true

            themeStatusbar = Material.Dark
            colorStatusbar = "#313236"

            colorHeader                 = "#313236"
            colorHeaderContent          = "#ee8c21"
            colorHeaderHighlight        = "#444"

            colorActionbar              = colorGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#00a27d"

            colorSidebar                = "#333"
            colorSidebarContent         = "#ccc"
            colorSidebarHighlight       = "#555"

            colorTabletmenu             = "#292929"
            colorTabletmenuContent      = "#808080"
            colorTabletmenuHighlight    = "#ff9f1a"

            colorBackground             = "#313236"
            colorForeground             = "#292929"

            colorPrimary                = "#ff9f1a"
            colorSecondary              = "#ffb81a"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "white"
            colorSubText                = "#aaa"
            colorIcon                   = "#ccc"
            colorSeparator              = "#404040"
            colorLowContrast            = "black"
            colorHighContrast           = "white"

            colorComponent              = "#666"
            colorComponentText          = "#ddd"
            colorComponentContent       = "white"
            colorComponentBorder        = "#666"
            colorComponentDown          = "#444"
            colorComponentBackground    = "#505050"

            componentRadius = 8
            componentBorderWidth = 2

        } else if (themeIndex === ThemeEngine.THEME_DESKTOP_LIGHT) { ///////////

            colorRed    = "#ff7657"
            colorGreen  = "#85c700"
            colorBlue   = "#4cafe9"
            colorYellow = "#ffcf00"
            colorOrange = "#ffa635"
            colorGrey   = "#9E9E9E"

            isLight = true
            isDark = false

            themeStatusbar = Material.Light
            colorStatusbar = "#f1f0ef"

            colorHeader                 = "#f1f0ef"
            colorHeaderContent          = "#444"
            colorHeaderHighlight        = "#e2e1df"

            colorSidebar                = "white"
            colorSidebarContent         = "#444"
            colorSidebarHighlight       = "#888"

            colorActionbar              = "#eaeaea"
            colorActionbarContent       = "#444"
            colorActionbarHighlight     = "#dadada"

            colorTabletmenu             = "#ffffff"
            colorTabletmenuContent      = "#9d9d9d"
            colorTabletmenuHighlight    = "#cfcbcb"

            colorBackground             = "#f9f8f7"
            colorForeground             = "#f3f2f1"

            colorPrimary                = "#ffc900"
            colorSecondary              = "#ffeb00"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "#373737"
            colorSubText                = "#666666"
            colorIcon                   = "#373737"
            colorSeparator              = "#e8e8e8"
            colorLowContrast            = "white"
            colorHighContrast           = "#303030"

            colorComponent              = "#eaeaea"
            colorComponentText          = "black"
            colorComponentContent       = "black"
            colorComponentBorder        = "#ddd"
            colorComponentDown          = "#dadada"
            colorComponentBackground    = "#fcfcfc"

            componentRadius = 6
            componentBorderWidth = 2

            // (app)
            colorBox                    = "white"
            colorBoxBorder              = "#f4f4f4"
            colorBoxShadow              = "#20000000"
            colorGrid                   = "#ebebeb"
            colorLVheader               = "#fafafa"
            colorLVpair                 = "white"
            colorLVimpair               = "#f5f5f5"
            colorLVselected             = "#0080e0"
            colorLVseparator            = "#e2e2e2"

        } else if (themeIndex === ThemeEngine.THEME_DESKTOP_DARK) {

            colorRed    = "#e8635a"
            colorGreen  = "#58cf77"
            colorBlue   = "#4dceeb"
            colorYellow = "#ffcf00"
            colorOrange = "#ff8f35"
            colorGrey   = "#5e5e5e"

            isLight = false
            isDark = true

            themeStatusbar              = Material.Dark
            colorStatusbar              = "#b16bee"

            colorHeader                 = "#b16bee"
            colorHeaderContent          = "white"
            colorHeaderHighlight        = "#725595"

            colorSidebar                = "#b16bee"
            colorSidebarContent         = "white"
            colorSidebarHighlight       = "#725595"

            colorActionbar              = "#252024"
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#7c54ac"

            colorTabletmenu             = "#292929"
            colorTabletmenuContent      = "#808080"
            colorTabletmenuHighlight    = "#bb86fc"

            colorBackground             = "#2e2a2e"
            colorForeground             = "#333"

            colorPrimary                = "#bb86fc"
            colorSecondary              = "#b16bee"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "#eee"
            colorSubText                = "#999"
            colorIcon                   = "#eee"
            colorSeparator              = "#444"
            colorLowContrast            = "#111"
            colorHighContrast           = "white"

            colorComponent              = "#757575"
            colorComponentText          = "#eee"
            colorComponentContent       = "white"
            colorComponentBorder        = "#777"
            colorComponentDown          = "#595959"
            colorComponentBackground    = "#393939"

            componentRadius = 6
            componentBorderWidth = 2

            // (app)
            colorBox                    = "#252024"
            colorBoxBorder              = "#333"
            colorBoxShadow              = "#aa000000"
            colorGrid                   = "#333"
            colorLVheader               = "#252024"
            colorLVpair                 = "#302b2e"
            colorLVimpair               = "#252024"
            colorLVseparator            = "#333"
            colorLVselected             = "#e90c76"

        } else if (themeIndex === ThemeEngine.THEME_JW_LIGHT) { ///////////////////

            colorGreen  = "#07bf97"
            colorBlue   = "#4CA1D5"
            colorYellow = "#ffba5a"
            colorOrange = "#ff863a"
            colorRed    = "#ff523a"

            isLight = true
            isDark = false

            themeStatusbar = Material.Light
            colorStatusbar = "#eeeeee"

            colorHeader                 = "#eeeeee"
            colorHeaderContent          = "#444"
            colorHeaderHighlight        = "white"

            colorActionbar              = colorJwLightGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = colorJwGreen

            colorSidebar                = "#eee"
            colorSidebarContent         = "#777"
            colorSidebarHighlight       = "#ddd"
            colorSidebarIndicator		= colorMaterialGreen

            colorTabletmenu             = "#f3f3f3"
            colorTabletmenuContent      = "#9d9d9d"
            colorTabletmenuHighlight    = colorMaterialGreen // "#ff7b36"

            colorBackground             = colorMaterialLightGrey
            colorForeground             = "#f0f0f0"

            colorPrimary                = colorMaterialGreen // colorRed
            colorSecondary              = colorMaterialLightGreen // "#ff7b36"
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "#303030"
            colorSubText                = "#666666"
            colorIcon                   = "#303030"
            colorSeparator              = "#ececec"
            colorLowContrast            = "white"
            colorHighContrast           = "black"

            colorComponent              = "#f0f0f0"
            colorComponentText          = "black"
            colorComponentContent       = "black"
            colorComponentBorder        = "#e0e0e0"
            colorComponentDown          = "#e9e9e9"
            colorComponentBackground    = "white"

            componentRadius = 6
            componentBorderWidth = 2

        } else if (themeIndex === ThemeEngine.THEME_JW_DARK) {

            colorGreen  = "#58CF77"
            colorBlue   = "#4dceeb"
            colorYellow = "#fcc632"
            colorOrange = "#ff7657"
            colorRed    = "#e8635a"

            isLight = false
            isDark = true

            themeStatusbar = Material.Dark
            colorStatusbar = "#292929"

            colorHeader                 = "#292929"
            colorHeaderContent          = colorMaterialLightGrey
            colorHeaderHighlight        = colorJwGreen

            colorActionbar              = colorGreen
            colorActionbarContent       = "white"
            colorActionbarHighlight     = "#00a27d"

            colorSidebar                = "#333"
            colorSidebarContent         = "#ccc"
            colorSidebarHighlight       = "#555"
            colorSidebarIndicator 		= colorJwLightGreen

            colorTabletmenu             = "#292929"
            colorTabletmenuContent      = "#808080"
            colorTabletmenuHighlight    = colorMaterialGreen

            colorBackground             = "#313236"
            colorForeground             = "#292929"

            colorPrimary                = colorMaterialGreen
            colorSecondary              = colorMaterialLightGreen
            colorSuccess                = colorGreen
            colorWarning                = colorOrange
            colorError                  = colorRed

            colorText                   = "white"
            colorSubText                = "#aaa"
            colorIcon                   = "#ddd"
            colorSeparator              = "#404040"
            colorLowContrast            = "black"
            colorHighContrast           = "white"

            colorComponent              = "#666"
            colorComponentText          = "#eee"
            colorComponentContent       = "white"
            colorComponentBorder        = "#666"
            colorComponentDown          = "#444"
            colorComponentBackground    = "#505050"

            componentRadius = 6
            componentBorderWidth = 2
        }

        // This will emit the signal 'onCurrentThemeChanged'
        currentTheme = themeIndex
    }
}
