"   ██████  ██████  ██   ██ ██████  █████   █████  ██████  █████  ██████
"  ██░░░░  ██░░░░██░██  ░██░░██░░████░░░██ ██░░░██░░██░░████░░░██░░██░░██
" ░░█████ ░██   ░██░██  ░██ ░██ ░░░██  ░░ ░███████ ░██ ░░░███████ ░██ ░░
"  ░░░░░██░██   ░██░██  ░██ ░██   ░██   ██░██░░░░  ░██   ░██░░░░  ░██
"  ██████ ░░██████ ░░██████░███   ░░█████ ░░██████░███   ░░██████░███
" ░░░░░░   ░░░░░░   ░░░░░░ ░░░     ░░░░░   ░░░░░░ ░░░     ░░░░░░ ░░░
"  r  e  a  d     c  o  d  e     l  i  k  e     a     w  i  z  a  r  d
"
" fork of sourcerer by xero harrison (http://sourcerer.xero.nu)
"  ├─ based on sorcerer by Jeet Sukumaran (http://jeetworks.org)
"  └─ based on mustang by Henrique C. Alves (hcarvalhoalves@gmail.com)

" sourcerer.vim
" 256-color dark Vim colorscheme

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "sourcerer"

" ---------------------------------------------------------------------------
" Editor
" ---------------------------------------------------------------------------

hi Normal                 cterm=NONE             ctermbg=NONE  ctermfg=145

hi ColorColumn            cterm=NONE             ctermbg=234   ctermfg=NONE
hi Conceal                cterm=NONE             ctermbg=248   ctermfg=252

hi Cursor                 cterm=NONE             ctermbg=241   ctermfg=fg
hi CursorColumn           cterm=NONE             ctermbg=233   ctermfg=fg
hi CursorLine             cterm=NONE             ctermbg=235   ctermfg=NONE
hi CursorLineNr           cterm=bold             ctermbg=237   ctermfg=145

hi Directory              cterm=NONE             ctermbg=NONE  ctermfg=110

hi EndOfBuffer            cterm=NONE             ctermbg=NONE  ctermfg=59
hi NonText                cterm=NONE             ctermbg=NONE  ctermfg=59
hi SpecialKey             cterm=NONE             ctermbg=NONE  ctermfg=59

hi ErrorMsg               cterm=bold             ctermbg=NONE  ctermfg=203
hi WarningMsg             cterm=NONE             ctermbg=NONE  ctermfg=172
hi MoreMsg                cterm=bold             ctermbg=234   ctermfg=29
hi Question               cterm=bold             ctermbg=NONE  ctermfg=46
hi ModeMsg                cterm=bold             ctermbg=NONE  ctermfg=145
hi MsgArea                cterm=NONE             ctermbg=NONE  ctermfg=145

hi FoldColumn             cterm=bold             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=233   ctermfg=60

hi LineNr                 cterm=NONE             ctermbg=237   ctermfg=102
hi LineNrAbove            cterm=NONE             ctermbg=237   ctermfg=102
hi LineNrBelow            cterm=NONE             ctermbg=237   ctermfg=102

hi MatchParen             cterm=bold             ctermbg=NONE  ctermfg=226

hi SignColumn             cterm=NONE             ctermbg=NONE  ctermfg=231

hi Title                  cterm=bold             ctermbg=NONE  ctermfg=66

hi Visual                 cterm=NONE             ctermbg=67    ctermfg=16
hi VisualNOS              cterm=bold,underline   ctermbg=NONE  ctermfg=fg

hi WildMenu               cterm=NONE             ctermbg=172   ctermfg=234

hi ExtraWhitespace        cterm=NONE             ctermbg=66    ctermfg=fg

" ---------------------------------------------------------------------------
" Search
" ---------------------------------------------------------------------------

hi Search                 cterm=bold             ctermbg=185   ctermfg=16
hi IncSearch              cterm=bold             ctermbg=202   ctermfg=231
hi CurSearch              cterm=bold             ctermbg=202   ctermfg=231

" ---------------------------------------------------------------------------
" Statusline / window separators
" ---------------------------------------------------------------------------

hi StatusLine             cterm=NONE             ctermbg=236   ctermfg=145
hi StatusLineNC           cterm=NONE             ctermbg=235   ctermfg=102
hi StatusLineTerm         cterm=NONE             ctermbg=236   ctermfg=145
hi StatusLineTermNC       cterm=NONE             ctermbg=235   ctermfg=102

hi StatusLineAlert        cterm=NONE             ctermbg=160   ctermfg=231
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144

hi VertSplit              cterm=NONE             ctermbg=235   ctermfg=236
hi WinSeparator           cterm=NONE             ctermbg=235   ctermfg=236

hi WinBar                 cterm=NONE             ctermbg=NONE  ctermfg=145
hi WinBarNC               cterm=NONE             ctermbg=NONE  ctermfg=102

" ---------------------------------------------------------------------------
" Tabs
" ---------------------------------------------------------------------------

hi TabLine                cterm=bold             ctermbg=102   ctermfg=16
hi TabLineFill            cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineSel             cterm=bold             ctermbg=16    ctermfg=145

" ---------------------------------------------------------------------------
" Popup / completion menu
" ---------------------------------------------------------------------------

hi Pmenu                  cterm=NONE             ctermbg=237   ctermfg=248
hi PmenuSel               cterm=NONE             ctermbg=66    ctermfg=16
hi PmenuSbar              cterm=NONE             ctermbg=66    ctermfg=16
hi PmenuThumb             cterm=NONE             ctermbg=145   ctermfg=16

hi! link PmenuKind        Pmenu
hi! link PmenuKindSel     PmenuSel
hi! link PmenuExtra       Comment
hi! link PmenuExtraSel    PmenuSel
hi! link PmenuMatch       Search
hi! link PmenuMatchSel    PmenuSel

" ---------------------------------------------------------------------------
" Floating windows
" ---------------------------------------------------------------------------

hi NormalFloat            cterm=NONE             ctermbg=234   ctermfg=145
hi FloatBorder            cterm=NONE             ctermbg=234   ctermfg=59
hi FloatTitle             cterm=bold             ctermbg=234   ctermfg=110

" ---------------------------------------------------------------------------
" Diff
" ---------------------------------------------------------------------------

hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=124   ctermfg=16
hi DiffChange             cterm=NONE             ctermbg=68    ctermfg=16
hi DiffText               cterm=bold             ctermbg=117   ctermfg=16

hi diffOldFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE  ctermfg=67

hi diffAdded              cterm=NONE             ctermbg=NONE  ctermfg=71
hi diffRemoved            cterm=NONE             ctermbg=NONE  ctermfg=124
hi diffChanged            cterm=NONE             ctermbg=NONE  ctermfg=68

hi! link diffSubname      diffLine
hi! link diffOnly         Constant
hi! link diffIdentical    Constant
hi! link diffDiffer       Constant
hi! link diffBDiffer      Constant
hi! link diffIsA          Constant
hi! link diffNoEOL        Constant
hi! link diffCommon       Constant
hi! link diffComment      Comment

" ---------------------------------------------------------------------------
" Quickfix
" ---------------------------------------------------------------------------

hi QuickFixLine           cterm=NONE             ctermbg=67    ctermfg=16

" ---------------------------------------------------------------------------
" Spell checking
" ---------------------------------------------------------------------------

hi SpellBad               cterm=undercurl        ctermbg=NONE  ctermfg=196
hi SpellCap               cterm=undercurl        ctermbg=NONE  ctermfg=21
hi SpellLocal             cterm=undercurl        ctermbg=NONE  ctermfg=30
hi SpellRare              cterm=undercurl        ctermbg=NONE  ctermfg=201

" ---------------------------------------------------------------------------
" Standard syntax groups
" ---------------------------------------------------------------------------

hi Comment                cterm=NONE             ctermbg=NONE  ctermfg=59

hi Constant               cterm=NONE             ctermbg=NONE  ctermfg=208
hi String                 cterm=NONE             ctermbg=NONE  ctermfg=101
hi Character              cterm=NONE             ctermbg=NONE  ctermfg=101
hi Number                 cterm=NONE             ctermbg=NONE  ctermfg=172
hi Boolean                cterm=NONE             ctermbg=NONE  ctermfg=208
hi Float                  cterm=NONE             ctermbg=NONE  ctermfg=172

hi Identifier             cterm=NONE             ctermbg=NONE  ctermfg=145
hi Function               cterm=NONE             ctermbg=NONE  ctermfg=230

hi Statement              cterm=NONE             ctermbg=NONE  ctermfg=110
hi Conditional            cterm=NONE             ctermbg=NONE  ctermfg=110
hi Repeat                 cterm=NONE             ctermbg=NONE  ctermfg=110
hi Label                  cterm=NONE             ctermbg=NONE  ctermfg=110
hi Operator               cterm=NONE             ctermbg=NONE  ctermfg=145
hi Keyword                cterm=NONE             ctermbg=NONE  ctermfg=110
hi Exception              cterm=NONE             ctermbg=NONE  ctermfg=110

hi PreProc                cterm=NONE             ctermbg=NONE  ctermfg=66
hi Include                cterm=NONE             ctermbg=NONE  ctermfg=66
hi Define                 cterm=NONE             ctermbg=NONE  ctermfg=66
hi Macro                  cterm=NONE             ctermbg=NONE  ctermfg=66
hi PreCondit              cterm=NONE             ctermbg=NONE  ctermfg=66

hi Type                   cterm=NONE             ctermbg=NONE  ctermfg=103
hi StorageClass           cterm=NONE             ctermbg=NONE  ctermfg=103
hi Structure              cterm=NONE             ctermbg=NONE  ctermfg=103
hi Typedef                cterm=NONE             ctermbg=NONE  ctermfg=103

hi Special                cterm=NONE             ctermbg=NONE  ctermfg=64
hi SpecialChar            cterm=NONE             ctermbg=NONE  ctermfg=64
hi Tag                    cterm=NONE             ctermbg=NONE  ctermfg=64
hi Delimiter              cterm=NONE             ctermbg=NONE  ctermfg=145
hi SpecialComment         cterm=NONE             ctermbg=NONE  ctermfg=59
hi Debug                  cterm=NONE             ctermbg=NONE  ctermfg=64

hi Underlined             cterm=underline        ctermbg=NONE  ctermfg=111
hi Ignore                 cterm=NONE             ctermbg=NONE  ctermfg=234

hi Error                  cterm=NONE             ctermbg=196   ctermfg=231
hi Todo                   cterm=bold,underline   ctermbg=234   ctermfg=96

" ---------------------------------------------------------------------------
" Python
" ---------------------------------------------------------------------------

hi! link pythonBuiltin        Function
hi! link pythonClass          Type
hi! link pythonDecorator      PreProc
hi! link pythonDecoratorName  Function
hi! link pythonException      Exception
hi! link pythonExClass        Type
hi! link pythonFunction       Function
hi! link pythonFunc           Function
hi! link pythonInclude        Include
hi! link pythonKeyword        Keyword
hi! link pythonOperator       Operator
hi! link pythonRepeat         Repeat
hi! link pythonStatement      Statement
hi! link pythonString         String
hi! link pythonRawString      String
hi! link pythonEscape         SpecialChar
hi! link pythonRawEscape      SpecialChar
hi! link pythonNumber         Number
hi! link pythonBoolean        Boolean
hi! link pythonNone           Constant
hi! link pythonTodo           Todo

" Additional groups used by some Python syntax implementations.
hi! link pythonParam          Identifier
hi! link pythonFuncParams     Identifier
hi! link pythonSuperclasses   Type
hi! link pythonSync           Statement


" ---------------------------------------------------------------------------
" Git / gitcommit / gitconfig
" ---------------------------------------------------------------------------

hi! link gitcommitSummary          Title
hi! link gitcommitComment          Comment
hi! link gitcommitUntracked        Comment
hi! link gitcommitDiscarded        DiffDelete
hi! link gitcommitSelected         DiffAdd
hi! link gitcommitUnmerged         DiffChange
hi! link gitcommitOnBranch         Statement
hi! link gitcommitBranch           Identifier
hi! link gitcommitHeader           PreProc
hi! link gitcommitOverflow         Error
hi! link gitcommitBlank            Error
hi! link gitcommitFile             Directory

hi! link gitconfigSection          Type
hi! link gitconfigVariable         Identifier
hi! link gitconfigAssignment       Operator
hi! link gitconfigBoolean          Boolean
hi! link gitconfigNumber           Number
hi! link gitconfigString           String

hi! link gitHash                   Constant
hi! link gitIdentity               Identifier
hi! link gitIdentityKeyword        Keyword
hi! link gitStage                  Statement
hi! link gitType                   Type


" ---------------------------------------------------------------------------
" Markdown
" ---------------------------------------------------------------------------

hi! link markdownHeadingDelimiter  Comment
hi! link markdownH1                Title
hi! link markdownH2                Title
hi! link markdownH3                Title
hi! link markdownH4                Title
hi! link markdownH5                Title
hi! link markdownH6                Title

hi! link markdownBold              Statement
hi! link markdownItalic            Underlined
hi! link markdownBoldItalic        Statement

hi! link markdownCode              String
hi! link markdownCodeBlock         String
hi! link markdownCodeDelimiter     Comment

hi! link markdownLinkText          Identifier
hi! link markdownUrl               Underlined
hi! link markdownAutomaticLink     Underlined
hi! link markdownLinkDelimiter     Delimiter
hi! link markdownLinkTextDelimiter Delimiter

hi! link markdownBlockquote        Comment
hi! link markdownListMarker        Special
hi! link markdownOrderedListMarker Special
hi! link markdownRule              Comment
hi! link markdownEscape            SpecialChar

hi! link markdownError             Error


" ---------------------------------------------------------------------------
" YAML
" ---------------------------------------------------------------------------

hi! link yamlKeyValueDelimiter     Delimiter
hi! link yamlFlowIndicator         Delimiter
hi! link yamlFlowCollection        Delimiter
hi! link yamlBlockCollectionItemStart Special

hi! link yamlKey                   Identifier
hi! link yamlPlainScalar           String
hi! link yamlQuotedString          String
hi! link yamlSingleQuotedString    String
hi! link yamlDoubleQuotedString    String

hi! link yamlBool                  Boolean
hi! link yamlNull                  Constant
hi! link yamlInteger               Number
hi! link yamlFloat                 Number
hi! link yamlTimestamp             Constant

hi! link yamlAnchor                Identifier
hi! link yamlAlias                 Identifier
hi! link yamlNodeTag               Type
hi! link yamlTagHandle             Type
hi! link yamlDirective             PreProc

hi! link yamlComment               Comment


" ---------------------------------------------------------------------------
" JSON
" ---------------------------------------------------------------------------

hi! link jsonKeyword               Identifier
hi! link jsonKeywordMatch          Identifier
hi! link jsonQuote                 Delimiter

hi! link jsonString                String
hi! link jsonStringSQError         Error
hi! link jsonEscape                SpecialChar

hi! link jsonNumber                Number
hi! link jsonBoolean               Boolean
hi! link jsonNull                  Constant

hi! link jsonBraces                Delimiter
hi! link jsonBrackets              Delimiter

hi! link jsonNoise                 Delimiter
hi! link jsonPadding               Normal

hi! link jsonCommentError          Error
hi! link jsonSemicolonError        Error
hi! link jsonTrailingCommaError    Error
hi! link jsonMissingCommaError     Error
hi! link jsonNoQuotesError         Error


" ---------------------------------------------------------------------------
" Shell / Bash / Zsh
" ---------------------------------------------------------------------------

hi! link shComment                 Comment
hi! link shTodo                    Todo

hi! link shVariable                Identifier
hi! link shDeref                   Identifier
hi! link shDerefSimple             Identifier
hi! link shDerefVar                Identifier
hi! link shDerefSpecial            Special

hi! link shFunction                Function
hi! link shFunctionKey             Keyword

hi! link shStatement               Statement
hi! link shConditional             Conditional
hi! link shLoop                    Repeat
hi! link shOperator                Operator
hi! link shOption                  Special

hi! link shQuote                   String
hi! link shSingleQuote             String
hi! link shDoubleQuote             String
hi! link shString                  String
hi! link shSpecial                 SpecialChar
hi! link shEscape                  SpecialChar

hi! link shNumber                  Number
hi! link shTestOpr                 Operator
hi! link shTestPattern             String

hi! link shHereDoc                 String
hi! link shHereDoc01               String
hi! link shHereDoc02               String
hi! link shHereDoc03               String

hi! link bashAdminStatement        Statement
hi! link bashSpecialVariables      Identifier
hi! link bashStatement             Statement

hi! link zshCommands               Function
hi! link zshKeyword                Keyword
hi! link zshVariableDef            Identifier
hi! link zshVariable               Identifier
hi! link zshTypes                  Type


" ---------------------------------------------------------------------------
" Dockerfile
" ---------------------------------------------------------------------------

hi! link dockerfileKeyword         Keyword
hi! link dockerfileInstruction     Keyword

hi! link dockerfileFrom            Statement
hi! link dockerfileRun             Statement
hi! link dockerfileCmd             Statement
hi! link dockerfileEntrypoint      Statement
hi! link dockerfileCopy            Statement
hi! link dockerfileAdd             Statement
hi! link dockerfileWorkdir         Statement
hi! link dockerfileExpose          Statement
hi! link dockerfileVolume          Statement
hi! link dockerfileUser            Statement
hi! link dockerfileArg             Statement
hi! link dockerfileEnv             Statement
hi! link dockerfileLabel           Statement
hi! link dockerfileOnbuild         Statement
hi! link dockerfileStopsignal      Statement
hi! link dockerfileHealthcheck     Statement
hi! link dockerfileShell           Statement

hi! link dockerfileComment         Comment
hi! link dockerfileString          String
hi! link dockerfileEnvVar          Identifier
hi! link dockerfileArgVar          Identifier


" ---------------------------------------------------------------------------
" Custom cursor groups
" ---------------------------------------------------------------------------

hi InsertModeCursorLine   cterm=NONE             ctermbg=16    ctermfg=fg
hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg

hi cCursor                cterm=reverse          ctermbg=NONE  ctermfg=fg
hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
hi nCursor                cterm=NONE             ctermbg=NONE  ctermfg=145
hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16

" ---------------------------------------------------------------------------
" Miscellaneous
" ---------------------------------------------------------------------------

hi Test                   cterm=NONE             ctermbg=NONE  ctermfg=fg
