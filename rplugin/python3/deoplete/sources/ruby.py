from .base import Base
import json
import os

class Source(Base):
    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'ruby'
        self.mark = '[ruby]'
        self.filetypes = ['ruby']
        self.input_pattern = r'\.\w*'
        self.debug_enabled = True

    def on_event(self, context):
        global cache_candidates
        scr_dir = os.path.dirname(__file__)
        with open(os.path.join(scr_dir, 'source.json')) as data_file:    
            cache_candidates = json.load(data_file)
        return

    def gather_candidates(self, context):
        return cache_candidates
