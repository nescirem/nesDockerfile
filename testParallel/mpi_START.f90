!******************************************************************************
!
! Licensing:
!
!   This code is distributed under the MIT license. 
!
! Modified:
!
!   24 April 2019
!
! Author:
!
!   Nescirem
!
!==============================================================================
!
!>S mpi_start
!
!   Initializes parallel execution.
!
    
    subroutine mpi_start
        
        !mpi unit
        use mpi_mod
        !output unit
        use,intrinsic       :: iso_fortran_env,only: error_unit,output_unit  
        
        implicit none
        
        !whether all threads are allowed to make MPI calls
        !-----------------------------------------------------------------------------------------------
        !   MPI_THREAD_SINGLE  | 0 | multi-thread is not supported in MPI process.                      |
        !  MPI_THREAD_FUNNELED | 1 | only main thread in each process can make MPI calls.               |
        ! MPI_THREAD_SERIALIZED| 2 | multiple threads may make MPI calls, but only one at a time.       |
        !  MPI_THREAD_MULTIPLE | 3 | multiple threads may call MPI, with no restrictions.               |
        !-----------------------------------------------------------------------------------------------
        
        !cheack thread safe mode
        call mpi_init_thread( required,provided,err )
        if ( provided<required ) then
            write( error_unit,'(A,I2,A)' ) 'Required MPI thread safe mode',required,' is not supported.'
            stop
        endif
        !get current processor number
        call mpi_comm_rank( mpi_comm_world,pid,err )
        !count in fortran style
        myid = pid+1
        !get number of processors
        call mpi_comm_size( mpi_comm_world,num_p,err )
        
        if ( num_p==1 ) then !If only one process is given, this test makes no sense
            num_p = 0
            myid = 0
            write ( error_unit,'(A)' ) &
                'Execute serially makes no sense.'
            call sleep( 2 )
            stop
        else !if( num_p/=1 ) !assign the neighbour id of each process
            num_slave = num_p-1
            if ( pid==root ) then
                myleft = num_slave
                myright = myid
            elseif ( pid==num_slave ) then
                myleft = pid-1
                myright = root
            else
                myleft = pid-1
                myright = myid
            endif
        endif
        
    end subroutine mpi_start
