== TODO ==

- [ ] Rewrite the latex2png script to use the new "standalone" document class like in docs/examples: the script should now only take the content inside \begin{document}...\end{document} as argument or in stdin (e.g. latex2png "\int_a^b f(x)dx"), otherwise the script is useless...
- [ ] Generate SVG and PDF too (rename the project ?)
- [ ] Use getopt to parse options (--font-size=SIZE, --help and --version)
- [ ] Print latex errors except if '-q' is set
