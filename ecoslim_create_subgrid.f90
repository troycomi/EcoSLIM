module create_subgrid
    integer::nnx1,nny1,ix1,iy1,ppx,qqy
    contains
    subroutine gridinfo(nx,ny,rank)
        integer::nx,ny,rank
        integer::indexx,indexy

        indexx=mod(rank,ppx)+1
        indexy=rank/ppx+1

        nnx1=nx/ppx
        nny1=ny/qqy
        ix1=(indexx-1)*nnx1  !used to read pfb files
        iy1=(indexy-1)*nny1
        if(indexx==ppx) nnx1=nx/ppx+mod(nx,ppx)
        if(indexy==qqy) nny1=ny/qqy+mod(ny,qqy)

    end subroutine gridinfo
end module create_subgrid
