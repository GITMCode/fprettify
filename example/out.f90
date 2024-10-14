program demo
  integer :: endif, if, elseif
  integer, DIMENSION(2) :: function
  endif = 3; if = 2
  if (endif == 2) then
    endif = 5
    elseif = if + 4*(endif + &
                     2**10)
  elseif (endif == 3) then
    function(if) = endif/elseif
    print *, endif
    write(*, *) "something"
  endif

  endIF
endDO
endif
enddo
end SELECT
end ASSOCIATE
end BLOCK
end FUNCTION
end MODULE
end SUBMODULE
end TYPE
end PROGRAM
end INTERFACE
end ENUM
end WHERE
end FORALL

end program
