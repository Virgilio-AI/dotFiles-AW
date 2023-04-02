"""create-notebook.py
   Creates a minimal jupyter notebook (.ipynb)
   Usage: create-notebook <notebook>
"""
import sys
from notebook import transutils as _
from notebook.services.contents.filemanager import FileContentsManager as FCM

try:
    notebook_fname = sys.argv[1]
except IndexError:
    print("Usage: create-notebook <notebook>")
    exit()

notebook_fname += '.sync.ipynb'  # ensure .ipynb suffix is added
FCM().new(path=notebook_fname)
