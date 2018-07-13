program firsth5
   use hdf5
   implicit none
   
   integer(HID_T) :: file_id, dset_id, dspace_id
   integer(HSIZE_T) :: dims0(1), dims1(1), dims2(2)
   integer :: error,i,j,N
   real(kind=8), dimension(50) :: x
   real(kind=8), dimension(50, 50) :: y
   character(len=256) :: filename, dsetname
   
   filename = 'test1.h5'
   dims0(1) = 1
   dims1(1) = 50
   dims2(1) = 50
   dims2(2) = 50
   
   N=50
   do i=1,50
      x(i) = dble(i)
      do j=1,50
         y(i, j) = dble(j) * x(i)
      end do
   end do



   call h5open_f(error)   ! <-- Open HDF5 instance
   call h5fcreate_f(trim(filename), H5F_ACC_TRUNC_F, file_id, error) ! <-- Crate HDF5 file
   call h5fopen_f(trim(filename), H5F_ACC_RDWR_F, file_id, error)    ! <-- Opening file

   !
   !    Saving an integer scalar
   !
   call h5screate_simple_f(1, dims0, dspace_id, error)                              ! <-- Create data set space
   call h5dcreate_f(file_id, 'size', H5T_NATIVE_INTEGER, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_INTEGER, N, dims0, error)                    ! <-- Write array
   call h5dclose_f(dset_id, error)                                                  ! <-- Close data set
   call h5sclose_f(dspace_id, error)                                                ! <-- Close space
   
   !
   !    Saving a 1D real array
   !
   call h5screate_simple_f(1, dims1, dspace_id, error)                        ! <-- Create data set space
   call h5dcreate_f(file_id, 'x', H5T_NATIVE_REAL, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_REAL, x, dims1, error)                 ! <-- Write array
   call h5dclose_f(dset_id, error)                                            ! <-- Close data set
   call h5sclose_f(dspace_id, error)

   !
   !    Saving a 2D real array
   !
   call h5screate_simple_f(2, dims2, dspace_id, error)                        ! <-- Create data set space
   call h5dcreate_f(file_id, 'y', H5T_NATIVE_REAL, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_REAL, y, dims2, error)                 ! <-- Write array
   call h5dclose_f(dset_id, error)                                            ! <-- Close data set
   call h5sclose_f(dspace_id, error)

   !
   !    Close HDF5 file
   !
   call h5fclose_f(file_id, error) ! <--- Closing HDF5 file
   call h5close_f(error)           ! <--- Closing HDF5

   !
   ! TODO Saving 2D arrays for different times
   ! TODO Include attributes vs wide labels

end program firsth5
