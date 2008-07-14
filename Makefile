# $NetBSD: Makefile,v 1.1.2.3 2008/07/14 05:22:18 schmonz Exp $
#

DISTNAME=		wrapper-20080714
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://netbsd-soc.sourceforge.net/projects/cwrapper/
COMMENT=		GSoC project to replace pkgsrc/mk/wrapper

NO_CHECKSUM=		yes
NO_CONFIGURE=		yes
NO_BUILD=		yes

INSTALLATION_DIRS=	share/doc/${PKGBASE}

.include "tests.mk"

do-extract:
	${CP} -R ${FILESDIR} ${WRKSRC}

do-install:
	${INSTALL_DATA} ${WRKSRC}/TODO ${PREFIX}/share/doc/${PKGBASE}

.include "../../mk/bsd.pkg.mk"
