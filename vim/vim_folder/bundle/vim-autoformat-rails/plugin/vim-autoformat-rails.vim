function! AutoFormatRails()
  "Save cursor position
  let l:winview = winsaveview()

  "CSS/JS fixes that must run before indentation
  if expand('%:e') == 'css' || expand('%:e') == 'scss' || expand('%:e') == 'js'
    "Close } on separate line unless single-line style
    %s/\({.*\)\@<!}/\r}/e

    "Remove all empty lines before }
    %s/\(^\s*\n\)\+\s*}/}/e
  endif

  "Remove trailing whitespace
  %s/\s\+$//e

  "Perform indentation
  norm gg=G

  "Remove blank lines after a comma
  %s/,\n\n*/,\r/e

  "Don't allow more than 3 consecutive newlines
  %s/\n\n\n\n*/\r\r\r/e

  "Ruby-file fixes
  if expand('%:e') == 'rb'
    "Remove extra lines after 'do'
    %s/ do\(\s*|.*|\)\n\n*/ do\1\r/e
    %s/ do\n\n*/ do\r/e

    "Remove extra lines after 'def'
    %s/^\(\s*def \)\(.*\)\n\n*/\1\2\r/e

    "Insert two newlines after any 'end'
    %s/end\n\n*/end\r\r/eI

    "Remove all newlines before 'end'
    %s/^\n*\( *\)end/\1end/eI

    "Remove extra lines after 'if'
    %s/^\(\s*if \)\(.*\)\n\n*/\1\2\r/e

    "Remove all newlines before 'else'
    %s/^\n*\( *\)else/\1else/e
  endif

  "ERB-fixes
  if expand('%:e') == 'erb'
    "Always have one space after '<%=', '<%#', '<%-', or '<%'
    %s/<%\([=#-]\?\)\s*/<%\1 /e

    "Always have one space before '-%>' or '%>'
    %s/\s*\(-\?\)%>/ \1%>/e
  endif

  "Cucumber-file fixes
  if expand('%:e') == 'feature'
    "Standard indentation for scenarios
    %s/\n*  Scenario/\r\r  Scenario/e

    "Standard indentation for scenarios
    %s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/e
  endif

  "CSS/JS fixes
  if expand('%:e') == 'css' || expand('%:e') == 'scss' || expand('%:e') == 'js'
    "Always insert { character on same line as declaration
    %s/\(\w\)\n*\s*{/\1 {/e

    "Remove empty newlines after {
    %s/{\n\n*/{\r/e

    "Insert a return character after all }
    %s/\}\(;?\)\n*/}\1\r/e

    "Insert a second return character between } and other styles
    %s/\}\(;\)\n*\(\s*[a-z#\.&\*\@]\)/}\1\r\r\2/e
  end

  "CSS-only fixes
  if expand('%:e') == 'css' || expand('%:e') == 'scss'
    "Insert a space after all non-selector colons
    %s/\s*:\s*\(.*\)\s*;/: \1;/e

    "Always remove spaces before selector colons
    %s/\(\w*:\)\s*\(hover\|src\|first\|nth\|last\|link\|visited\|before\)/\1\2/e

    "Add a space above comment lines
    %s/\([;}]\)\n\(\s*\)\/\([\/\*]\)/\1\r\r\2\/\3/e
  endif

  "Remove trailing newlines
  %s/\n*\%$//e

  "Remove highlighting
  nohls

  "Restore cursor position
  call winrestview(l:winview)
endfunction

" Call AutoFormat by typing \==
map <silent> <LocalLeader>== :silent call AutoFormatRails()<CR>
