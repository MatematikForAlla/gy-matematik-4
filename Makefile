# $Id$
# Author:	Daniel Bosk <daniel@bosk.se>
# Date:		5 Aug 2013

SERVER= 	secure.itm.miun.se
PUBDIR= 	/home/danbos/www
CATEGORY= 	pub

DOCUMENTS=	matematik-4.pdf
FILES=		matematik-4.tex frontmatter.tex backmatter.tex matematik-4.bib
FILES+= 	preface.tex
FILES+= 	intro.tex
FILES+= 	komplexatal.tex komplexrot.tex
FILES+= 	trigonometri.tex
FILES+= 	funktioner.tex derivering.tex integrering.tex
FILES+= 	differentialekv.tex

USE_LATEXMK= 	yes
USE_BIBLATEX= 	yes

matematik-4.pdf matematik-4.ps: ${FILES}

clean:
	${RM} figs/*-converted-to.pdf
	${RM} matematik-4-1.asy matematik-4-1.pdf matematik-4.pre

miun.depend.mk:
ifeq (${MAKE},gmake)
	lynx -dump http://ver.miun.se/build/$@ > $@
else
	wget http://ver.miun.se/build/$@
endif

include miun.depend.mk
include miun.docs.mk
