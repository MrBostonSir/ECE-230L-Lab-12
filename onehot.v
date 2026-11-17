module onehot (

input w, clk, reset,
output z,
output [4:0]states

);

    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;

    dff A (
    .Default(1'b1),
    .D(Anext),
    .clk(clk),
    .reset(reset),
    .Q(Astate)
    );
    
    dff B (
    .Default(1'b0),
    .D(Bnext),
    .clk(clk),
    .reset(reset),
    .Q(Bstate)
    );
    
    dff C (
    .Default(1'b0),
    .D(Cnext),
    .clk(clk),
    .reset(reset),
    .Q(Cstate)
    );
    
    dff D (
    .Default(1'b0),
    .D(Dnext),
    .clk(clk),
    .reset(reset),
    .Q(Dstate)
    );
    
    dff E (
    .Default(1'b0),
    .D(Enext),
    .clk(clk),
    .reset(reset),
    .Q(Estate)
    );
    
    assign Anext = 1'b0;
    assign Bnext = (Astate | Dstate | Estate) & (~w);
    assign Cnext = (Bstate | Cstate) & (~w);
    assign Dnext = (Astate | Bstate | Cstate) & w;
    assign Enext = (Dstate | Estate) & w;
    assign z = Cstate | Estate;
    assign states = {Estate, Dstate, Cstate, Bstate, Astate};

endmodule