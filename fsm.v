module fsm(i,ck,r,o);
input i,ck,r;
output reg o;
parameter a=2'b00, b=2'b01, c=2'b10;
reg [1:0]ps,ns;

always@(posedge ck,posedge r)
begin
if(r==1)
ps<=a;
else
ps<=ns;
end  

always@(posedge i,posedge ps)
begin
case(ps)
a:begin
if(i==1)
begin
o<=0;
ns<=b;
end
else
begin
o<=0;
ns<=a;
end
end

b:begin
if(i==1)
begin
o<=0;
ns<=b;
end
else
begin
o<=0;
ns<=c;
end
end

c:begin
if(i==1)
begin
o<=1;
ns<=a;
end
else
begin
o<=0;
ns<=a;
end
end
endcase
end
endmodule

