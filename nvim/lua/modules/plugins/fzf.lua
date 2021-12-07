local u = require('utils')
local actions = require('fzf-lua.actions')

require('fzf-lua').setup {
  files = {
    previewer         = "bat",
    prompt            = 'Files❯ ',
    cmd               = "fd . --type f",
    git_icons         = true,
    file_icons        = true,
    color_icons       = true,
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      ["alt-q"]       = actions.file_sel_to_qf,
    }
  },
  git = {
    files = {
      prompt          = 'GitFiles❯ ',
      cmd             = 'git ls-files --exclude-standard',
      git_icons       = true,
      file_icons      = true,
      color_icons     = true,
    },
    status = {
      prompt        = 'GitStatus❯ ',
      cmd           = "git status -s",
      previewer     = "git_diff",
      file_icons    = true,
      git_icons     = true,
      color_icons   = true,
    },
    commits = {
      prompt          = 'Commits❯ ',
      cmd             = "git log --pretty=oneline --abbrev-commit --color",
      preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
      actions = {
        ["default"] = actions.git_checkout,
      },
    },
    branches = {
      prompt          = 'Branches❯ ',
      cmd             = "git branch --all --color",
      preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
      actions = {
        ["default"] = actions.git_switch,
      },
    },
  }
}

u.map('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<cr>")
u.map('n', '<leader>bb', "<cmd>lua require('fzf-lua').buffers()<cr>")
u.map('n', '<leader>gg', "<cmd>lua require('fzf-lua').git_files()<cr>")
u.map('n', '<leader>gs', "<cmd>lua require('fzf-lua').git_status()<cr>")
u.map('n', '<leader>gc', "<cmd>lua require('fzf-lua').git_commits()<cr>")
u.map('n', '<leader>gb', "<cmd>lua require('fzf-lua').git_branches()<cr>")
u.map('n', '<leader>hh', "<cmd>lua require('fzf-lua').oldfiles()<cr>")
u.map('n', '<leader>rg', "<cmd>lua require('fzf-lua').live_grep()<cr>")
u.map('n', '<leader>rrg', "<cmd>lua require('fzf-lua').live_grep_resume()<cr>")
u.map('n', 'ffl', "<cmd>lua require('fzf-lua').quickfix()<cr>")
u.map('n', '<leader>pf', "<cmd>lua require('fzf-lua').grep_cword()<cr>")
