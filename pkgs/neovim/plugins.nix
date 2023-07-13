{pkgs}: let
  treesitterParsers = p:
    with p; [
      tree-sitter-bash
      tree-sitter-cpp
      tree-sitter-fish
      tree-sitter-go
      tree-sitter-json
      tree-sitter-jsonc
      tree-sitter-luadoc
      tree-sitter-markdown
      tree-sitter-markdown-inline
      tree-sitter-python
      tree-sitter-query
      tree-sitter-regex
      tree-sitter-rust
      tree-sitter-toml
      tree-sitter-yaml
      tree-sitter-yuck
    ];
in
  with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins treesitterParsers)
  ]
