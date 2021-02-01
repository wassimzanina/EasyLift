pageextension 50102 "SalesInvoice" extends "Sales Invoice"
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