program firsth5
   use hdf5
   implicit none
   
   real(kind=8), allocatable, dimension(:) :: x,y
   
   N = 50
   
   allocate(x(N), y(N), dy(N))
   
   do i=0,N
      x(i) = real(i, 8) * 3.1416 / real(N, 8)
      y(i) = sin(x(i))
      dy(i) = cos(x(i))
   end do

   y = sin(x)
   dydx = cos(x)
   
   
end program firsth5
