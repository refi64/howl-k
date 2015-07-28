print = print

howl.aux.lpeg_lexer ->
  c = capture

  comment_func = (sub, pos) -> pos == 2 or sub[pos-2] == '\n'

  ident = alpha^1 * (alpha + digit + '_')^0

  identifer = c 'identifer', ident

  comment = c 'comment', (Cmt('/', comment_func) + '/ ') * scan_until eol

  keyword = c 'keyword', '_' * (alpha + digit + '_')^2 + word {
    'if', 'while', 'do'
  }

  operator = c 'operator', S"+-*%|&^!<>=~@?,#$.:()[]{}/\\';"

  string = c 'string', span '"', '"', '\\'

  special = c 'special', '_' * alpha

  constant = c 'constant', '`' * (alpha + S'._')^0

  number = c 'number', ('0' * S'NnIi' + digit^1) * ('.' * digit^1)^0 * ('e' * digit^1)^-1

  any {
    comment
    keyword
    special
    constant
    number
    identifer
    operator
    string
  }
