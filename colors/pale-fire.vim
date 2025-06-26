 " pale-fire.vim -- Neovim color scheme.
" Author:      Adapted from matklad/pale-fire (https://github.com/matklad/pale-fire)
" Description: Port of VS Code Pale Fire theme, an Emacs-inspired Zenburn variation
" Last Change: 2025-06-26

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "pale-fire"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    " Core editor colors
    hi Normal ctermbg=237 ctermfg=188 cterm=NONE guibg=#3F3F3F guifg=#DCDCCC gui=NONE
    hi NormalNC ctermbg=236 ctermfg=188 cterm=NONE guibg=#383838 guifg=#DCDCCC gui=NONE
    hi NonText ctermbg=NONE ctermfg=244 cterm=NONE guibg=NONE guifg=#8C8C8C gui=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=244 cterm=NONE guibg=NONE guifg=#8C8C8C gui=NONE
    hi LineNr ctermbg=237 ctermfg=244 cterm=NONE guibg=#3F3F3F guifg=#8C8C8C gui=NONE
    hi CursorLineNr ctermbg=237 ctermfg=152 cterm=NONE guibg=#3F3F3F guifg=#93E0E3 gui=NONE
    hi CursorLine ctermbg=236 ctermfg=NONE cterm=NONE guibg=#383838 guifg=NONE gui=NONE
    hi CursorColumn ctermbg=236 ctermfg=NONE cterm=NONE guibg=#383838 guifg=NONE gui=NONE
    hi Cursor ctermbg=252 ctermfg=NONE cterm=NONE guibg=#DCDCCC guifg=NONE gui=NONE
    hi Visual ctermbg=239 ctermfg=NONE cterm=NONE guibg=#4F4F4F guifg=NONE gui=NONE
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
    hi VertSplit ctermbg=234 ctermfg=234 cterm=NONE guibg=#3A3A3A guifg=#3A3A3A gui=NONE

    " Syntax highlighting
    hi Comment ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#7F9F7F gui=NONE
    hi Constant ctermbg=NONE ctermfg=181 cterm=NONE guibg=NONE guifg=#DCA3A3 gui=NONE
    hi String ctermbg=NONE ctermfg=174 cterm=NONE guibg=NONE guifg=#CC9393 gui=NONE
    hi Identifier ctermbg=NONE ctermfg=188 cterm=NONE guibg=NONE guifg=#DCDCCC gui=NONE
    hi Statement ctermbg=NONE ctermfg=223 cterm=NONE guibg=NONE guifg=#F0DFAF gui=bold
    hi PreProc ctermbg=NONE ctermfg=110 cterm=NONE guibg=NONE guifg=#94BFF3 gui=NONE
    hi Type ctermbg=NONE ctermfg=152 cterm=NONE guibg=NONE guifg=#93E0E3 gui=NONE
    hi Special ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#7F9F7F gui=NONE
    hi Underlined ctermbg=NONE ctermfg=152 cterm=underline guibg=NONE guifg=#93E0E3 gui=underline
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi Error ctermbg=NONE ctermfg=174 cterm=reverse guibg=NONE guifg=#CC9393 gui=reverse

    " UI elements
    hi Pmenu ctermbg=239 ctermfg=188 cterm=NONE guibg=#4F4F4F guifg=#DCDCCC gui=NONE
    hi PmenuSel ctermbg=223 ctermfg=236 cterm=NONE guibg=#F0DFAF guifg=#383838 gui=NONE
    hi PmenuSbar ctermbg=241 ctermfg=NONE cterm=NONE guibg=#5F5F5F guifg=NONE gui=NONE
    hi PmenuThumb ctermbg=223 ctermfg=223 cterm=NONE guibg=#F0DFAF guifg=#F0DFAF gui=NONE
    hi StatusLine ctermbg=241 ctermfg=236 cterm=NONE guibg=#5F5F5F guifg=#383838 gui=NONE
    hi StatusLineNC ctermbg=239 ctermfg=244 cterm=NONE guibg=#4F4F4F guifg=#8C8C8C gui=NONE
    hi TabLine ctermbg=239 ctermfg=244 cterm=NONE guibg=#4F4F4F guifg=#8C8C8C gui=NONE
    hi TabLineFill ctermbg=239 ctermfg=239 cterm=NONE guibg=#4F4F4F guifg=#4F4F4F gui=NONE
    hi TabLineSel ctermbg=223 ctermfg=236 cterm=NONE guibg=#F0DFAF guifg=#383838 gui=NONE
    hi WildMenu ctermbg=110 ctermfg=236 cterm=NONE guibg=#94BFF3 guifg=#383838 gui=NONE

    " Diff and diagnostics
    hi DiffAdd ctermbg=236 ctermfg=108 cterm=reverse guibg=#383838 guifg=#7F9F7F gui=reverse
    hi DiffChange ctermbg=236 ctermfg=182 cterm=reverse guibg=#383838 guifg=#D7AFD7 gui=reverse
    hi DiffDelete ctermbg=236 ctermfg=174 cterm=reverse guibg=#383838 guifg=#CC9393 gui=reverse
    hi DiffText ctermbg=236 ctermfg=110 cterm=reverse guibg=#383838 guifg=#94BFF3 gui=reverse
    hi DiagnosticSignError ctermbg=NONE ctermfg=174 cterm=NONE guibg=NONE guifg=#CC9393 gui=NONE
    hi DiagnosticSignWarning ctermbg=NONE ctermfg=223 cterm=NONE guibg=NONE guifg=#F0DFAF gui=NONE
    hi DiagnosticSignHint ctermbg=NONE ctermfg=152 cterm=NONE guibg=NONE guifg=#93E0E3 gui=NONE
    hi DiagnosticUnderlineError ctermbg=NONE ctermfg=174 cterm=undercurl guibg=NONE guifg=#CC9393 gui=undercurl
    hi DiagnosticUnderlineWarning ctermbg=NONE ctermfg=223 cterm=undercurl guibg=NONE guifg=#F0DFAF gui=undercurl
    hi DiagnosticUnderlineHint ctermbg=NONE ctermfg=152 cterm=undercurl guibg=NONE guifg=#93E0E3 gui=undercurl

    " Plugin-specific
    hi NvimTreeRootFolder ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#7F9F7F gui=NONE
    hi NvimTreeFolderName ctermbg=NONE ctermfg=110 cterm=NONE guibg=NONE guifg=#94BFF3 gui=NONE
    hi NvimTreeOpenedFolderName ctermbg=NONE ctermfg=181 cterm=NONE guibg=NONE guifg=#DCA3A3 gui=NONE
    hi NvimTreeExecFile ctermbg=NONE ctermfg=188 cterm=NONE guibg=NONE guifg=#DCDCCC gui=NONE
    hi GitSignsAdd ctermbg=237 ctermfg=108 cterm=NONE guibg=#3F3F3F guifg=#7F9F7F gui=NONE
    hi GitSignsChange ctermbg=237 ctermfg=181 cterm=NONE guibg=#3F3F3F guifg=#DCA3A3 gui=NONE
    hi GitSignsDelete ctermbg=237 ctermfg=174 cterm=NONE guibg=#3F3F3F guifg=#CC9393 gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=darkgrey ctermfg=lightgrey cterm=NONE
    hi NormalNC ctermbg=black ctermfg=lightgrey cterm=NONE
    hi NonText ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi LineNr ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi CursorLineNr ctermbg=darkgrey ctermfg=cyan cterm=NONE
    hi CursorLine ctermbg=black ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=black ctermfg=NONE cterm=NONE
    hi Cursor ctermbg=lightgrey ctermfg=NONE cterm=NONE
    hi Visual ctermbg=black ctermfg=NONE cterm=NONE
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
    hi VertSplit ctermbg=black ctermfg=darkgrey cterm=NONE
    hi Comment ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi Constant ctermbg=NONE ctermfg=red cterm=NONE
    hi String ctermbg=NONE ctermfg=darkred cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=lightgrey cterm=NONE
    hi Statement ctermbg=NONE ctermfg=yellow cterm=bold
    hi PreProc ctermbg=NONE ctermfg=blue cterm=NONE
    hi Type ctermbg=NONE ctermfg=cyan cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=cyan cterm=underline
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Error ctermbg=NONE ctermfg=darkred cterm=reverse
    hi Pmenu ctermbg=darkgrey ctermfg=lightgrey cterm=NONE
    hi PmenuSel ctermbg=yellow ctermfg=black cterm=NONE
    hi PmenuSbar ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi PmenuThumb ctermbg=yellow ctermfg=yellow cterm=NONE
    hi StatusLine ctermbg=darkgrey ctermfg=black cterm=NONE
    hi StatusLineNC ctermbg=black ctermfg=darkgrey cterm=NONE
    hi TabLine ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi TabLineFill ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi TabLineSel ctermbg=yellow ctermfg=black cterm=NONE
    hi WildMenu ctermbg=blue ctermfg=black cterm=NONE
    hi DiffAdd ctermbg=black ctermfg=green cterm=reverse
    hi DiffChange ctermbg=black ctermfg=magenta cterm=reverse
    hi DiffDelete ctermbg=black ctermfg=darkred cterm=reverse
    hi DiffText ctermbg=black ctermfg=blue cterm=reverse
    hi DiagnosticSignError ctermbg=NONE ctermfg=darkred cterm=NONE
    hi DiagnosticSignWarning ctermbg=NONE ctermfg=yellow cterm=NONE
    hi DiagnosticSignHint ctermbg=NONE ctermfg=cyan cterm=NONE
    hi DiagnosticUnderlineError ctermbg=NONE ctermfg=darkred cterm=undercurl
    hi DiagnosticUnderlineWarning ctermbg=NONE ctermfg=yellow cterm=undercurl
    hi DiagnosticUnderlineHint ctermbg=NONE ctermfg=cyan cterm=undercurl
    hi NvimTreeRootFolder ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi NvimTreeFolderName ctermbg=NONE ctermfg=blue cterm=NONE
    hi NvimTreeOpenedFolderName ctermbg=NONE ctermfg=red cterm=NONE
    hi NvimTreeExecFile ctermbg=NONE ctermfg=lightgrey cterm=NONE
    hi GitSignsAdd ctermbg=darkgrey ctermfg=darkgreen cterm=NONE
    hi GitSignsChange ctermbg=darkgrey ctermfg=red cterm=NONE
    hi GitSignsDelete ctermbg=darkgrey ctermfg=darkred cterm=NONE
endif

" Highlight group links
hi link Keyword Statement
hi link TSInclude PreProc
hi link TSType Type
hi link TSFunction PreProc
hi link TSMethod TSFunction
hi link TSFuncMacro TSFunction
hi link TSFuncBuiltin TSFunction
hi link TSRepeat Keyword
hi link TSProperty Identifier
hi link TSConstant Constant
hi link TSTagDelimiter PreProc
hi link TSTag Keyword
hi link TSOperator Keyword
hi link TSKeywordOperator Keyword
hi link TSKeywordFunction Keyword
hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Label Statement
hi link Macro PreProc
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Typedef Type
hi link htmlTagName Statement
hi link htmlEndTag htmlTagName
hi link htmlLink PreProc
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link htmlArg htmlTagName
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic PreProc
hi link asciidocQuotedEmphasized PreProc
hi link diffBDiffer Error
hi link diffCommon Error
hi link diffDiffer Error
hi link diffIdentical Error
hi link diffIsA Error
hi link diffNoEOL Error
hi link diffOnly Error
hi link diffRemoved Error
hi link diffAdded String
hi link QuickFixLine Visual

" Terminal ANSI colors
let g:terminal_ansi_colors = [
    \ '#1E2320',
    \ '#D78787',
    \ '#60B48A',
    \ '#DFAF8F',
    \ '#506070',
    \ '#DC8CC3',
    \ '#8CD0D3',
    \ '#6C6C6C',
    \ '#709080',
    \ '#DCA3A3',
    \ '#C3BF9F',
    \ '#F0DFAF',
    \ '#94BFF3',
    \ '#EC93D3',
    \ '#93E0E3',
    \ '#FFFFFF'
    \ ] 
