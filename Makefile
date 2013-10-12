CC = g++ -Wall -g -O0
#CC = g++ -ansi -Wall -pedantic
#CFLAGS = -g -Wall -O3 -ffast-math -DHAVE_INLINE -DGSL_RANGE_CHECK_OFF
# CFLAGS = -g -Wall
LDFLAGS = -lgsl -lm -lgslcblas #-latlas

#GSL_INCLUDE = /u/chongw/libs/gsl/include
#GSL_LIB = /u/chongw/libs/gsl/lib

#vizcluster
GSL_INCLUDE = /home/richarde/public/include
GSL_LIB = /home/richarde/public/lib

#GSL_INCLUDE_MAC = /opt/local/include/
#GSL_LIB_MAC = /opt/local/lib/
GSL_INCLUDE_MAC = /usr/local/Cellar/gsl/1.15/include/
GSL_LIB_MAC = /usr/local/Cellar/gsl/1.15/lib/


LSOURCE = main.cpp utils.cpp stirln.cpp corpus.cpp state.cpp
LHEADER = utils.h stirln.h corpus.h state.h

mac: $(LSOURCE) $(HEADER)
	  $(CC) -I$(GSL_INCLUDE_MAC) -L$(GSL_LIB_MAC) $(LSOURCE) -o hdp $(LDFLAGS)

mac-d: $(LSOURCE) $(HEADER)
	  $(CC) -g -I$(GSL_INCLUDE_MAC) -L$(GSL_LIB_MAC) $(LSOURCE) -o hdp $(LDFLAGS)

linux: $(LSOURCE) $(HEADER)
	  $(CC) -I$(GSL_INCLUDE) -L$(GSL_LIB) $(LSOURCE) -o hdp $(LDFLAGS)

linux-d: $(LSOURCE) $(HEADER)
	  $(CC) -g -I$(GSL_INCLUDE) -L$(GSL_LIB) $(LSOURCE) -o hdp $(LDFLAGS)

all: mac mac-d

clean:
	-rm hdp
