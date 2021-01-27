pageextension 50107 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Contact")
        {
            field("Certificate Reference No."; Rec."Certificate Reference No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}