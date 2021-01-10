module create_subgrid
    contains
    subroutine gridinfo(grid,nx,ny,ppx,qqy)
        integer::grid(:,:)
        integer::nx,ny,ppx,qqy
        integer::i,j,ncount
        integer::nnx(ppx),nny(qqy)

        nnx(:)=nx/ppx
        nnx(ppx)=nx/ppx+mod(nx,ppx)
        nny(:)=ny/qqy
        nny(qqy)=ny/qqy+mod(ny,qqy)

        ncount=0
        do j=1,qqy
            do i=1,ppx
                ncount=ncount+1
                if(i>1) then
                    grid(ncount,1)=1+sum(nnx(1:i-1))
                else
                    grid(ncount,1)=1
                endif
                if(j>1) then
                    grid(ncount,2)=1+sum(nny(1:j-1))
                else
                    grid(ncount,2)=1
                endif
                grid(ncount,3)=nnx(i)
                grid(ncount,4)=nny(j)
            end do
        end do

    end subroutine gridinfo
end module create_subgrid
