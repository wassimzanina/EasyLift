pageextension 50106 SalesInvoiceListExt extends "Sales Invoice List"
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