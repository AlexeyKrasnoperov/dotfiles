if has("gui_macvim")
  set guifont=Monaco:h13
  set stal=2 " turn on tabs by default
elseif has("gui_gtk2")
  set guifont=Monaco\ 12
elseif has("x11")
elseif has("gui_win32")
end

set anti " Antialias font

" Default size of window
set columns=179
set lines=50

" Color
color twilight

" Load bash init file
set shell=/bin/bash
set shellcmdflag=-ic

" TODO move this code to separate file
"if filereadable(expand("./vim/tabheadings.vim"))
  "source ./vim/tabheadings.vim
"endif
" Tab headings
function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '*' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '*'
            break
        endif
    endfor

    " Append the buffer name (not full path)
    return label . "%t"
endfunction
set gtl=%!GuiTabLabel() gtt=%F

