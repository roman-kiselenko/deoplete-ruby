from .base import Base

class Source(Base):
    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'ruby'
        self.mark = '[rb]'
        self.filetypes = ['ruby']
        self.input_pattern = r'\W*'
        # self.debug_enabled = True
        self.rank = 500

    def on_event(self, context):
        if context['filetype'] == 'ruby' and context['event'] == 'BufWinEnter':
            self.vim.call('deopleteruby#build_cache')
            return

    def gather_candidates(self, context):
        return self.vim.call('deopleteruby#gather_candidates', context['input'], context['complete_position'], context['filetype'])
