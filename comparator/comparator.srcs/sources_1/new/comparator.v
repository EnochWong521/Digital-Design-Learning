`timescale 1ns / 1ps

module comparator();

    integer a, b;

    function compare (input integer a, input integer b);
        begin
            compare = (a == b);
        end
    endfunction
    
    initial begin
        $monitor("a = %d, b = %d, compare = %b", a, b, compare(a, b));
        a = 1;
        b = 99;
        #20;
        a = 20;
        b = 10;
        #20;
    end
endmodule
