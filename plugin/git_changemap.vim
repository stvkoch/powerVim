" git_changemap.vim - A minimap sidebar showing git changes across the file
" Shows a condensed bird's-eye view: + added, ~ modified, - deleted

let g:changemap_width = get(g:, 'changemap_width', 3)
let g:changemap_show_git_changes = get(g:, 'changemap_show_git_changes', 1)
let g:changemap_enabled = 0

" Define highlight groups for git changes in the map
highlight default ChangeMapAdd    ctermfg=2 guifg=#2ea043 ctermbg=NONE guibg=NONE
highlight default ChangeMapChange ctermfg=3 guifg=#d29922 ctermbg=NONE guibg=NONE
highlight default ChangeMapDelete ctermfg=1 guifg=#f85149 ctermbg=NONE guibg=NONE

function! s:GetHunks()
  if !exists('*GitGutterGetHunks')
    return []
  endif
  return GitGutterGetHunks()
endfunction

" Build a list of per-line change types from gitgutter hunks
function! s:BuildChangeList(total_lines)
  let changes = {}
  if !g:changemap_show_git_changes
    return changes
  endif
  let hunks = s:GetHunks()
  for hunk in hunks
    " hunk format: [from_start, from_count, to_start, to_count]
    let start = hunk[2]
    let count = hunk[3]
    let removed = hunk[1]
    if count == 0
      " pure deletion at this line
      let changes[start] = 'd'
    elseif removed == 0
      " pure addition
      for i in range(start, start + count - 1)
        let changes[i] = 'a'
      endfor
    else
      " modification
      for i in range(start, start + count - 1)
        let changes[i] = 'm'
      endfor
    endif
  endfor
  return changes
endfunction

function! s:RenderMap()
  let map_buf = g:changemap_bufnr
  if !bufexists(map_buf)
    return
  endif

  let src_win = g:changemap_src_win
  if !win_id2win(src_win)
    return
  endif

  let src_buf = winbufnr(win_id2win(src_win))
  let total = line('$')
  let map_win = bufwinid(map_buf)
  if map_win == -1
    return
  endif
  let map_height = winheight(win_id2win(map_win))

  let changes = s:BuildChangeList(total)

  " Calculate how many source lines each map row represents
  let ratio = (total * 1.0) / map_height
  if ratio < 1.0
    let ratio = 1.0
  endif

  let lines = []
  for row in range(map_height)
    let src_start = float2nr(row * ratio) + 1
    let src_end = float2nr((row + 1) * ratio)
    if src_end < src_start
      let src_end = src_start
    endif

    " Check if any line in this range has changes
    let has_add = 0
    let has_mod = 0
    let has_del = 0
    for ln in range(src_start, src_end)
      if has_key(changes, ln)
        if changes[ln] == 'a'
          let has_add = 1
        elseif changes[ln] == 'm'
          let has_mod = 1
        elseif changes[ln] == 'd'
          let has_del = 1
        endif
      endif
    endfor

    if has_add
      call add(lines, ' ▐ ')
    elseif has_mod
      call add(lines, ' ▐ ')
    elseif has_del
      call add(lines, ' ▐ ')
    else
      call add(lines, '   ')
    endif
  endfor

  " Write to the map buffer
  call setbufvar(map_buf, '&modifiable', 1)
  silent! call deletebufline(map_buf, 1, '$')
  call setbufline(map_buf, 1, lines)
  call setbufvar(map_buf, '&modifiable', 0)

  " Apply highlights for git changes
  let map_winnr = win_id2win(map_win)
  let cur_win = winnr()
  execute map_winnr . 'wincmd w'
  call clearmatches()
  if g:changemap_show_git_changes
    let row_idx = 0
    for row in range(map_height)
      let src_start = float2nr(row * ratio) + 1
      let src_end = float2nr((row + 1) * ratio)
      if src_end < src_start
        let src_end = src_start
      endif
      let ln = row + 1
      for src_ln in range(src_start, src_end)
        if has_key(changes, src_ln)
          if changes[src_ln] == 'a'
            call matchaddpos('ChangeMapAdd', [ln])
            break
          elseif changes[src_ln] == 'm'
            call matchaddpos('ChangeMapChange', [ln])
            break
          elseif changes[src_ln] == 'd'
            call matchaddpos('ChangeMapDelete', [ln])
            break
          endif
        endif
      endfor
    endfor
  endif
  execute cur_win . 'wincmd w'

  " Sync cursor position indicator
  call s:SyncCursor()
endfunction

function! s:SyncCursor()
  if !g:changemap_enabled || !exists('g:changemap_bufnr')
    return
  endif
  let map_buf = g:changemap_bufnr
  let map_win = bufwinid(map_buf)
  if map_win == -1
    return
  endif
  let map_height = winheight(win_id2win(map_win))
  let total = line('$')
  let cur = line('.')
  let ratio = (total * 1.0) / map_height
  if ratio < 1.0
    let ratio = 1.0
  endif
  let map_line = float2nr((cur - 1) / ratio) + 1
  if map_line > map_height
    let map_line = map_height
  endif

  let map_winnr = win_id2win(map_win)
  let cur_win = winnr()
  execute map_winnr . 'wincmd w'
  " Clear old cursor line match and set new one
  silent! call matchdelete(get(w:, 'changemap_cursor_id', -1))
  let w:changemap_cursor_id = matchaddpos('CursorLine', [map_line])
  execute cur_win . 'wincmd w'
endfunction

function! s:Open()
  if g:changemap_enabled
    return
  endif

  let g:changemap_src_win = win_getid()

  " Create sidebar on the right
  execute 'vertical botright ' . g:changemap_width . 'new'
  let g:changemap_bufnr = bufnr('%')

  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nomodifiable
  setlocal nonumber
  setlocal norelativenumber
  setlocal signcolumn=no
  setlocal nocursorline
  setlocal nowrap
  setlocal winfixwidth
  setlocal filetype=changemap

  " Minimal appearance
  setlocal statusline=\ map
  setlocal foldcolumn=0

  " Go back to source window
  let src_winnr = win_id2win(g:changemap_src_win)
  execute src_winnr . 'wincmd w'

  let g:changemap_enabled = 1

  " Set up autocommands
  augroup ChangeMap
    autocmd!
    autocmd CursorMoved,CursorMovedI * call <SID>SyncCursor()
    autocmd BufWritePost * call timer_start(200, {-> <SID>RenderMap()})
    autocmd BufEnter * call timer_start(100, {-> <SID>RenderMap()})
    autocmd VimResized * call timer_start(100, {-> <SID>RenderMap()})
    autocmd User GitGutter call timer_start(200, {-> <SID>RenderMap()})
  augroup END

  call timer_start(300, {-> s:RenderMap()})
endfunction

function! s:Close()
  if !g:changemap_enabled
    return
  endif
  let g:changemap_enabled = 0
  augroup ChangeMap
    autocmd!
  augroup END
  if exists('g:changemap_bufnr') && bufexists(g:changemap_bufnr)
    let win = bufwinid(g:changemap_bufnr)
    if win != -1
      let winnr = win_id2win(win)
      execute winnr . 'wincmd c'
    endif
  endif
endfunction

function! s:Toggle()
  if g:changemap_enabled
    call s:Close()
    echo 'Git changemap: off'
  else
    call s:Open()
    echo 'Git changemap: ON'
  endif
endfunction

command! ChangeMapToggle call <SID>Toggle()
command! ChangeMapRefresh call <SID>RenderMap()
