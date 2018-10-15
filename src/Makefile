
FC=ifort  -extend_source 132
# To make sure, codes lines after 72 or 80 won't profice any errors. 
FC=gfortran

all: clean cmp 

cmp: mod 
	$(FC) ngn2f90.f90 netgenNeutral.o -o ngn2f90.x

mod:
	$(FC) -c  parmkind.f90
	$(FC) -c  netgenNeutral.f90 

run:
	./ngn2f90.x

clean:
	rm -f *.o *.x *.mod ~* *.bak

