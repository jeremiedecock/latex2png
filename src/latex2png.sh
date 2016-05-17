#!/bin/sh

# Shell script to turn a LaTeX file into PNG
#
# Copyright (c) 2008,2011 Jérémie DECOCK
# Based on David Hausheer's latex2png.phps
#
# This script is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this script; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

PRGM=`basename "$0"`

# Check args ##################################################################

# Error
if [ -z "$1" -o ! -z "$2" ]
then
	cat >&2 <<EOFwrongarg
Usage: $PRGM TEX_FILE
       $PRGM [OPTION]

Options:
    -h, --help      display this help and exit
    -v, --version   output version information and exit
EOFwrongarg
	exit 1
fi

# --help
if [  "$1" = "-h" -o "$1" = "--help" ]
then
	cat >&1 <<EOFhelp
latex2png converts LaTeX files to PNG graphics (useful to create mathematical formulas as images).

Usage: $PRGM TEX_FILE
       $PRGM [OPTION]

Options:
    -h, --help      display this help and exit
    -v, --version   output version information and exit

Report bugs to <jd.jdhp@gmail.com>
EOFhelp
    exit 0
fi

# --version
if [  "$1" = "-v" -o "$1" = "--version" ]
then
	cat >&1 <<EOFversion
latex2png 1.0

Copyright (c) 2008 Jérémie DECOCK (http://www.jdhp.org)
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
EOFversion
    exit 0
fi

INPATH="$1"
INFILE=`basename "$INPATH"`


# Check given file ############################################################
if [ ! -f "$INPATH" -o ! -r "$INPATH" ]
then
	cat >&2 <<EOFwrongfile
Error: "$INPATH" is not a file or is not readable.

Usage: $PRGM TEX_FILE
       $PRGM [OPTION]

Options:
    -h, --help      display this help and exit
    -v, --version   output version information and exit
EOFwrongfile
	exit 2
fi


# Check extension and prepare file names ######################################
if echo "$INFILE" | egrep -q '\.tex$'
then
	# Set tmp files
	DVIFILE=`echo "$INFILE" | sed -r "s/\.tex$/\.dvi/"`
	AUXFILE=`echo "$INFILE" | sed -r "s/\.tex$/\.aux/"`
	LOGFILE=`echo "$INFILE" | sed -r "s/\.tex$/\.log/"`
	PNGFILE=`echo "$INFILE" | sed -r "s/\.tex$/\.png/"`
else
	cat >&2 <<EOFwrongext
Error: wrong file extension.

Usage: $PRGM TEX_FILE
       $PRGM [OPTION]

Options:
    -h, --help      display this help and exit
    -v, --version   output version information and exit
EOFwrongext
	exit 3
fi


# TODO : print latex errors except if '-q' is set #############################
latex -interaction=nonstopmode "$INPATH" 1> /dev/null 2>&1
dvipng -q -T tight -D 300 "$DVIFILE" -o "$PNGFILE" 1> /dev/null 2>&1

rm "$AUXFILE"
rm "$LOGFILE"
rm "$DVIFILE"
