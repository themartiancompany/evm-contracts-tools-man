# SPDX-License-Identifier: AGPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public
#    License along with this program.
#    If not, see <https://www.gnu.org/licenses/>.

_PROJECT=evm-contracts-tools
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

MAN_FILES=\
  $(wildcard *1.rst)

DOCS_FILES=\
  $(wildcard *.md)

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_EXE=\
  install \
    -vDm755
_INSTALL_DIR=\
  install \
    -vdm755

all:

install: install-doc install-man

install-doc:

	# $(INSTALL_FILE) \
	#   $(DOC_FILES) \
	#   -t \
	#   $(DOC_DIR)
	$(INSTALL_FILE) \
	  "README.md" \
	  -t \
	  $(DOC_DIR)/README.man.md

install-man:

	$(INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "$(_PROJECT_NPM).1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT_NPM).1"

.PHONY: install install-doc install-man
