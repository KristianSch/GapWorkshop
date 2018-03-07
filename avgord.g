AvgOrdOfGroup := function(G)
local sum, g;
	sum := 0;
	for g in G do
		sum := sum + Order(g);
	od;
	return sum/Size(G);
end;


#AvgOrdOfGroup := function(G)
#local cc, sum, c;
#cc:=ConjugacyClasses(G);
#sum:=0;
#for c in cc do
#  sum := sum + Order( Representative(c) ) * Size(cc);
#od;
#return sum/Size(G);
#end;


TestOneGroup := G -> IsInt( AvgOrdOfGroup(G) );


TestOneOrder := function(f,n)
local i, G;
for i in [1..NrSmallGroups(n)] do
  Print(n, ":", i, "/", NrSmallGroups(n), "\r");
  G := SmallGroup( n, i );
  if f(G) then
    Print("\n");
    return [n,i];
  fi;
od;
Print("\n");
return fail;
end;


TestAllOrders:=function(f,n)
local i, res;
for i in [200..n] do
  res:=TestOneOrder(f,i);
  if res <> fail then
    return res;
  fi;
od;
return fail;
end;


TestRangeOfOrders:=function(f,n1,n2)
local n, res;
for n in [n1..n2] do
  if not IsPrimePowerInt(n) then
     res:=TestOneOrder(f,n);
     if res <> fail then
       return res;
     fi;
   fi;
od;
return fail;
end;






AvgOrdOfGroupCom := function(G)
local g, h, komm, komms;
	komms := [];
	for g in G do
		for h in G do
			komm := g*h*g^(-1)*h^(-1);
			AddSet(komms, komm);
		od;
	od;
	return Sum(List(komms, Order))/Length(komms);
end;
