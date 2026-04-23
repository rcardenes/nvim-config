# Redone for nvim 0.12

I recently upgraded nvim to 0.12 and decided to jump boats to vim.pack
(used to go the Lazy.nvim way).

Still in the process of incorporating everything, but at the moment it's
functional.

## Important Note:

If you migrate to nvim 0.12, particularly if you start your config from
scratch, you might find that editing lua files raise a number treesitter
related errors. These will disappear as soon as the nvim-tresitter plugin
is installed. I'm not sure if this chicken-and-egg problem is intended, or
I missed something, but just don't freak out if it happens.

### Acknowledgements

In the past I hadn't paid much attention to the whole config, so this time
I decided to follow a more step-by-step and detailed instructions guide,
to get a better idea of what's going on.

This time I followed Duy NG's [My Journey from IDEs to Neovim](https://tduyng.com/blog/my-neovim-story)
to setup the basics and some of the plugins. The blog starts talking about
the background and motivation for moving into Neovim. If you're not interested
in that part, skip straight to [part 2](https://tduyng.com/blog/neovim-basic-setup)
for the config itself.
