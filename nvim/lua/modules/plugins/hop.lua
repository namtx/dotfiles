local hop = require('hop')
local directions = require('hop.hint').HintDirection
local u = require('utils')

hop.setup()

u.map('n', 'f', "<cmd>:HopChar1AC<cr>")
u.map('n', 'F', "<cmd>:HopChar1BC<cr>")
u.map('n', 't', "<cmd>:HopChar2AC<cr>")
u.map('n', 'T', "<cmd>:HopChar2BC<cr>")


