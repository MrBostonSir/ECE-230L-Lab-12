module binary(
    input w, clk, reset,
    output z,
    output [2:0]states

);

wire Anext, Bnext, Cnext;
wire Astate, Bstate, Cstate;

    dff A(
    .Default(1'b0),
    .D(Anext),
    .clk(clk),
    .reset(reset),
    .Q(Astate)
    );
    
    dff B(
    .Default(1'b0),
    .D(Bnext),
    .clk(clk),
    .reset(reset),
    .Q(Bstate)
    );
    
    dff C(
    .Default(1'b0),
    .D(Cnext),
    .clk(clk),
    .reset(reset),
    .Q(Cstate)
    );
    
    assign Anext = ((Astate & ~Bstate & ~Cstate) | (~Astate & Bstate & Cstate)) & w;
    assign Bnext = ~Astate & ((w & ((Bstate & ~Cstate) | (~Bstate & Cstate) | (~Bstate & ~Cstate))) | (~w & (Bstate ^ Cstate)));
    assign Cnext = (Astate & ~Bstate & ~Cstate & ~w) | (~Astate & ((w & ((Bstate & ~Cstate) | (~Bstate & Cstate) | (~Bstate & ~Cstate))) | (~w & ((Bstate & Cstate) | (~Bstate & ~Cstate)))));
    
    assign states = {Astate, Bstate, Cstate};
    assign z = (Astate ^ Bstate) & (~Cstate);

endmodule