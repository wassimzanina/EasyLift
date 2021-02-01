tableextension 50104 "CustLedgerEntry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Certificate Reference No."; Code[20])
        {
            Caption = 'Certificate Reference No.';
            DataClassification = CustomerContent;
            TableRelation = "Elevator Service Certificate";
        }
    }

}