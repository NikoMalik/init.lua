" ====================================================================================
" JetBrains-inspired Color Scheme (Helix port)
" ====================================================================================

" === Initialization =================================================================

highlight clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let g:colors_name = "jetbrains"
set background=dark


let s:palette = {}

" Reds
let s:palette.red179 = "#b3ae60"
let s:palette.red194 = "#c29e4a"
let s:palette.red199 = "#c77dbb"
let s:palette.red207 = "#cf8e6d"
let s:palette.red213 = "#d5b778"
let s:palette.red214 = "#d64d5b"

" Greens
let s:palette.green130 = "#5f826b"
let s:palette.green145 = "#549159"
let s:palette.green156 = "#499c54"
let s:palette.green171 = "#6aab73"

" Blues
let s:palette.blue34  = "#1e1f22"
let s:palette.blue46  = "#26282e"
let s:palette.blue48  = "#2b2d30"
let s:palette.blue50  = "#2d2e32"
let s:palette.blue56  = "#313438"
let s:palette.blue64  = "#293c40"
let s:palette.blue81  = "#4d4e51"
let s:palette.blue89  = "#4b5059"
let s:palette.blue110 = "#2e436e"
let s:palette.blue122 = "#6f737a"
let s:palette.blue131 = "#214283"
let s:palette.blue133 = "#7a7e85"
let s:palette.blue145 = "#868a91"
let s:palette.blue171 = "#A1A3AB"
let s:palette.blue173 = "#375fad"
let s:palette.blue184 = "#2aacb8"
let s:palette.blue196 = "#bcbec4"
let s:palette.blue214 = "#ced0d6"
let s:palette.blue245 = "#56a8f5"
let s:palette.blue247 = "#57aaf7"

" Black
let s:palette.black = "#000000"

" === Helper Function ================================================================

function! s:h(group, guifg, guibg, gui, guisp)
  " Skip if all parameters are empty
  if a:guifg == "" && a:guibg == "" && a:gui == "" && a:guisp == ""
    return
  endif

  let cmd = "highlight " . a:group
  if a:guifg != ""
    let cmd .= " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd .= " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd .= " gui=" . a:gui
  endif
  if a:guisp != ""
    let cmd .= " guisp=" . a:guisp
  endif
  execute cmd
endfunction

" === Base Highlights ================================================================

" Editor UI
call s:h("Normal", s:palette.blue196, s:palette.blue34, "", "")
call s:h("NormalFloat", s:palette.blue196, s:palette.blue48, "", "")
call s:h("NormalNC", s:palette.blue196, s:palette.blue34, "", "")

" Cursor and Lines
call s:h("Cursor", s:palette.black, s:palette.blue133, "", "")
call s:h("CursorLine", "", s:palette.blue46, "", "")
call s:h("CursorColumn", "", s:palette.blue46, "", "")
call s:h("ColorColumn", "", s:palette.blue64, "", "")

" Line Numbers
call s:h("LineNr", s:palette.blue89, "", "", "")
call s:h("CursorLineNr", s:palette.blue171, "", "", "")

" Visual Mode
call s:h("Visual", s:palette.black, s:palette.blue214, "", "")
call s:h("VisualNOS", s:palette.black, s:palette.blue214, "", "")

" Search
call s:h("Search", s:palette.blue196, s:palette.blue131, "", "")
call s:h("IncSearch", s:palette.blue196, s:palette.blue131, "", "")
call s:h("CurSearch", s:palette.blue196, s:palette.blue131, "", "")

" Status Line
call s:h("StatusLine", s:palette.blue196, s:palette.blue48, "", "")
call s:h("StatusLineNC", s:palette.blue89, s:palette.blue48, "", "")

" Tab Line
call s:h("TabLine", s:palette.blue196, s:palette.blue48, "", "")
call s:h("TabLineFill", "", s:palette.blue48, "", "")
call s:h("TabLineSel", "", s:palette.blue110, "", "")

" Popups and Menus
call s:h("Pmenu", s:palette.blue196, s:palette.blue48, "", "")
call s:h("PmenuSel", s:palette.blue196, s:palette.blue110, "", "")
call s:h("PmenuSbar", "", s:palette.blue81, "", "")
call s:h("PmenuThumb", "", s:palette.blue81, "", "")

" Signs and Gutter
call s:h("SignColumn", "", s:palette.blue34, "", "")
call s:h("Folded", s:palette.blue133, s:palette.blue64, "", "")
call s:h("FoldColumn", s:palette.blue133, "", "", "")

" Splits
call s:h("VertSplit", s:palette.blue56, "", "", "")
call s:h("WinSeparator", s:palette.blue56, "", "", "")

" Other UI
call s:h("Title", s:palette.red199, "", "", "")
call s:h("Directory", s:palette.blue245, "", "", "")
call s:h("NonText", s:palette.blue122, "", "", "")
call s:h("SpecialKey", s:palette.blue122, "", "", "")
call s:h("Whitespace", s:palette.blue122, "", "", "")
call s:h("EndOfBuffer", s:palette.blue34, s:palette.blue34, "", "")

" === Syntax Highlights ==============================================================

" Comments
call s:h("Comment", s:palette.blue133, "", "", "")

" Constants
call s:h("Constant", s:palette.red207, "", "", "")
call s:h("String", s:palette.green171, "", "", "")
call s:h("Character", s:palette.green171, "", "", "")
call s:h("Number", s:palette.blue184, "", "", "")
call s:h("Boolean", s:palette.blue184, "", "", "")
call s:h("Float", s:palette.blue184, "", "", "")

" Identifiers
call s:h("Identifier", s:palette.blue245, "", "", "")
call s:h("Function", s:palette.blue245, "", "", "")

" Statements
call s:h("Statement", s:palette.red207, "", "", "")
call s:h("Conditional", s:palette.red207, "", "", "")
call s:h("Repeat", s:palette.red207, "", "", "")
call s:h("Label", s:palette.red199, "", "", "")
call s:h("Operator", s:palette.blue196, "", "", "")
call s:h("Keyword", s:palette.red207, "", "", "")
call s:h("Exception", s:palette.red207, "", "", "")

" PreProc
call s:h("PreProc", s:palette.red179, "", "", "")
call s:h("Include", s:palette.red207, "", "", "")
call s:h("Define", s:palette.red207, "", "", "")
call s:h("Macro", s:palette.red179, "", "", "")
call s:h("PreCondit", s:palette.red207, "", "", "")

" Types
call s:h("Type", s:palette.red207, "", "", "")
call s:h("StorageClass", s:palette.red207, "", "", "")
call s:h("Structure", s:palette.red207, "", "", "")
call s:h("Typedef", s:palette.red207, "", "", "")

" Special
call s:h("Special", s:palette.red213, "", "", "")
call s:h("SpecialChar", s:palette.red199, "", "", "")
call s:h("Tag", s:palette.red213, "", "", "")
call s:h("Delimiter", s:palette.blue196, "", "", "")
call s:h("SpecialComment", s:palette.green130, "", "", "")
call s:h("Debug", s:palette.red194, "", "", "")

" Other
call s:h("Underlined", s:palette.blue247, "", "underline", "")
call s:h("Ignore", "", "", "", "")
call s:h("Error", s:palette.red214, "", "underline", s:palette.red214)
call s:h("Todo", s:palette.blue196, s:palette.blue110, "", "")

" === Diff ===========================================================================

call s:h("DiffAdd", "", s:palette.green145, "", "")
call s:h("DiffChange", "", s:palette.blue173, "", "")
call s:h("DiffDelete", "", s:palette.blue145, "", "")
call s:h("DiffText", "", s:palette.blue173, "", "")

" Git Signs
call s:h("Added", s:palette.green145, "", "", "")
call s:h("Changed", s:palette.blue145, "", "", "")
call s:h("Removed", s:palette.blue145, "", "", "")

" === Diagnostics ====================================================================

call s:h("DiagnosticError", s:palette.red214, "", "", "")
call s:h("DiagnosticWarn", s:palette.red194, "", "", "")
call s:h("DiagnosticInfo", s:palette.blue247, "", "", "")
call s:h("DiagnosticHint", s:palette.green156, "", "", "")

call s:h("DiagnosticUnderlineError", "", "", "undercurl", s:palette.red214)
call s:h("DiagnosticUnderlineWarn", "", "", "undercurl", s:palette.red194)
call s:h("DiagnosticUnderlineInfo", "", "", "undercurl", s:palette.blue247)
call s:h("DiagnosticUnderlineHint", "", "", "undercurl", s:palette.green156)

call s:h("DiagnosticVirtualTextError", s:palette.red214, s:palette.blue50, "", "")
call s:h("DiagnosticVirtualTextWarn", s:palette.red194, s:palette.blue50, "", "")
call s:h("DiagnosticVirtualTextInfo", s:palette.blue247, s:palette.blue50, "", "")
call s:h("DiagnosticVirtualTextHint", s:palette.green156, s:palette.blue50, "", "")

" === Markdown =======================================================================

call s:h("markdownHeadingDelimiter", s:palette.red207, "", "", "")
call s:h("markdownH1", s:palette.red199, "", "italic", "")
call s:h("markdownH2", s:palette.red199, "", "italic", "")
call s:h("markdownH3", s:palette.red199, "", "italic", "")
call s:h("markdownH4", s:palette.red199, "", "italic", "")
call s:h("markdownH5", s:palette.red199, "", "italic", "")
call s:h("markdownH6", s:palette.red199, "", "italic", "")
call s:h("markdownListMarker", s:palette.red207, "", "", "")
call s:h("markdownBold", "", "", "bold", "")
call s:h("markdownItalic", "", "", "italic", "")
call s:h("markdownCode", "", s:palette.blue64, "", "")
call s:h("markdownCodeBlock", "", s:palette.blue64, "", "")
call s:h("markdownLinkText", s:palette.blue247, "", "underline", "")
call s:h("markdownUrl", s:palette.blue247, "", "underline", "")

" === TreeSitter =====================================================================

if has('nvim-0.8')
  " Misc
  call s:h("@comment", s:palette.blue133, "", "", "")
  call s:h("@comment.documentation", s:palette.green130, "", "", "")
  call s:h("@error", s:palette.red214, "", "", "")
  call s:h("@none", "", "", "", "")
  call s:h("@preproc", s:palette.red179, "", "", "")
  call s:h("@define", s:palette.red207, "", "", "")
  call s:h("@operator", s:palette.blue196, "", "", "")

  " Punctuation
  call s:h("@punctuation.delimiter", s:palette.blue196, "", "", "")
  call s:h("@punctuation.bracket", s:palette.blue196, "", "", "")
  call s:h("@punctuation.special", s:palette.blue196, "", "", "")

  " Literals
  call s:h("@string", s:palette.green171, "", "", "")
  call s:h("@string.documentation", s:palette.green130, "", "", "")
  call s:h("@string.regex", s:palette.green171, "", "", "")
  call s:h("@string.escape", s:palette.red199, "", "", "")
  call s:h("@string.special", s:palette.green171, "", "", "")
  call s:h("@character", s:palette.green171, "", "", "")
  call s:h("@character.special", s:palette.red199, "", "", "")
  call s:h("@boolean", s:palette.blue184, "", "", "")
  call s:h("@number", s:palette.blue184, "", "", "")
  call s:h("@float", s:palette.blue184, "", "", "")

  " Functions
  call s:h("@function", s:palette.blue245, "", "", "")
  call s:h("@function.call", s:palette.blue245, "", "", "")
  call s:h("@function.builtin", s:palette.red207, "", "", "")
  call s:h("@function.macro", s:palette.red179, "", "", "")
  call s:h("@method", s:palette.blue245, "", "", "")
  call s:h("@method.call", s:palette.blue245, "", "", "")
  call s:h("@constructor", s:palette.blue245, "", "", "")
  call s:h("@parameter", s:palette.red199, "", "", "")

  " Keywords
  call s:h("@keyword", s:palette.red207, "", "", "")
  call s:h("@keyword.function", s:palette.red207, "", "", "")
  call s:h("@keyword.operator", s:palette.red207, "", "", "")
  call s:h("@keyword.return", s:palette.red207, "", "", "")
  call s:h("@conditional", s:palette.red207, "", "", "")
  call s:h("@repeat", s:palette.red207, "", "", "")
  call s:h("@debug", s:palette.red194, "", "", "")
  call s:h("@label", s:palette.red199, "", "", "")
  call s:h("@include", s:palette.red207, "", "", "")
  call s:h("@exception", s:palette.red207, "", "", "")

  " Types
  call s:h("@type", s:palette.red207, "", "", "")
  call s:h("@type.builtin", s:palette.red207, "", "", "")
  call s:h("@type.qualifier", s:palette.red207, "", "", "")
  call s:h("@type.definition", s:palette.red207, "", "", "")
  call s:h("@storageclass", s:palette.red207, "", "", "")
  call s:h("@attribute", s:palette.red213, "", "", "")
  call s:h("@field", s:palette.red199, "", "", "")
  call s:h("@property", s:palette.red199, "", "", "")

  " Identifiers
  call s:h("@variable", s:palette.blue196, "", "", "")
  call s:h("@variable.builtin", s:palette.red207, "", "", "")
  call s:h("@constant", s:palette.red207, "", "", "")
  call s:h("@constant.builtin", s:palette.red207, "", "", "")
  call s:h("@constant.macro", s:palette.red207, "", "", "")
  call s:h("@namespace", s:palette.blue196, "", "", "")
  call s:h("@symbol", s:palette.red199, "", "", "")

  " Text
  call s:h("@text", s:palette.blue196, "", "", "")
  call s:h("@text.strong", "", "", "bold", "")
  call s:h("@text.emphasis", "", "", "italic", "")
  call s:h("@text.underline", "", "", "underline", "")
  call s:h("@text.strike", "", "", "strikethrough", "")
  call s:h("@text.title", s:palette.red199, "", "italic", "")
  call s:h("@text.literal", s:palette.green171, "", "", "")
  call s:h("@text.uri", s:palette.blue247, "", "underline", "")
  call s:h("@text.math", s:palette.blue184, "", "", "")
  call s:h("@text.environment", s:palette.red207, "", "", "")
  call s:h("@text.environment.name", s:palette.red213, "", "", "")
  call s:h("@text.reference", s:palette.blue247, "", "", "")

  " Tags
  call s:h("@tag", s:palette.red213, "", "", "")
  call s:h("@tag.attribute", s:palette.blue196, "", "", "")
  call s:h("@tag.delimiter", s:palette.blue196, "", "", "")
endif

" === LSP Semantic Tokens ============================================================

if has('nvim-0.9')
  call s:h("@lsp.type.class", s:palette.red207, "", "", "")
  call s:h("@lsp.type.comment", s:palette.blue133, "", "", "")
  call s:h("@lsp.type.decorator", s:palette.red213, "", "", "")
  call s:h("@lsp.type.enum", s:palette.red199, "", "", "")
  call s:h("@lsp.type.enumMember", s:palette.red207, "", "", "")
  call s:h("@lsp.type.function", s:palette.blue245, "", "", "")
  call s:h("@lsp.type.interface", s:palette.red207, "", "", "")
  call s:h("@lsp.type.macro", s:palette.red179, "", "", "")
  call s:h("@lsp.type.method", s:palette.blue245, "", "", "")
  call s:h("@lsp.type.namespace", s:palette.blue196, "", "", "")
  call s:h("@lsp.type.parameter", s:palette.red199, "", "", "")
  call s:h("@lsp.type.property", s:palette.red199, "", "", "")
  call s:h("@lsp.type.struct", s:palette.red207, "", "", "")
  call s:h("@lsp.type.type", s:palette.red207, "", "", "")
  call s:h("@lsp.type.typeParameter", s:palette.red207, "", "", "")
  call s:h("@lsp.type.variable", s:palette.blue196, "", "", "")
endif

" === Plugin Support =================================================================

" GitSigns
call s:h("GitSignsAdd", s:palette.green145, "", "", "")
call s:h("GitSignsChange", s:palette.blue145, "", "", "")
call s:h("GitSignsDelete", s:palette.blue145, "", "", "")

" Telescope
call s:h("TelescopeBorder", s:palette.blue56, "", "", "")
call s:h("TelescopePromptBorder", s:palette.blue56, "", "", "")
call s:h("TelescopeResultsBorder", s:palette.blue56, "", "", "")
call s:h("TelescopePreviewBorder", s:palette.blue56, "", "", "")
call s:h("TelescopeSelection", "", s:palette.blue110, "", "")
call s:h("TelescopeMatching", s:palette.blue247, "", "bold", "")

" NvimTree
call s:h("NvimTreeFolderName", s:palette.blue196, "", "", "")
call s:h("NvimTreeOpenedFolderName", s:palette.blue245, "", "", "")
call s:h("NvimTreeRootFolder", s:palette.blue247, "", "bold", "")
call s:h("NvimTreeGitDirty", s:palette.red194, "", "", "")
call s:h("NvimTreeGitNew", s:palette.green156, "", "", "")
call s:h("NvimTreeGitDeleted", s:palette.red214, "", "", "")

" WhichKey
call s:h("WhichKey", s:palette.blue247, "", "", "")
call s:h("WhichKeyGroup", s:palette.red199, "", "", "")
call s:h("WhichKeyDesc", s:palette.blue196, "", "", "")
call s:h("WhichKeySeparator", s:palette.blue133, "", "", "")

" === Terminal Colors ================================================================

if has('nvim')
  let g:terminal_color_0  = s:palette.blue34
  let g:terminal_color_1  = s:palette.red214
  let g:terminal_color_2  = s:palette.green156
  let g:terminal_color_3  = s:palette.red213
  let g:terminal_color_4  = s:palette.blue245
  let g:terminal_color_5  = s:palette.red199
  let g:terminal_color_6  = s:palette.blue184
  let g:terminal_color_7  = s:palette.blue196
  let g:terminal_color_8  = s:palette.blue122
  let g:terminal_color_9  = s:palette.red214
  let g:terminal_color_10 = s:palette.green171
  let g:terminal_color_11 = s:palette.red194
  let g:terminal_color_12 = s:palette.blue247
  let g:terminal_color_13 = s:palette.red199
  let g:terminal_color_14 = s:palette.blue184
  let g:terminal_color_15 = s:palette.blue214
endif

" === Cleanup ========================================================================

set background=dark
