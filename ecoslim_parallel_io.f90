module parallel_io
    use mpi
    use create_subgrid, only: ix1,iy1,nnx1,nny1
contains
    subroutine pfb_parallel_read(value,fname,nx,ny,nz,offset)
        implicit none
        character(200):: fname
        integer:: nx,ny,nz
        real(8):: value(nx,ny,nz)
        integer:: fh, ierr
        integer(MPI_OFFSET_KIND):: offset

        call mpi_file_open(mpi_comm_world,fname,mpi_mode_rdonly,mpi_info_null,fh,ierr)
        call mpi_file_seek(fh,offset,mpi_seek_set,ierr)
        call mpi_file_read(fh,value(ix1+1:ix1+nnx1,iy1+1:iy1+nny1,1:nz),nnx1*nny1*nz, &
        mpi_double_precision,mpi_status_ignore,ierr)
        call mpi_file_close(fh,ierr)
        call mpi_allreduce(mpi_in_place,value,nx*ny*nz,mpi_double_precision, &
        mpi_sum,mpi_comm_world,ierr)

    end subroutine pfb_parallel_read

    subroutine pfb_parallel_write(value,fname,nx,ny,nz,offset)
        implicit none
        character(200):: fname
        integer:: nx,ny,nz
        real(8):: value(nx,ny,nz)
        integer:: fh, ierr
        integer(MPI_OFFSET_KIND):: offset

        call mpi_file_open(mpi_comm_world,fname,mpi_mode_wronly+mpi_mode_create, &
        mpi_info_null,fh,ierr)
        call mpi_file_seek(fh,offset,mpi_seek_set,ierr)
        call mpi_file_write(fh,value(ix1+1:ix1+nnx1,iy1+1:iy1+nny1,1:nz),nnx1*nny1*nz, &
        mpi_double_precision,mpi_status_ignore,ierr)
        call mpi_file_close(fh,ierr)

    end subroutine pfb_parallel_write

end module parallel_io