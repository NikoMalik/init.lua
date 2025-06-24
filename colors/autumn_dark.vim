" # Autumn
"
" Autumn is a color scheme inspired by the colors you can find in the autumn.
" Originally it was written as a color scheme for Komodo IDE but was ported to
" Vim by Kenneth Love and Chris Jones. Since I moved to Vim I've made several
" changes and improvements to the color scheme, however if it wasn't for Ken and
" Chris I probably wouldn't have any clue where to start.
"
" More information about the color scheme (as well as an up to date version) can
" be found here: https://github.com/YorickPeterse/Autumn.vim
"
" This version has been adapted to use a color palette ported by Jens Getreu for
" the Helix editor, based on the Autumn theme.
"
" ## Requirements
"
" * Vim 7 or newer (7.3 or newer is recommended)
" * A version of Vim capable of displaying lots of colors. Autumn was designed
"   to be used in combination with Gvim, Macvim or similar implementations of
"   Vim. However, Autumn does offer support for 256 color terminals but the
"   colors will look slightly different.
"
" ## Installation
"
" Assuming you've downloaded this file and placed it somewhere all you have to
" do is move it into your "color" directory:
"
"     $ cp ~/Downloads/autumn.vim ~/.vim/colors/
"
" ## Supported Languages & Features
"
" Autumn supports most, if not all features provided by Vim as well as a large
" amount of programming/scripting languages such as Ruby and C. Autumn comes
" with tweaked colors for the following languages:
"
" * Ruby
" * CSS
" * HTML
" * PHP
" * Python
" * Javascript
"
" Other languages such as Java or more obscure ones such as Rust are also
" supported. As long as there's a proper syntax highlighting plugin for the
" language this color scheme should be able to handle it just fine. However, if
" this isn't the case feel free to submit patches using Github.
"
" Once installed you can activate it by running `:color autumn` in a Vim
" session.
"
" Authors: Yorick Peterse, Kenneth Love, Chris Jones, Jens Getreu
" License: Creative Commons ShareAlike 3 License
" Website: https://github.com/YorickPeterse/Autumn.vim
"
set background=dark
set t_Co=256

" Basic "maintenance" before setting our own colors and what not.
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "autumn"

" Vim >= 7.0 specific colors.
if version >= 700
  hi Pmenu    guifg=#e8e8e8 guibg=#1a1a1a ctermfg=255 ctermbg=234
  hi PmenuSel guifg=#111111 guibg=#FAD566 ctermfg=0   ctermbg=222
endif

" ColorColumn is available since Vim 7.3.
if version >= 703
  hi ColorColumn guibg=#404040 ctermbg=238
endif

" General colors
hi Cursor       guifg=NONE    guibg=#626C66 ctermfg=none ctermbg=241 gui=none
hi Normal       guifg=#F3F2CC guibg=#090909 ctermfg=230  ctermbg=232 gui=none
hi NonText      guifg=#626C66 guibg=#090909 ctermfg=241  ctermbg=232 gui=none
hi LineNr       guifg=#626C66 guibg=#090909 ctermfg=241  ctermbg=232 gui=none
hi StatusLine   guifg=#090909 guibg=#aaaaaa ctermfg=232  ctermbg=248 gui=none
hi StatusLineNC guifg=#aaaaaa guibg=#090909 ctermfg=248  ctermbg=232 gui=none
hi VertSplit    guifg=#404040 guibg=#090909 ctermfg=238  ctermbg=232 gui=none
hi Title        guifg=#e8e8e8 guibg=NONE    ctermfg=255  ctermbg=none gui=bold
hi SpecialKey   guifg=#626C66 guibg=#0e0e0e ctermfg=241  ctermbg=233 gui=none
hi Folded       guifg=#111111 guibg=#404040 ctermfg=0    ctermbg=238 gui=none
hi FoldColumn   guifg=#626C66 guibg=#090909 ctermfg=241  ctermbg=232 gui=none
hi SignColumn   guifg=#626C66 guibg=#090909 ctermfg=241  ctermbg=232 gui=none
hi MatchParen   guifg=#F05E48 guibg=NONE    ctermfg=203  ctermbg=none gui=none
hi Visual       guifg=NONE    guibg=#404040 ctermfg=none ctermbg=238 gui=none
hi Search       guifg=#111111 guibg=#FAD566 ctermfg=0    ctermbg=222 gui=none
hi Question     guifg=#99be70 guibg=NONE    ctermfg=149  ctermbg=none gui=none
hi ErrorMsg     guifg=#e8e8e8 guibg=#F05E48 ctermfg=255  ctermbg=203 gui=none
hi Error        guifg=#e8e8e8 guibg=#F05E48 ctermfg=255  ctermbg=203 gui=none
hi Directory    guifg=#86c1b9 guibg=NONE    ctermfg=109  ctermbg=none gui=none

" Common syntax elements.
hi Comment    guifg=#626C66 gui=none ctermfg=241
hi Todo       guifg=#c4c4c4 gui=none ctermfg=251 guibg=NONE ctermbg=none
hi Boolean    guifg=#F05E48 gui=none ctermfg=203
hi String     guifg=#99be70 gui=none ctermfg=149
hi Identifier guifg=#F3F2CC gui=none ctermfg=230
hi Function   guifg=#FAD566 gui=none ctermfg=222
hi Type       guifg=#F05E48 gui=none ctermfg=203
hi Statement  guifg=#F05E48 gui=none ctermfg=203
hi Keyword    guifg=#F05E48 gui=none ctermfg=203
hi Constant   guifg=#F3F2CC gui=none ctermfg=230
hi Number     guifg=#99be70 gui=none ctermfg=149
hi PreProc    guifg=#86c1b9 gui=none ctermfg=109
hi Operator   guifg=#F3F2CC gui=none ctermfg=230
hi Special    guifg=#F3F2CC gui=none ctermfg=230

hi link StorageClass Normal

" Ruby
hi rubySymbol guifg=#cfba8b guibg=NONE ctermfg=180

hi link rubyConstant         Normal
hi link rubyInstanceVariable Directory
hi link rubyClassVariable    rubyInstanceVariable
hi link rubyClass            Statement
hi link rubyModule           rubyClass
hi link rubyFunction         Function
hi link rubyDefine           Statement
hi link rubyRegexp           rubySymbol

" CSS
hi link cssIdentifier   Identifier
hi link cssFontProp     cssIdentifier
hi link cssImport       Statement
hi link cssColor        Number
hi link cssBraces       Operator
hi link cssTagName      Function
hi link cssFunctionName cssTagName
hi link cssVendor       cssIdentifier

" Diffs
hi diffAdded     guifg=#e8e8e8 guibg=#99be70 ctermfg=255 ctermbg=149
hi diffRemoved   guifg=#e8e8e8 guibg=#F05E48 ctermfg=255 ctermbg=203
hi diffFile      guifg=#e8e8e8 guibg=NONE    ctermfg=255 ctermbg=none
hi diffLine      guifg=#86c1b9 guibg=NONE    ctermfg=109 ctermbg=none
hi diffNoEOL     guifg=#c4c4c4 guibg=NONE    ctermfg=251 ctermbg=none
hi diffComment   guifg=#626C66 guibg=NONE    ctermfg=241 ctermbg=none
hi DiffChange    guifg=#111111 guibg=#FAD566 ctermfg=0   ctermbg=222
hi DiffText      guifg=#111111 guibg=#ffff9f ctermfg=0   ctermbg=229

hi link DiffAdd    diffAdded
hi link DiffDelete diffRemoved

" HTML
hi link htmlString  String
hi link htmlTag     Normal
hi link htmlTagN    htmlTag
hi link htmlTagName htmlTag
hi link htmlLink    Directory
hi link htmlArg     Function

" Python
hi link PythonComment Comment

" Javascript
hi link javascriptNumber Number

" Coffeescript
hi link coffeeSpecialIdent Directory
hi link coffeeObject       Constant
hi link coffeeRegex        rubyRegexp
hi link coffeeObjAssign    rubyFunction

" Vala
hi link valaStorage   valaRepeat
hi link valaModifier  valaRepeat
hi link valaCharacter Character
hi link valaType      Function

" D
hi link dOperator   Keyword
hi link dAnnotation Directory
hi link dScopeDecl  Keyword

" Annoy fellow Vim users by enforcing these indentation rules.
" vim: set tw=80 shiftwidth=2 softtabstop=2 tabstop=2 expandtab
