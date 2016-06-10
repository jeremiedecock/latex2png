# Latex2png

Copyright (c) 2008,2011,2016 Jeremie DECOCK (http://www.jdhp.org)

- Web site: <http://www.jdhp.org/projects_en.html>
- Source code: <https://github.com/jeremiedecock/latex2png>
- Issue tracker: <https://github.com/jeremiedecock/latex2png/issues>

## Description

Converts  LaTeX listings to PNG graphics (useful to create mathematical
formulas as images).

## Usage

    latex2png TEX_FILE

    latex2png [OPTION]

## Options

    -h, --help
          display this help and exit

    -v, --version
          output version information and exit

## Example

Given a example.tex file like this:

    \documentclass{minimal}
    \begin{document}
    $$
        \int_a^b f(x)dx\,
    $$
    \end{document}

you can convert it to PNG graphics using:

    latex2png example.tex

See documentation directory (usually /usr/share/doc/latex2png) for more
examples.

## Reporting bugs

To search for bugs or report them, please use the latex2png bug tracker at
<https://github.com/jeremiedecock/latex2png/issues>

## Copyright

Latex2png is distributed under the [MIT License](http://opensource.org/licenses/MIT).
