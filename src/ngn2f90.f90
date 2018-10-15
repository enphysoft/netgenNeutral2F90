program ngnToF90
   use parmkind
   use netgenNeutral
   implicit none
   integer(kind=ikind) :: inode, icell, iface
   integer(kind=ikind) :: N_ngn_Nodes, N_ngn_Cells, N_ngn_Faces
   character(kind=ckind,len=128)        :: NGNfile="cavity4dhd.ngn"
   integer                              :: idNGNfile=11
   type(ngn_node), allocatable :: cavity_node(:)
   type(ngn_cell), allocatable :: cavity_cell(:)
   type(ngn_face), allocatable :: cavity_face(:)

   !
   call read_netgenNeutral_element_number (NGNfile,N_ngn_Nodes,N_ngn_Cells,N_ngn_Faces)
   allocate(cavity_node(N_ngn_Nodes),cavity_cell(N_ngn_Cells),cavity_face(N_ngn_Faces))

   open(unit=11, file=NGNfile, status="old")

   ! reading node number and positions
      call skip_lines (idNGNfile,1)
      NodesLoop: do inode = 1, N_ngn_Nodes
         read(idNGNfile,*) cavity_node(inode)%postn(1:3)
      enddo NodesLoop

   ! reading cell number and indices
      call skip_lines (idNGNfile,1)
      CellsLoop: do icell = 1, N_ngn_Cells
         read(11,*) cavity_cell(icell)%nsubd, cavity_cell(icell)%nidx(1:4)
      enddo CellsLoop

   ! reading face number and indices
      call skip_lines (idNGNfile,1)
      FacesLoop: do iface = 1, N_ngn_Faces
         read(11,*) cavity_face(iface)%nbcno, cavity_face(iface)%nidx(1:3)
      enddo FacesLoop

   close(11)
      
   write(*,*) cavity_node(N_ngn_Nodes)%postn(1:3)
   write(*,*) cavity_cell(N_ngn_Cells)%nsubd, cavity_cell(N_ngn_Cells)%nidx(1:4)
   write(*,*) cavity_face(N_ngn_faces)%nbcno, cavity_face(N_ngn_faces)%nidx(1:3)

end program ngnToF90


