" Name: mylib.vim
" Desc: This my useful vim function library.
" Auth: ishbguy
" Date: 2016-01-11 22:49:11

" MyChangeFormat(): This function can used to change the fileformat
" platform: Specify the target platform fileformat to change.
function! MyChangeFormat(platform)
	if a:platform == "unix"
		set fileformat=unix
		set fileencoding=utf-8
	elseif a:platform == "win"
		set fileformat=dos
		set fileencoding=cp936
	else
		echo "No such platform."
	endif
endfunction

" MyReverseLine(): This function can be used to reverse the select lines.
function! MyReverseLine() range
	" Get the first and last line number
	let linefirst = a:firstline
	let linelast = a:lastline
	" Calculate the sum lines and the middle line number.
	let linesum = linelast - linefirst + 1
	let linemid = (linefirst + linelast) / 2
	" Temperarily setting the linemid + 1 as the linemid
	let linemid1 = linemid
	" Odd-even line numbers check.
	" if linesum is a even number, let linemid1 plus 1
	if !(linesum % 2)
		let linemid1 =  linemid1 + 1
	endif
	let mycount = linemid - linefirst
	" Reverse lines
	for n in range(0, mycount)
		let linestr1 = getline(linemid - n)
		let linestr2 = getline(linemid1 + n)
		call setline(linemid - n, linestr2)
		call setline(linemid1 + n, linestr1)
	endfor
endfunction

" MyReverseLine8Shell(): This function can be used to reverse the select lines by
"                        shell CMD
function! MyReverseLine8Shell() range
	" Get the first and last line number
	let linefirst = a:firstline
	let linelast = a:lastline
	let linerange = linefirst . ", " . linelast
	execute linerange . '!tac'
endfunction

" MyInsertLineNumber(): This function is used to insert the line number in the
"                       beginning of a line.
function! MyInsertLineNumber() range
	let linefirst = a:firstline
	let linelast = a:lastline
	let linerange = linefirst . ', ' . linelast
	execute linerange . 's/^/\=line(".") . " "/g'
endfunction

" MyNumberLine(): This function is used to number the line which match the
"                 pattern.
function! MyNumberLine(pat) range
	let linefirst = a:firstline
	let linelast = a:lastline
	let linerange = linefirst . ', ' . linelast
	let mypattern = ''
	if a:pat == ''
		let mypattern = '.*'
	else
		let mypattern = '.*' . a:pat . '.*'
	endif
	"Count the matching line
	let n = 1
	execute linerange . 'global/' . mypattern . '/ s//\=n . " " . getline(".")/g | let n = n + 1'
endfunction

" MySortIP8Shell(): This function is used to sort the IPv4 with its 4 columns by
"                   shell CMD.
function! MySortIP8Shell() range
	let linefirst = a:firstline
	let linelast = a:lastline
	let linerange = linefirst . ', ' . linelast
	"Use the shell cmd sort to sort the select line, but this is not portable to
	"other platform, just aviable in *nix
	execute linerange . '!sort -t"." -k1,1n -k2,2n -k3,3n -k4,4n'
endfunction

" MyLineXColumn(): This function is used to exchange the line and column.
function! MyLineXColumn() range
	let linefirst = a:firstline
	let linelast = a:lastline
	"Make a list by line 1 and get the column number.
	let mylist = split(getline(linefirst))
	let columnlast = len(mylist)
	"Subsitute the the tab with newline, then make a the line become the column.
	execute "%s/\t/\r/g"
	for linecount in range(1, linelast - 1)
		for columncount in range(linefirst, columnlast)
			let tmpstr = getline(columncount) . "\t" . getline(columncount + linecount * columnlast)
			call setline(columncount, tmpstr)
		endfor
	endfor
	execute columnlast + 1. ',$d'
endfunction

" MyMatrix2Column(): This function change the matrix become a column.
function! MyMatrix2Column() range
    "the line range  must + 1
	for lineindex in range(1, a:lastline - a:firstline + 1)
		let mylist = split(getline(lineindex + a:firstline - 1))
        "list start from 0, so - 1
        let columns = len(mylist) - 1
		call setline(lineindex + a:firstline - 1, mylist[0])
		for columnindex in range(1, columns)
			call append(a:lastline + lineindex * columnindex - 1, mylist[columnindex])
		endfor
	endfor
endfunction

"MyStr2List(): Changing the string to list by specify the spliter.
function! MyStr2List(MyString, MySpilter)
	let mystr = a:MyString
	let myspilt = a:MySpilter
	let mycount = 0
	let mystart = 0
	let mylist = []
	while  stridx(mystr, myspilt, mystart) != -1
		let mycount = stridx(mystr, myspilt, mystart)
		let mylist += [mystr[mystart : mycount - 1]]
		let mystart = mycount + 1
	endwhile
	let mylist += [mystr[mystart : ]]
	return mylist
endfunction

"MyReadIncPath(): This function can read the the pathfile which has prj, src,
"                 inc 3 line.
function! MyReadIncPath(pathfile)
	if ! filereadable(a:pathfile)
		return ""
	endif
	"Read the pathfile by cat to become a vim list
	let mylist = systemlist("cat " . a:pathfile)
	let mydict = {}
	let mylen = len(mylist)
	"Check out how many prj a list has.
	let prjnum = mylen / 3
	"Make a list become a dictionary by.
	for round in range(prjnum)
		execute "call extend(mydict, {\"" . 
					\ mylist[round * 3 + 0][4:] . "\":{\"src\":\"" .
					\ mylist[round * 3 + 1][4:] . "\",\"inc\":\"" . 
					\ mylist[round * 3 + 2][4:] . "\"}})"
	endfor
	return mydict
endfunction

"MyToggleMouse(): Toggle the mouse on/off
let g:MyToggleMouse = 0
function! MyToggleMouse()
	if g:MyToggleMouse == 1
		let g:MyToggleMouse = 0
		set mouse=
	else
		let g:MyToggleMouse = 1
		set mouse=a
	endif
endfunction

"MyQuickfixToggle(): This function is used to toggle to show the quickfix
"window.
let g:MyToggleQf = 0
function! MyQuickfixToggle()
	let qflist = getqflist()
	let qflen = len(qflist)
    let winno = getqflist({'winid':1})
    let winflag = len(winno)
	if qflen
		if g:MyToggleQf == 1
			let g:MyToggleQf = 0
			cwindow
            if winflag
                quit
            endif
		else
			let g:MyToggleQf = 1
			cwindow
		endif
	endif
endfunction

"MyReplace(): Repalce the string in all buffers.
"confirm：    confirm before replacing
"wholeword：  repalce the whole word or not
"replace：    the replacing word
function! MyReplace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

"MyHelp(): Quick help by myself.
function! MyHelp(feat)
	let addit = ''
	if a:feat == 1
		let addit = expand("<cword>") . '()'
	elseif a:feat == 2
		let addit = ':' . expand("<cword>")
	elseif a:feat == 3
		setlocal iskeyword+=-
		let addit = substitute(expand("<cword>"), '[Cc]', 'CTRL', '')
		setlocal iskeyword-=-
	else
		let addit = expand("<cword>")
	endif
	exe 'help ' . addit
endfunction

"Function to convert the format of the quickfix make list
"function QfMakeConv()
"   let qflist = getqflist()
"   for i in qflist
"	  let i.text = iconv(i.text, "cp936", "utf-8")
"   endfor
"   call setqflist(qflist)
"endfunction
"au QuickfixCmdPost make call QfMakeConv()

"SID(): Get the SID
"  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
"endfun

"MyToggleDrawIt()
let g:MyToggleDrawIt = 0
function! MyToggleDrawIt()
    if g:MyToggleDrawIt == 0
        DIstart
        let g:MyToggleDrawIt = 1
    else
        DIstop
        let g:MyToggleDrawIt = 0
    endif
endfunction

"function! MyShip()
"    normal gg
"    while line(".") != line("$")
"        let lassadd = 0
"        let lassline = line("$")
"        normal 0f:lyw
"        exe 'g/^\<' . getreg() . '\>/co ' . line(".")
"        let lassadd = line("$") - lassline
"        if lassadd
"            exe 'normal ' . lassadd . '>>'
"            exe 'normal ' . lassadd . 'j'
"        else
"            normal j
"        endif
"    endwhile
"endfunction
function! MyShift(Shift)
    normal gg
    let LeadString = '\s\s\s\s'
    let SearchPart = '\v[^:]\w+$'

    for Round in range(0, a:Shift-1)
        let SearchLine = '\w'
        let Time = Round
        while Time
            let SearchLine = LeadString . SearchLine
            let Time -= 1
        endwhile
        let PreLine = 0
        while line(".") >= PreLine
            let LassAdd = 0
            let LassLine = line("$")
            let PreLine = line(".")
            call search('\v^' . SearchLine)
            call search(SearchPart)
            normal yw
            exe 'g/^\<' . getreg() . '\>/co ' . line(".")
            let LassAdd = line("$") - LassLine
            if LassAdd
                for shift in range(0,Round)
                    exe 'normal ' . LassAdd . '>>'
                endfor
            endif
        endwhile
    endfor
    normal gg

endfunction

fun! ToggleFullscreen()
    if has("gui_running")
        call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    elseif $DISPLAY != ""
        call system("wmctrl -ir " . $WINID . " -b toggle,fullscreen")
    endif
endf
