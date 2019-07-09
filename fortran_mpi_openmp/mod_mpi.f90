!******************************************************************************
!
! Licensing:
!
!   This code is distributed under the MIT license. 
!
! Modified:
!
!   22 April 2019
!
! Author:
!
!   Nescirem
!
!==============================================================================
!
!>M mpi_mod
!
    
    module mpi_mod
    
        implicit none
    
        !use mpi
        include 'mpif.h'

    
        integer             :: required,provided
        integer,parameter   :: root = 0
        integer             :: istat( mpi_status_size )
        integer             :: num_p,num_slave
        integer             :: err
        integer             :: pid,myid,myleft,myright
        integer             :: p_namelen
        character(len=64)   :: p_name
    
    end module mpi_mod
