" executable scripts need interpetter path (opt-j opt-k)
:inoremap ∆˚ #!/usr/bin/env python<cr>"""<cr>"""<cr><cr>

" if __name__ == \"__main__\" block (µ is opt+m)
:inoremap µµ if __name__ == "__main__":<cr>main()

" pdb
:inoremap ππ import pdb; pdb.set_trace()

" file attrs (opt-f opt-f)
:inoremap ƒƒ __author__ = "Alijah O'Connor"<cr>__copyright__ = "Copyright 2020, ArcherDX"<cr>__credits__ = ["Alijah O'Connor"]<cr>__maintainer__ = "Alijah O'Connor"<cr>__email__ = "aoconnor@archerdx.com"<cr>

" python function
:inoremap ∆def def fxn():<cr>"""<cr>"""<cr>pass<up><up><up><left><left><left><ESC>
