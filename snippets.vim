" executable scripts need interpetter path
:inoremap ∆env #!/usr/bin/env python<cr>

" if __name__ == \"__main__\" block
:inoremap ∆main if __name__ == "__main__":<cr>

" pdb
:inoremap ∆pdb import pdb; pdb.set_trace()

" file attrs
:inoremap ∆file __author__ = "Alijah O'Connor"<cr>__copyright__ = "Copyright 2019, ArcherDX"<cr>__credits__ = ["Alijah O'Connor"]<cr>__maintainer__ = "Alijah O'Connor"<cr>__email__ = "aoconnor@archerdx.com"<cr>

" alijah
:inoremap ∆alijah Alijah O'Connor

" log
:inoremap ∆log # Get root logger<cr>_logger = logging.getLogger(__name__)

" python function
:inoremap ∆def def fxn():<cr>"""<cr>"""<cr>pass<up><up><up><left><left><left><ESC>

"queries
:inoremap ∆""" def """<cr>"""<up><cr>
