from .base import Base

class Source(Base):
    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'ruby'
        self.mark = '[rb]'
        self.filetypes = ['ruby']
        self.input_pattern = r'\.\w*'

    def on_event(self, context):
        self.vim.call('deopleteruby#build_cache', context['filetype'])
        return

    def gather_candidates(self, context):
        return self.vim.call('deopleteruby#gather_candidates', context['input'], context['complete_position'], context['filetype'])
