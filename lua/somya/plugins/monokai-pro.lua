return {
-- Monokai Pro theme with multiple filters: Pro, Classic, Machine, Octagon,
-- Ristretto, Spectrum.
{
  'loctvl842/monokai-pro.nvim',
   lazy = false,
   priority = 1000,
   opts = {
     filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
     styles = {
       comment = { italic = true },
       keyword = { italic = false }, -- any other keyword
       type = { italic = false }, -- (preferred) int, long, char, etc
       storageclass = { italic = false }, -- static, register, volatile, etc
       structure = { italic = false }, -- struct, union, enum, etc
       parameter = { italic = false }, -- parameter pass in function
       annotation = { italic = false },
       tag_attribute = { italic = false }, -- attribute of tag in reactjs
     },
     plugins = {
       bufferline = {
         underline_selected = false,
         underline_visible = false,
       },
       indent_blankline = {
         context_highlight = 'pro', -- default | pro
         context_start_underline = false,
       },
     },
   },
},
}
