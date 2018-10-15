module netgenNeutral
   use parmkind
   type ngn_node
      real(rkind)  :: postn(3)
   end type ngn_node
   type ngn_cell
      integer(ikind) :: nsubd, nidx(4)
   end type ngn_cell
   type ngn_face
      integer(ikind) :: nbcno, nidx(3)
   end type ngn_face

contains

   subroutine read_netgenNeutral_element_number (ngnfile,N_ngn_Nodes,N_ngn_Cells,N_ngn_Faces)
      implicit none
      character(len=128)        :: ngnfile
      integer, intent(out)      :: N_ngn_Nodes, N_ngn_Cells, N_ngn_Faces
      integer :: idfile= 9001
      open(unit=idfile, file=ngnfile, status="old")
      read(idfile,*) N_ngn_Nodes    ; call skip_lines (idfile, N_ngn_Nodes)
      read(idfile,*) N_ngn_Cells    ; call skip_lines (idfile, N_ngn_Cells)
      read(idfile,*) N_ngn_Faces    ; call skip_lines (idfile, N_ngn_Faces)
      close(unit=idfile)
      write(*,*)  "N_ngn_Nodes = ", N_ngn_Nodes
      write(*,*)  "N_ngn_Cells = ", N_ngn_Cells
      write(*,*)  "N_ngn_Faces = ", N_ngn_Faces
      return
   end subroutine read_netgenNeutral_element_number
   
   
   !
   subroutine skip_lines (idfile, numlines)
      implicit none
      integer(kind=ikind), intent(in) :: numlines
      integer(kind=ikind), intent(in) :: idfile !=9001
      integer(kind=ikind) :: i
      ! open(unit=idfile, file=inputfile, status="old")
      do i = 1,  numlines
         read(idfile,*)
      enddo
      return
   end subroutine skip_lines

end module netgenNeutral
