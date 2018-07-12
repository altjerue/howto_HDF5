program firsth5
   use hdf5
   implicit none
   
   integer(HID_T) :: file_id, dset_id, dspace_id
   integer(HSIZE_T), dimension(1) :: dims
   integer :: error,N,i
   real(kind=8), dimension(50) :: x,y,dy
   character(len=256) :: filename, dsetname
   
   N = 50
   filename = 'test1.h5'
   dims(1) = 50
   
!   allocate(x(N), y(N), dy(N))
   
   do i=1,50
      x(i) = dble(i) !  * 3.1416 / real(N, 8)
      y(i) = x(i)
      dy(i) = 2.0 * x(i)
   end do

!   y = sin(x)
!   dy = cos(x)
   
   call h5open_f(error)   ! <-- Open HDF5 instance
   call h5fcreate_f(trim(filename), H5F_ACC_TRUNC_F, file_id, error) ! <-- Crate HDF5 file
   call h5fopen_f(trim(filename), H5F_ACC_RDWR_F, file_id, error) ! <-- Opening file

   !!!! >>>> Saving x <<<<<
   call h5screate_simple_f(1, dims, dspace_id, error) ! <-- Create data set space
   call h5dcreate_f(file_id, 'x', H5T_NATIVE_REAL, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_REAL, x, dims, error)
   call h5dclose_f(dset_id, error) ! <-- Close data set
   call h5sclose_f(dspace_id, error)

   !!!! >>>> Saving y <<<<<
   call h5screate_simple_f(1, dims, dspace_id, error) ! <-- Create data set space
   call h5dcreate_f(file_id, 'y', H5T_NATIVE_REAL, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_REAL, y, dims, error)
   call h5dclose_f(dset_id, error) ! <-- Close data set
   call h5sclose_f(dspace_id, error)

   !!!! >>>> Saving dy <<<<<
   call h5screate_simple_f(1, dims, dspace_id, error) ! <-- Create data set space
   call h5dcreate_f(file_id, 'dy', H5T_NATIVE_REAL, dspace_id, dset_id, error) ! <-- Create data set
   call h5dwrite_f(dset_id, H5T_NATIVE_REAL, dy, dims, error)
   call h5dclose_f(dset_id, error) ! <-- Close data set
   call h5sclose_f(dspace_id, error)


   call h5fclose_f(file_id, error)
   call h5close_f(error) ! <---

end program firsth5
