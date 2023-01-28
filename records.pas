unit records;

interface


Type

TCredit = record
  Nnum_credit : integer;
	Scod_credit ,
	Sdate_debloc : string;
	Rmontant_credit ,
	Rmontant_paye ,
	Rsolde_old ,
	Rinteret_calc ,
	Rsolde : real;
	Scod_client ,
	Scompte_client ,
	Snom_client ,
	Scode_gest ,
	Sgest_old ,
	Sdate_radie : string;
end;
TCreditArray = array of TCredit;

implementation


end.
