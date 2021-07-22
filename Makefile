#gfortran -o ~/.local/bin/plotres plotres.f -lcpgplot -lpgplot -lX11 -lm
#gfortran -o ~/.local/bin/plotres_ps plotres_ps.f -lcpgplot -lpgplot -lX11 -lm 


#  Makefile for PRESTO
#   by Scott M. Ransom

# OS type
OS = Linux

UNAME = $(shell uname)

# Linux is the first choice
ifeq ($(OS),Linux)
        LIBSUFFIX = .so
        LIBCMD = -shared
# else assume Darwin (i.e. OSX) 
else
        LIBSUFFIX = .dylib
        LIBCMD = -dynamiclib
endif

# How to link with some needed libraries of PGPLOT
X11LINK := $(shell pkg-config --libs x11)
PNGLINK := $(shell pkg-config --libs libpng)

FC = gfortran

# Include and link information for PGPLOT v5.X (including shared libs!)
# Typically you need to have your PGPLOT_DIR environment variable set
PGPLOTINC = -I$(PGPLOT_DIR)
PGPLOTLINK = -L$(PGPLOT_DIR) -lcpgplot -lpgplot $(X11LINK) $(PNGLINK)


#gfortran -o ~/.local/bin/plotres plotres.f -lcpgplot -lpgplot -lX11 -lm
plotres: 
	$(FC) -o ~/.local/bin/$@ plotres.f $(PGPLOTLINK) -lm -lX11


#gfortran -o ~/.local/bin/plotres_ps plotres_ps.f -lcpgplot -lpgplot -lX11 -lm 
plotres_ps: 
	$(FC) -o ~/.local/bin/$@ plotres.f $(PGPLOTLINK) -lm -lX11
