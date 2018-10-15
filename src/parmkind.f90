module parmkind ! Type kind paramters 
  implicit none
  private
  public :: rkind, ikind, ckind
  integer   ,parameter :: rdigits=8
  integer   ,parameter :: idigits=8
  integer   ,parameter :: idigits4=4
  integer   ,parameter :: rkind=8, ikind=4, ikind4=4, ckind=1
end module
