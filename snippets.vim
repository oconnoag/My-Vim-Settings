" executable scripts need interpetter path (opt-j opt-k)
:inoremap ∆˚ #!/usr/bin/env python<cr>"""<cr>"""<cr><cr>

" if __name__ == \"__main__\" block (µ is opt+m)
:inoremap µµ if __name__ == "__main__":<cr>main()

" pdb (opt+p opt+p)
:inoremap ππ import ipdb; ipdb.set_trace()

" file attrs (opt-f opt-f)
:inoremap ƒƒ __author__ = "Alijah O'Connor"<cr>__copyright__ = "Copyright 2021, Invitae"<cr>__credits__ = ["Alijah O'Connor"]<cr>__maintainer__ = "Alijah O'Connor"<cr>__email__ = "alijah.oconnor@invitae.com"<cr>

" python function
:inoremap def<cr> def fxn():<cr>"""<cr>"""<cr>pass<up><up><up><left><left><left><ESC>

" python class
:inoremap cls<cr> class asdf(object):<cr>"""<cr>"""<cr><cr>def __init__(self):<cr>	"""<cr>"""<cr>pass<up><up><up><up><up><up><up><left><left><left><left><left><ESC>

" python function
:inoremap † #TODO:<space><space>

" cpp default template
:inoremap çç #include <iostream><cr><cr>int main(int argc, char *argv[]) {<cr><cr>}<up><tab>return 0;
