let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Programming/dndd
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Programming/dndd/\*.cc
badd +49 ~/Programming/dndd/comment.cc
badd +1 ~/Programming/dndd/comment.h
badd +1 ~/Programming/dndd/conndata.h
badd +172 ~/Programming/dndd/conndata.cc
badd +40 ~/Programming/dndd/votepopup.cc
badd +1 ~/Programming/dndd/votepopup.h
badd +16 ~/Programming/dndd/commentpopup.cc
badd +1 ~/Programming/dndd/commentpopup.h
badd +1 ~/Programming/dndd/follow.cc
badd +1 ~/Programming/dndd/follow.hpp
badd +62 ~/Programming/dndd/join.cc
badd +1 ~/Programming/dndd/join.h
badd +53 ~/Programming/dndd/main.cc
badd +1 ~/Programming/dndd/main.h
badd +225 ~/Programming/dndd/mainform.cc
badd +1 ~/Programming/dndd/mainform.h
badd +1 ~/Programming/dndd/member.h
badd +19 ~/Programming/dndd/member.cc
badd +1 ~/Programming/dndd/mysqlboard.h
badd +1 ~/Programming/dndd/mysqlboard.cc
badd +1 ~/Programming/dndd/mysqlmember.h
badd +1 ~/Programming/dndd/mysqlmember.cc
badd +1 ~/Programming/dndd/mysqlvote.h
badd +1 ~/Programming/dndd/mysqlvote.cc
badd +1 ~/Programming/dndd/manual.html
badd +25 ~/Programming/dndd/install.sql
badd +1 ~/Programming/dndd/newbook.h
badd +37 ~/Programming/dndd/newbook.cc
badd +1 ~/Programming/dndd/util.h
badd +1 ~/Programming/dndd/util.cc
badd +1 ~/Programming/dndd/vote.h
badd +1 ~/Programming/dndd/vote.cc
badd +1 ~/Programming/dndd/licence.html
badd +1 ~/Programming/dndd/interface.h
badd +13 ~/Programming/dndd/Makefile
badd +1 ~/Programming/dndd/mysqlquery.h
badd +1 ~/Programming/dndd/mysqlquery.cc
badd +1 ~/Programming/dndd/tutorial.html
badd +1 ~/Programming/dndd/mysqldata.cc
badd +1 ~/Programming/dndd/mysqldata.h
argglobal
silent! argdel *
set stal=2
edit ~/Programming/dndd/follow.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 36 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 52 + 91) / 182)
exe '2resize ' . ((&lines * 36 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 128 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 13 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 0
wincmd w
argglobal
edit ~/Programming/dndd/follow.hpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe '1resize ' . ((&lines * 36 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 52 + 91) / 182)
exe '2resize ' . ((&lines * 36 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 128 + 91) / 182)
tabedit ~/Programming/dndd/mysqlboard.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 88 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 92 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 48 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
normal! 05|
wincmd w
argglobal
edit ~/Programming/dndd/mysqlboard.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((17 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 032|
wincmd w
exe 'vert 1resize ' . ((&columns * 88 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 92 + 91) / 182)
tabedit ~/Programming/dndd/mysqldata.h
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 87 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 94 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
wincmd w
argglobal
edit ~/Programming/dndd/mysqldata.cc
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 22 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 021|
wincmd w
exe 'vert 1resize ' . ((&columns * 87 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 94 + 91) / 182)
tabedit ~/Programming/dndd/mysqlmember.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit ~/Programming/dndd/mysqlmember.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
tabedit ~/Programming/dndd/mysqlvote.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 91 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 90 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 102 - ((30 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
102
normal! 040|
wincmd w
argglobal
edit ~/Programming/dndd/mysqlvote.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 017|
wincmd w
exe 'vert 1resize ' . ((&columns * 91 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 90 + 91) / 182)
tabedit ~/Programming/dndd/vote.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 19 - ((18 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
wincmd w
argglobal
edit ~/Programming/dndd/vote.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 90 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 182)
tabedit ~/Programming/dndd/Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 12 - ((11 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 076|
tabedit ~/Programming/dndd/mysqlquery.cc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 72 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 109 + 91) / 182)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 57 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
57
normal! 0
wincmd w
argglobal
edit ~/Programming/dndd/mysqlquery.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 72 + 91) / 182)
exe 'vert 2resize ' . ((&columns * 109 + 91) / 182)
tabnext 7
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
