AvgOrdOfGroup := function(G)
local sum, g;
	sum := 0;
	for g in G do
		sum := sum + Order(g);
	od;
	return sum/Size(G);
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
