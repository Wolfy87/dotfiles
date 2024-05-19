(local utils (require :astrocore))
(local uu (require :dotfiles.util))

[(uu.tx
   :clojure-vim/vim-jack-in
   {:ft :clojure
    :cmd :Clj
    :lazy true})

 (uu.tx
   :williamboman/mason-lspconfig.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [:clojure_lsp])))})

 (uu.tx
   :Olical/conjure
   {:dev (uu.dev? :conjure)
    :init (fn []
            (set vim.g.conjure#eval#result_register "*")
            (set vim.g.conjure#log#botright true)
            (set vim.g.conjure#mapping#doc_word "gk")
            (set vim.g.conjure#client#clojure#nrepl#refresh#backend "clj-reload")

            (vim.api.nvim_create_autocmd
              :FileType
              {:callback (fn []
                           (set vim.bo.commentstring ";; %s"))
               :desc "Lisp style line comment"
               :group (vim.api.nvim_create_augroup :comment_config
                                                   {:clear true})
               :pattern [:clojure]}))})

 (uu.tx :Olical/AnsiEsc {:dev (uu.dev? :AnsiEsc)})
 (uu.tx :PaterJason/cmp-conjure
        {:dependencies [:Olical/conjure]})]
