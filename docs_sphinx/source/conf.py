# ============================================================
# Configuration file for the Sphinx documentation builder
# ============================================================

# --- Imports ------------------------------------------------
from recommonmark.parser import CommonMarkParser

# --- Project Information -----------------------------------
project = "Data Engineering Template"
copyright = "2025, rakshak-soni"
author = "rakshak-soni"

# --- Extensions --------------------------------------------
extensions = [
    "myst_parser",  # Modern Markdown support
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx.ext.viewcode",
]

# --- Source Parsers ----------------------------------------
source_parsers = {
    ".md": CommonMarkParser,
}

source_suffix = {
    ".rst": "restructuredtext",
    ".md": "markdown",
}

myst_enable_extensions = ["colon_fence", "deflist", "linkify", "smartquotes"]

templates_path = ["_templates"]
exclude_patterns = []

# --- HTML Output -------------------------------------------
html_theme = "sphinx_rtd_theme"
html_static_path = ["_static"]
