tableextension 50103 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Certificate Reference No."; Code[20])
        {
            Caption = 'Certificate Reference No.';
            DataClassification = CustomerContent;
            TableRelation = "Elevator Service Certificate";
            Editable = false;
        }
    }

}