"При копировании добавить в иксовый буфер
nmap yy yy:silent .w !xclip
vmap y y:silent '<,'> w !xclip

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

"Настройки табов для Python, согласно рекоммендациям
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе

"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1

"Включаем 256 цветов в терминале
set t_Co=256

"Автокомплит по Tab
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
 endfunction
 inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
 inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"Показываем все полезные опции автокомплита сразу
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"вместо Tab по умолчанию (на табе автокомплит)
let g:snippetsEmu_key = "<C-j>"

" Копи/паст по Ctrl+C/V
" vmap <C-C> "+yi
" imap <C-V> "+gPi

syntax on "Включить подсветку синтаксиса

set nu "Включаем нумерацию строк

set mousehide "Спрятать курсор мыши когда набираем текст

set mouse=a "Включить поддержку мыши

set termencoding=utf-8 "Кодировка терминала

set novisualbell "Не мигать

set t_vb= "Не пищать!

"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]

"Отключить черточки на табах
set showtabline=0

"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

"Переносим на другую строчку, разрываем строки
set wrap
set linebreak

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile

" Кодировка файлов по умолчанию
set encoding=utf-8

" Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251
set fileencodings=utf8,cp1251 

" По <F2> сохранение изменений
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>

" установить шрифт Courier New Cyr
set guifont=courier_new:h10:cRUSSIAN

" настраиваю для работы с русскими словами (чтобы w, b, * понимали русские слова)
set iskeyword=@,48-57,_,192-255
