"  vim-hackernews
"  --------------
"  Browse Hacker News (news.ycombinator.com) inside Vim.
"
"  Author:  ryanss <ryanssdev@icloud.com>
"  Website: https://github.com/ryanss/vim-hackernews
"  License: MIT (see LICENSE file)
"  Version: 0.1.1

function! s:NextSection(backwards)
	let pattern = '\(^ *\d\+\. .\|^\s*Comment\)'
	" go to end of matching word
	let flags = 'e'
	if a:backwards
		let dir = '?'
	else
		let dir = '/'
	endif
	execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

noremap o :python hacker_news_link()<cr>
noremap O :python hacker_news_link(external=True)<cr>

map [[ :call <SID>NextSection(1)<CR>
map ]] :call <SID>NextSection(0)<CR>
