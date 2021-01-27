tableextension 50102 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50000; "Certificate Reference No."; Code[20])
        {
            Caption = 'Certificate Reference No.';
            DataClassification = CustomerContent;
            TableRelation = "Elevator Service Certificate" where("Elevator Serv. Certif. Posted" = CONST(False));
        }

    }

}