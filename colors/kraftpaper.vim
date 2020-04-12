" https://colordesigner.io/#fcd894-94b8fc-b8fc94-FC826A-000000
" https://colordesigner.io/#f4f1de-0f0f14-000000-000000-000000
"
highlight clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="kraftpaper"

" Palette

let s:palette = {
              \ 'bg': {},
              \ 'fg': {}, 
              \ 'grey': [],
              \ 'base': {},
              \ 'accent1': {},
              \ 'accent2': {},
              \ 'accent3': {}
              \ }

let s:palette.bg._       = "#0F0F14"
let s:palette.bg.t1      = "#212125"
let s:palette.bg.t2      = "#303035"
let s:palette.bg.t3      = "#3f3f46"
let s:palette.bg.s1      = "#111113"
let s:palette.bg.s2      = "#101011"
let s:palette.bg.s3      = "#0e0e10"

let s:palette.fg._       = "#F4F1DE"
let s:palette.fg.t1      = "#e7e6dc"
let s:palette.fg.t2      = "#e8e8df"
let s:palette.fg.t3      = "#eae9e1"
let s:palette.fg.s1      = "#d9d7c8"
let s:palette.fg.s2      = "#cccab7"
let s:palette.fg.s3      = "#c0bea5"

let s:palette.grey    = [
      \ "#17171A",
      \ "#29292e",
      \ "#3b3b43",
      \ "#4d4d57",
      \ "#5f5f6c",
      \ "#717180",
      \ "#858593",
      \ "#9999a5",
      \ "#adadb7",
      \ "#c2c2c9"
      \]

let s:palette.base._  = "#FCD894"
let s:palette.base.t1 = "#fde2af"
let s:palette.base.t2 = "#feecca"
let s:palette.base.t3 = "#fef5e4"
let s:palette.base.s1 = "#f9b533"
let s:palette.base.s2 = "#c38105"
let s:palette.base.s3 = "#614103"

let s:palette.accent1._   = "#94b8fc"
let s:palette.accent1.t1  = "#afcafd"
let s:palette.accent1.t2  = "#cadbfe"
let s:palette.accent1.t3  = "#e4edfe"
let s:palette.accent1.s1  = "#3377f9"
let s:palette.accent1.s2  = "#0547c3"
let s:palette.accent1.s3  = "#032361"

let s:palette.accent2._   = "#b8fc94"
let s:palette.accent2.t1  = "#cafdaf"
let s:palette.accent2.t2  = "#dbfeca"
let s:palette.accent2.t3  = "#edfee4"
let s:palette.accent2.s1  = "#77f933"
let s:palette.accent2.s2  = "#47c305"
let s:palette.accent2.s3  = "#236103"

let s:palette.accent3._   = "#FC826A"
let s:palette.accent3.t1  = "#fda18f"
let s:palette.accent3.t2  = "#fec1b5"
let s:palette.accent3.t3  = "#fee0da"
let s:palette.accent3.s1  = "#fa3812"
let s:palette.accent3.s2  = "#af2004"
let s:palette.accent3.s3  = "#581002"


let s:style = {
  \ "n": "NONE",
  \ "b": "bold",
  \ "i": "italic",
  \ "u": "underline"
  \ }

" Helper function that builds final collor string
" input   (HEX):    fg, bg, [style]
" output  (STRING): guifg=fg guibg=bg [gui=style]
function s:build_color(fg, bg, ...)
  let l:guifg = "guifg=" . a:fg
  let l:guibg = "guibg=" . a:bg
  let l:space = " "

  if a:0 == "1"
    let l:gui = "gui=" . a:1  " style
  else
    let l:gui = ""
  endif

  return
    \   l:guifg . l:space
    \.  l:guibg . l:space
    \.  l:gui
endfunction
"echo s:build_color(s:palette.fg, s:palette.bg) 


" help highlight-groups
exe "hi! ColorColumn "    .s:build_color(s:palette.fg._, s:palette.grey[0])
"exe "hi! Conceal " .s:build_color()
"exe "hi! Cursor " .s:build_color(s:style.n, s:palette.fg)
exe "hi! CursorColumn "   .s:build_color(s:style.n, s:palette.grey[0])
exe "hi! CursorLine "     .s:build_color(s:style.n, s:palette.grey[0])
exe "hi! Directory "      .s:build_color(s:palette.base.t1, s:style.n)

exe "hi! DiffAdd "        .s:build_color(s:style.n, s:palette.accent2.s3)
exe "hi! DiffChange "     .s:build_color(s:style.n, s:palette.accent2.s3)
exe "hi! DiffDelete "     .s:build_color(s:style.n, s:palette.accent3.s3)
exe "hi! DiffText "       .s:build_color(s:palette.bg._, s:palette.base.s1, s:style.b .",". s:style.i)

exe "hi! EndOfBuffer "    .s:build_color(s:style.n, s:palette.bg._)
"exe "hi! TermCursor "    .s:build_color()
"exe "hi! TermCursorNC"   .s:build_color()
exe "hi! ErrorMsg "       .s:build_color(s:style.n, s:palette.accent3.s3)
exe "hi! VertSplit "      .s:build_color(s:palette.grey[0], s:palette.fg._)
exe "hi! Folded "         .s:build_color(s:palette.accent2._, s:palette.grey[0], s:style.i)
exe "hi! FoldColumn "     .s:build_color(s:style.n, s:palette.grey[0], s:style.i)
exe "hi! SignColumn "     .s:build_color(s:style.n, s:palette.grey[0], s:style.i)

"exe "hi! IncSearch "       .s:build_color()
"exe "hi! Substitute "      .s:build_color()
exe "hi! LineNr "         .s:build_color(s:palette.grey[2], s:palette.bg._)
exe "hi! CursorLineNr "   .s:build_color(s:palette.base.t1, s:palette.bg._, s:style.b)
exe "hi! MatchParen "     .s:build_color(s:palette.fg._, s:palette.bg._, s:style.b)

exe "hi! ModeMsg "        .s:build_color(s:palette.base._, s:style.n)
exe "hi! MoreMsg "        .s:build_color(s:palette.base._, s:style.n)
"exe "hi! MsgArea "        .s:build_color()
exe "hi! NonText "        .s:build_color(s:palette.grey[1], s:style.n)
exe "hi! Normal "         .s:build_color(s:palette.fg._, s:palette.bg._)
exe "hi! NormalFloat "    .s:build_color(s:palette.fg._, s:palette.grey[0])
exe "hi! Pmenu "          .s:build_color(s:palette.fg._, s:palette.grey[0])
exe "hi! PmenuSel "       .s:build_color(s:palette.bg._, s:palette.base._)
exe "hi! PmenuSbar "      .s:build_color(s:style.n, s:palette.grey[1])
exe "hi! PmenuThumb "     .s:build_color(s:style.n, s:palette.grey[2])

exe "hi! Question "       .s:build_color(s:palette.bg._, s:palette.base._)
exe "hi! QuestionFixLine ".s:build_color(s:palette.bg._, s:palette.base._)
exe "hi! Search "         .s:build_color(s:palette.bg._, s:palette.base._, s:style.b)
exe "hi! SpecialKey "     .s:build_color(s:palette.grey[2], s:style.n) 

exe "hi! SpellBad "       .s:build_color(s:palette.accent3.t1, s:palette.bg._, s:style.u)
exe "hi! SpellCap "       .s:build_color(s:palette.accent1.t1, s:palette.bg._, s:style.u)
exe "hi! SpellLocal "     .s:build_color(s:palette.accent2.t1, s:palette.bg._, s:style.u)
exe "hi! SpellRare "      .s:build_color(s:palette.accent3.t1, s:palette.bg._, s:style.u)

exe "hi! StatusLine "     .s:build_color(s:palette.grey[0], s:palette.fg._)
exe "hi! StatusLineNC "   .s:build_color(s:palette.grey[0], s:palette.fg._)

exe "hi! TabLine "        .s:build_color(s:palette.fg._, s:palette.grey[1], s:style.n)
"exe "hi! TabLineFill "    .s:build_color(s:style.n, s:palette.grey[1])
"exe "hi! TabLineSell "    .s:build_color(s:palette.fg._, s:palette.grey[1])

exe "hi! Title "          .s:build_color(s:palette.base._, s:style.n)

exe "hi! Visual "         .s:build_color(s:style.n, s:palette.grey[1])
"exe "hi! VisualNos "      .s:build_color(s:style.n, s:palette.grey[2])

exe "hi! WarningMsg "     .s:build_color(s:palette.accent3._, s:style.n)


" help group-name
exe "hi! Comment "        .s:build_color(s:palette.grey[6], s:style.n, s:style.i)
exe "hi! Constant "       .s:build_color(s:palette.base._, s:style.n)
exe "hi! String "         .s:build_color(s:palette.base._, s:style.n, s:style.i)
exe "hi! Character "      .s:build_color(s:palette.base.s1, s:style.n, s:style.i)
exe "hi! Number "         .s:build_color(s:palette.base.t1, s:style.n, s:style.i)
exe "hi! Boolean "        .s:build_color(s:palette.accent2._, s:style.n, s:style.i)
exe "hi! Float "          .s:build_color(s:palette.base.t2, s:style.n, s:style.i)

exe "hi! Identifier "     .s:build_color(s:palette.fg._, s:style.n)
exe "hi! Function "       .s:build_color(s:palette.accent1.t2, s:style.n)

exe "hi! Statement "      .s:build_color(s:palette.base.s1, s:style.n, s:style.b .",". s:style.i)

exe "hi! PreProc "        .s:build_color(s:palette.accent2.t1, s:style.n)

exe "hi! Type "           .s:build_color(s:palette.base._, s:style.n)

exe "hi! Special "        .s:build_color(s:palette.accent2._, s:style.n)



"exe "hi! Directory"      .s:build_color()

