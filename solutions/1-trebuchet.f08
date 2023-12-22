program calibrate_trebuchet
    character(len=100) :: input_line
    character(len=10) :: digit_pair_str
    integer :: ios, i, first_digit, last_digit, digit_pair_int, running_sum

    logical :: fixture_exists
    integer :: io, stat

    ! handle opening fixture
    inquire(file="fixtures/1-trebuchet.txt", exist=fixture_exists)
    if (.not. fixture_exists) stop "Fixture does not exist."

    open(newunit=io, file="fixtures/1-trebuchet.txt", iostat=stat)
    if (stat /= 0) stop "Failed to open fixture."

    ! fixture exists, init running total sum
    running_sum = 0

    ! process each line into digit pairs
    do
        ! read line
        read(io, '(a)', iostat=ios) input_line
        if (ios /= 0) exit
        first_digit = 0
        last_digit = 0

        ! grab pairs
        do i = 1, len(trim(input_line))
            if (input_line(i:i) >= '0' .and. input_line(i:i) <= '9') then
                if (first_digit == 0) then
                    first_digit = i
                end if
                last_digit = i
            end if
        end do

        ! process pairs
        if (first_digit > 0 .and. last_digit > 0) then
            digit_pair_str = input_line(first_digit:first_digit) // input_line(last_digit:last_digit)
        else if (first_digit > 0) then
            digit_pair_str = input_line(first_digit:first_digit)
        else if (last_digit > 0) then
            digit_pair_str = input_line(last_digit:last_digit)
        else
            digit_pair_str = ''
        endif

        read(digit_pair_str, *)digit_pair_int

        running_sum = running_sum + digit_pair_int
    end do

    ! all digit_pair_ints added to total - print and close
    print*, running_sum
    close(io)
end program calibrate_trebuchet