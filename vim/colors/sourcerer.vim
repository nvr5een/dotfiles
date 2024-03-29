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

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sourcerer"

hi Normal                 cterm=NONE             ctermbg=NONE  ctermfg=145
hi ColorColumn            cterm=NONE             ctermbg=234   ctermfg=NONE
hi Cursor                 cterm=NONE             ctermbg=241   ctermfg=fg
hi CursorColumn           cterm=NONE             ctermbg=233   ctermfg=fg
hi CursorLine             cterm=NONE             ctermbg=235   ctermfg=NONE
hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=124   ctermfg=16
hi DiffChange             cterm=NONE             ctermbg=68    ctermfg=16
hi DiffText               cterm=NONE             ctermbg=117   ctermfg=16
hi Directory              cterm=NONE             ctermbg=NONE  ctermfg=110
hi ErrorMsg               cterm=bold             ctermbg=NONE  ctermfg=203
hi FoldColumn             cterm=bold             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=233   ctermfg=60
hi IncSearch              cterm=bold             ctermbg=202   ctermfg=231
hi LineNr                 cterm=NONE             ctermbg=237   ctermfg=102
hi MatchParen             cterm=bold             ctermbg=NONE  ctermfg=226
hi ModeMsg                cterm=bold             ctermbg=NONE  ctermfg=145
hi MoreMsg                cterm=bold             ctermbg=234   ctermfg=29
hi NonText                cterm=NONE             ctermbg=NONE  ctermfg=59
hi Pmenu                  cterm=NONE             ctermbg=238   ctermfg=231
hi PmenuSbar              cterm=NONE             ctermbg=250   ctermfg=fg
hi PmenuSel               cterm=NONE             ctermbg=149   ctermfg=16
hi Question               cterm=bold             ctermbg=NONE  ctermfg=46
hi Search                 cterm=bold             ctermbg=185   ctermfg=16
hi SignColumn             cterm=NONE             ctermbg=NONE  ctermfg=231
hi SpecialKey             cterm=NONE             ctermbg=NONE  ctermfg=59
hi SpellBad               cterm=undercurl        ctermbg=NONE  ctermfg=196
hi SpellCap               cterm=undercurl        ctermbg=NONE  ctermfg=21
hi SpellLocal             cterm=undercurl        ctermbg=NONE  ctermfg=30
hi SpellRare              cterm=undercurl        ctermbg=NONE  ctermfg=201
hi StatusLine             cterm=NONE             ctermbg=236   ctermfg=145
hi StatusLineNC           cterm=NONE             ctermbg=235   ctermfg=237
hi VertSplit              cterm=NONE             ctermbg=235   ctermfg=236
hi TabLine                cterm=bold             ctermbg=102   ctermfg=16
hi TabLineFill            cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineSel             cterm=bold             ctermbg=16    ctermfg=59
hi Title                  cterm=bold             ctermbg=NONE  ctermfg=66
hi Visual                 cterm=NONE             ctermbg=67    ctermfg=16
hi WarningMsg             cterm=NONE             ctermbg=NONE  ctermfg=172
hi WildMenu               cterm=NONE             ctermbg=172   ctermfg=234
hi ExtraWhitespace        cterm=NONE             ctermbg=66    ctermfg=fg

hi Comment                cterm=NONE             ctermbg=NONE  ctermfg=59
hi Boolean                cterm=NONE             ctermbg=NONE  ctermfg=208
hi String                 cterm=NONE             ctermbg=NONE  ctermfg=101
hi Identifier             cterm=NONE             ctermbg=NONE  ctermfg=145
hi Function               cterm=NONE             ctermbg=NONE  ctermfg=230
hi Type                   cterm=NONE             ctermbg=NONE  ctermfg=103
hi Statement              cterm=NONE             ctermbg=NONE  ctermfg=110
hi Keyword                cterm=NONE             ctermbg=NONE  ctermfg=110
hi Constant               cterm=NONE             ctermbg=NONE  ctermfg=208
hi Number                 cterm=NONE             ctermbg=NONE  ctermfg=172
hi Special                cterm=NONE             ctermbg=NONE  ctermfg=64
hi PreProc                cterm=NONE             ctermbg=NONE  ctermfg=66
hi Todo                   cterm=bold,underline   ctermbg=234   ctermfg=96

hi diffOldFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffAdded              cterm=NONE             ctermfg=NONE  ctermfg=71
hi diffRemoved            cterm=NONE             ctermfg=NONE  ctermfg=124
hi diffChanged            cterm=NONE             ctermfg=NONE  ctermfg=68
hi link                   diffSubname            diffLine
hi link                   diffOnly               Constant
hi link                   diffIdentical          Constant
hi link                   diffDiffer             Constant
hi link                   diffBDiffer            Constant
hi link                   diffIsA                Constant
hi link                   diffNoEOL              Constant
hi link                   diffCommon             Constant
hi link                   diffComment            Constant

hi pythonClass            cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonDecorator        cterm=NONE             ctermbg=NONE  ctermfg=101
hi pythonExClass          cterm=NONE             ctermbg=NONE  ctermfg=95
hi pythonException        cterm=NONE             ctermbg=NONE  ctermfg=110
hi pythonFunc             cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonFuncParams       cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonKeyword          cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonParam            cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonRawEscape        cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonSuperclasses     cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonSync             cterm=NONE             ctermbg=NONE  ctermfg=fg

hi Conceal                cterm=NONE             ctermbg=248   ctermfg=252
hi Error                  cterm=NONE             ctermbg=196   ctermfg=231
hi Ignore                 cterm=NONE             ctermbg=NONE  ctermfg=234
hi InsertModeCursorLine   cterm=NONE             ctermbg=16    ctermfg=fg
hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg
hi PmenuThumb             cterm=reverse          ctermbg=NONE  ctermfg=fg
hi StatusLineAlert        cterm=NONE             ctermbg=160   ctermfg=231
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144
hi Test                   cterm=NONE             ctermbg=NONE  ctermfg=fg
hi Underlined             cterm=underline        ctermbg=NONE  ctermfg=111
hi VisualNOS              cterm=bold,underline   ctermbg=NONE  ctermfg=fg
hi cCursor                cterm=reverse          ctermbg=NONE  ctermfg=fg
hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
hi nCursor                cterm=NONE             ctermbg=NONE  ctermfg=145
hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16

hi Pmenu                  cterm=NONE             ctermfg=248   ctermbg=237
hi PmenuSel               cterm=NONE             ctermfg=16    ctermbg=66
hi PmenuSbar              cterm=NONE             ctermfg=16    ctermbg=66
hi PmenuThumb             cterm=NONE             ctermfg=16    ctermbg=66

