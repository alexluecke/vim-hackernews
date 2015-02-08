"  vim-hackernews
"  --------------
"  Browse Hacker News (news.ycombinator.com) inside Vim.
"
"  Author:  ryanss <ryanssdev@icloud.com>
"  Website: https://github.com/ryanss/vim-hackernews
"  License: MIT (see LICENSE file)
"  Version: 0.1.1


if !has('python')
    echo "HackerNews.vim Error: Requires Vim compiled with +python"
    finish
endif


" Import Python code
execute "python import sys"
execute "python sys.path.append('" . expand("<sfile>:p:h") . "')"
execute "python from hackernews import hacker_news, hacker_news_link"


command! HackerNews python hacker_news()


au! BufRead,BufNewFile *.hackernews set filetype=hackernews

function! s:NextSection(backwards)

	" go to end of matching word
	let flags = 'e'

	let pattern = '^ *\d\+\. .'

	if a:backwards
		let dir = '?'
	else
		let dir = '/'
	endif

	execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

au FileType hackernews map [[ :call <SID>NextSection(1)<CR>
au FileType hackernews map ]] :call <SID>NextSection(0)<CR>
