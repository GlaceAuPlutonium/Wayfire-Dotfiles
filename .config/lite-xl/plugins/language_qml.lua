-- Due to QML syntax highlighting being basically non-existent on Lite-XL, this specific file was made with Claude to have a slightly more readable code

-- mod-version:3
-- Syntax highlighting for QML (Qt Meta Language / Qt Modeling Language)
-- Drop this file in: ~/.config/lite-xl/plugins/

local syntax = require "core.syntax"

syntax.add {
  name    = "QML",
  files   = { "%.qml$" },
  comment = "//",
  block_comment = { "/*", "*/" },

  patterns = {
    -- Comments
    { pattern = "//.-\n",          type = "comment"  },
    { pattern = { "/%*", "%*/" },  type = "comment"  },

    -- Strings
    { pattern = { '"', '"', '\\' }, type = "string" },
    { pattern = { "'", "'", '\\' }, type = "string" },
    { pattern = { "`", "`", '\\' }, type = "string" },  -- template literals (JS expressions)

    -- Qt / QML resource URLs  (e.g.  "qrc:/path"  or  Qt.resolvedUrl(...))
    { pattern = '"qrc:[^"]*"',     type = "string"   },

    -- Numbers
    { pattern = "0x[%da-fA-F]+",   type = "number"   },
    { pattern = "-?%d+[%d%.eE]*",  type = "number"   },
    { pattern = "-?%.?%d+",        type = "number"   },

    -- Property / signal / function declarations  (keyword2 = secondary keyword color)
    --   property int foo:
    --   readonly property color bar:
    --   signal clicked()
    --   function doThing()
    { pattern = "readonly%s+property%s+[%a_][%w_%.]*", type = "keyword2" },
    { pattern = "property%s+[%a_][%w_%.]*",            type = "keyword2" },
    { pattern = "required%s+property%s+[%a_][%w_%.]*", type = "keyword2" },

    -- Anchors  (anchors.fill: / anchors.centerIn: etc.)
    { pattern = "anchors%.[%a_][%w_]*",  type = "keyword2" },

    -- id: value  —  highlight the id name as a literal
    { pattern = "%f[%w]id%s*:%s*[%a_][%w_]*", type = "literal" },

    -- QML import statement  (import QtQuick 2.15  /  import "." as Foo)
    { pattern = "^%s*import%s+[%S]+",   type = "keyword"  },

    -- Operators
    { pattern = "[%+%-=/%*%^%%<>!~|&%?:]", type = "operator" },

    -- Type names / component names starting with uppercase  (Rectangle, Text, …)
    { pattern = "%u[%w_]*%f[%s{]",  type = "function"  },

    -- Function calls  (foo(...))
    { pattern = "[%a_][%w_]*%f[(]",  type = "function"  },

    -- Everything else — resolved against the symbols table below
    { pattern = "[%a_][%w_]*",       type = "symbol"    },
  },

  symbols = {
    -- -------------------------------------------------------------------------
    --  QML structural keywords
    -- -------------------------------------------------------------------------
    ["import"]      = "keyword",
    ["as"]          = "keyword",
    ["on"]          = "keyword",      -- Connections { target: ...; onClicked: ... }

    -- property modifiers
    ["property"]    = "keyword",
    ["readonly"]    = "keyword",
    ["required"]    = "keyword",
    ["default"]     = "keyword",
    ["alias"]       = "keyword",

    -- signal / function
    ["signal"]      = "keyword",
    ["function"]    = "keyword",
    ["return"]      = "keyword",

    -- JS control flow
    ["if"]          = "keyword",
    ["else"]        = "keyword",
    ["for"]         = "keyword",
    ["while"]       = "keyword",
    ["do"]          = "keyword",
    ["break"]       = "keyword",
    ["continue"]    = "keyword",
    ["switch"]      = "keyword",
    ["case"]        = "keyword",
    ["try"]         = "keyword",
    ["catch"]       = "keyword",
    ["finally"]     = "keyword",
    ["throw"]       = "keyword",
    ["new"]         = "keyword",
    ["delete"]      = "keyword",
    ["typeof"]      = "keyword",
    ["instanceof"]  = "keyword",
    ["in"]          = "keyword",
    ["of"]          = "keyword",
    ["void"]        = "keyword",

    -- JS variable declarations
    ["var"]         = "keyword",
    ["let"]         = "keyword",
    ["const"]       = "keyword",

    -- JS async
    ["async"]       = "keyword",
    ["await"]       = "keyword",

    -- -------------------------------------------------------------------------
    --  QML / Qt built-in types  (keyword2)
    -- -------------------------------------------------------------------------
    ["int"]         = "keyword2",
    ["real"]        = "keyword2",
    ["double"]      = "keyword2",
    ["bool"]        = "keyword2",
    ["string"]      = "keyword2",
    ["url"]         = "keyword2",
    ["color"]       = "keyword2",
    ["date"]        = "keyword2",
    ["point"]       = "keyword2",
    ["size"]        = "keyword2",
    ["rect"]        = "keyword2",
    ["var"]         = "keyword2",
    ["variant"]     = "keyword2",
    ["list"]        = "keyword2",

    -- -------------------------------------------------------------------------
    --  QML built-in components (function color — stands out nicely)
    -- -------------------------------------------------------------------------
    ["Item"]            = "function",
    ["Rectangle"]       = "function",
    ["Text"]            = "function",
    ["Image"]           = "function",
    ["BorderImage"]     = "function",
    ["AnimatedImage"]   = "function",
    ["MouseArea"]       = "function",
    ["Loader"]          = "function",
    ["Repeater"]        = "function",
    ["Component"]       = "function",
    ["Timer"]           = "function",
    ["Connections"]     = "function",
    ["Binding"]         = "function",
    ["Canvas"]          = "function",
    ["Row"]             = "function",
    ["Column"]          = "function",
    ["Grid"]            = "function",
    ["Flow"]            = "function",
    ["RowLayout"]       = "function",
    ["ColumnLayout"]    = "function",
    ["GridLayout"]      = "function",
    ["StackLayout"]     = "function",
    ["Flickable"]       = "function",
    ["ListView"]        = "function",
    ["GridView"]        = "function",
    ["ScrollView"]      = "function",
    ["SwipeView"]       = "function",
    ["TabBar"]          = "function",
    ["TabButton"]       = "function",
    ["Button"]          = "function",
    ["CheckBox"]        = "function",
    ["RadioButton"]     = "function",
    ["Slider"]          = "function",
    ["TextInput"]       = "function",
    ["TextEdit"]        = "function",
    ["ComboBox"]        = "function",
    ["Dialog"]          = "function",
    ["Popup"]           = "function",
    ["Drawer"]          = "function",
    ["Menu"]            = "function",
    ["MenuItem"]        = "function",
    ["ToolBar"]         = "function",
    ["ToolButton"]      = "function",
    ["Label"]           = "function",
    ["BusyIndicator"]   = "function",
    ["ProgressBar"]     = "function",
    ["SpinBox"]         = "function",
    ["Switch"]          = "function",
    ["Pane"]            = "function",
    ["Frame"]           = "function",
    ["GroupBox"]        = "function",
    ["ScrollBar"]       = "function",
    ["RoundButton"]     = "function",
    ["DelayButton"]     = "function",

    -- Quickshell
    ["PanelWindow"]     = "function",
    ["FloatingWindow"]  = "function",
    ["Scope"]           = "function",
    ["ShellRoot"]       = "function",
    ["LazyLoader"]      = "function",

    -- Animations & transitions
    ["NumberAnimation"]    = "function",
    ["ColorAnimation"]     = "function",
    ["PropertyAnimation"]  = "function",
    ["SequentialAnimation"]= "function",
    ["ParallelAnimation"]  = "function",
    ["Transition"]         = "function",
    ["State"]              = "function",
    ["PropertyChanges"]    = "function",
    ["AnchorAnimation"]    = "function",
    ["PathAnimation"]      = "function",
    ["Behavior"]           = "function",
    ["SpringAnimation"]    = "function",
    ["SmoothedAnimation"]  = "function",

    -- -------------------------------------------------------------------------
    --  Globals & literals
    -- -------------------------------------------------------------------------
    ["Qt"]          = "literal",
    ["parent"]      = "literal",
    ["root"]        = "literal",
    ["true"]        = "literal",
    ["false"]       = "literal",
    ["null"]        = "literal",
    ["undefined"]   = "literal",
    ["NaN"]         = "literal",
    ["Infinity"]    = "literal",
    ["this"]        = "literal",
    ["console"]     = "literal",
    ["Math"]        = "literal",
    ["JSON"]        = "literal",
    ["Date"]        = "literal",
  },
}
