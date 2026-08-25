return {

  -- ╭─────────────────────────────────────────╮
  -- │ POWERLINE / SEPARATORS                  │
  -- ╰─────────────────────────────────────────╯

  powerline = {

    -- Single arrows / separators
    right = "",
    left = "",
    right_thin = "",
    left_thin = "",

    -- Rounded ends
    round_left = "",
    round_right = "",

    -- Curved / rounded variants
    round_left_alt = "",
    round_right_alt = "",
    round_left_thin = "",
    round_right_thin = "",

    -- Slanted / diagonal
    slant_right = "",
    slant_left = "",

    -- Powerline branch / line
    branch = "",
    branch_alt = "",

    -- Line / fill characters
    line = "",
    line_left = "",
    line_right = "",

    -- Extra powerline symbols
    lock = "",
    column = "",
    column_alt = "",
    column_alt2 = "",
    column_alt3 = "",
    column_alt4 = "",
    column_alt5 = "",
    column_alt6 = "",
    column_alt7 = "",
    column_alt8 = "",
    column_alt9 = "",
    column_alt10 = "",
    column_alt11 = "",
    column_alt12 = "",
    column_alt13 = "",
    column_alt14 = "",
    column_alt15 = "",
    column_alt16 = "",
    column_alt17 = "",
    column_alt18 = "",
    column_alt19 = "",
    column_alt20 = "",
    column_alt21 = "",
    column_alt22 = "",
    column_alt23 = "",
    column_alt24 = "",
    column_alt25 = "",
    column_alt26 = "",
    column_alt27 = "",
    column_alt28 = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ POWERLINE EXTRA / BRANCHES / GIT       │
  -- ╰─────────────────────────────────────────╯

  git = {

    branch = "",
    branch_alt = "",

    commit = "",
    commit_alt = "",

    tag = "",
    tag_alt = "",

    merge = "",
    merge_alt = "",

    pull = "",
    pull_alt = "",

    repo = "",

    added = "✚",
    modified = "",
    removed = "✖",
    renamed = "󰁕",
    untracked = "",
    ignored = "",
    unstaged = "󰄱",
    staged = "󰱒",
    conflict = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ ARROWS                                  │
  -- ╰─────────────────────────────────────────╯

  arrows = {

    left = "←",
    right = "→",
    up = "↑",
    down = "↓",

    left_big = "󰁍",
    right_big = "󰁔",
    up_big = "󰁝",
    down_big = "󰁆",

    left_double = "󰁍",
    right_double = "󰁔",

    chevron_left = "‹",
    chevron_right = "›",

    chevron_left_big = "❮",
    chevron_right_big = "❯",

    triangle_left = "◀",
    triangle_right = "▶",

    triangle_up = "▲",
    triangle_down = "▼",

    caret_left = "",
    caret_right = "",
    caret_up = "",
    caret_down = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ FILE / FOLDER                           │
  -- ╰─────────────────────────────────────────╯

  files = {

    file = "󰈙",
    file_text = "",
    file_code = "",

    folder = "󰉋",
    folder_open = "󰝰",
    folder_closed = "",

    folder_empty = "",
    folder_empty_open = "",

    symlink = "",
    symlink_dir = "",

    tree = "󰙅",
    directory = "",

    search = "",
    find = "󰍉",

    save = "",
    close = "",
    delete = "",

    new_file = "",
    new_folder = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ EDITOR / BUFFER                         │
  -- ╰─────────────────────────────────────────╯

  editor = {

    buffer = "󰈚",
    buffers = "󰓩",

    modified = "●",
    readonly = "",
    locked = "󰌾",

    terminal = "",
    command = "",

    insert = "",
    normal = "",
    visual = "󰒉",

    cursor = "",

    diagnostics = "󰒡",
    error = "",
    warning = "",
    info = "",
    hint = "󰌵",

    line = "",
    column = "",

    position = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ LSP                                     │
  -- ╰─────────────────────────────────────────╯

  lsp = {

    lsp = "󰒋",
    language_server = "",

    code = "",
    code_action = "󰌵",

    diagnostic = "󰒡",

    error = "",
    warning = "",
    info = "",
    hint = "󰌵",

    reference = "󰈇",
    definition = "󰳽",
    implementation = "󰡱",

    type = "󰜁",
    method = "󰆧",
    field = "󰜢",
    property = "󰜢",
    variable = "󰀫",
    constant = "󰏿",

    class = "󰠱",
    interface = "",
    enum = "",
    struct = "󰙅",

    function = "󰊕",
    constructor = "",

    module = "󰏗",
    namespace = "󰌗",

    keyword = "󰌋",
    snippet = "",
    text = "󰉿",
    value = "󰎠",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ STATUSLINE                              │
  -- ╰─────────────────────────────────────────╯

  statusline = {

    mode = "",

    normal = "",
    insert = "",
    visual = "󰒉",
    replace = "󰛔",
    command = "",
    terminal = "",

    branch = "",

    file = "󰈙",
    folder = "󰉋",

    modified = "●",
    readonly = "",

    position = "",
    column = "",

    percent = "%",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ DIAGNOSTICS                             │
  -- ╰─────────────────────────────────────────╯

  diagnostics = {

    error = "",
    warning = "",
    info = "",
    hint = "󰌵",

    error_alt = "",
    warning_alt = "",
    info_alt = "",
    hint_alt = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ UI                                      │
  -- ╰─────────────────────────────────────────╯

  ui = {

    close = "",
    close_circle = "󰅖",

    check = "",
    check_circle = "",

    plus = "",
    minus = "",

    dot = "•",
    dot_small = "·",
    circle = "○",
    circle_filled = "●",

    square = "□",
    square_filled = "■",

    bullet = "•",

    separator = "│",
    separator_thin = "│",

    vertical = "│",
    horizontal = "─",

    corner_tl = "╭",
    corner_tr = "╮",
    corner_bl = "╰",
    corner_br = "╯",

    box_tl = "┌",
    box_tr = "┐",
    box_bl = "└",
    box_br = "┘",

    menu = "",
    settings = "",
    gear = "",

    help = "󰋖",
    info = "",

    lock = "",
    unlock = "",

    eye = "",
    eye_off = "",

    notification = "",
    bell = "󰂚",

    clock = "󰥔",
    calendar = "",

    cpu = "",
    memory = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ TERMINAL                                │
  -- ╰─────────────────────────────────────────╯

  terminal = {

    terminal = "",
    shell = "",
    command = "",

    bash = "",
    zsh = "",
    fish = "󰈺",

    linux = "",
    ubuntu = "",
    debian = "",
    arch = "󰣇",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ LANGUAGE / FILETYPE                     │
  -- ╰─────────────────────────────────────────╯

  languages = {

    lua = "",
    javascript = "",
    typescript = "",
    javascript_react = "",
    typescript_react = "",

    html = "",
    css = "",
    scss = "",

    json = "",
    yaml = "",
    toml = "",

    markdown = "",

    python = "",
    rust = "",
    go = "",

    c = "",
    cpp = "",
    csharp = "󰌛",

    java = "",
    kotlin = "",

    php = "",

    bash = "",
    shell = "",

    docker = "",

    git = "",
    gitignore = "",

    vim = "",

    sql = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ TREE / NEO-TREE                         │
  -- ╰─────────────────────────────────────────╯

  tree = {

    folder = "",
    folder_open = "",
    folder_empty = "",

    expanded = "",
    collapsed = "",

    indent = "│",
    branch = "├",
    branch_last = "└",

    branch_thick = "┣",
    branch_last_thick = "┗",

    horizontal = "─",

    modified = "●",
    added = "✚",
    deleted = "✖",
    untracked = "",

    symlink = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ GIT                                     │
  -- ╰─────────────────────────────────────────╯

  git_extra = {

    git = "",
    branch = "",

    ahead = "↑",
    behind = "↓",

    added = "+",
    removed = "-",
    modified = "~",

    staged = "✓",
    unstaged = "●",

    conflict = "",

    stash = "󰏗",
    cherry_pick = "",
    rebase = "",
  },


  -- ╭─────────────────────────────────────────╮
  -- │ MISC                                    │
  -- ╰─────────────────────────────────────────╯

  misc = {

    rocket = "󰀵",
    package = "󰏖",
    plugin = "󰐱",

    code = "",
    bug = "",

    database = "",
    server = "󰒋",
    web = "󰖟",

    network = "󰖩",
    wifi = "󰖩",

    battery = "󰁹",
    battery_full = "󰁹",
    battery_low = "󰂃",

    sun = "󰖙",
    moon = "󰖔",

    keyboard = "",
    mouse = "󰍽",

    user = "",
    users = "",

    home = "",

    trash = "",

    link = "",
    unlink = "",

    external = "",

    download = "",
    upload = "",
  },
}
